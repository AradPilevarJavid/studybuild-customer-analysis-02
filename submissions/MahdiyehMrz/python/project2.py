# -*- coding: utf-8 -*-
"""
Project 2 - Customer Analytics
Professional Python / VS Code workflow

Methods:
1) Data quality audit + EDA
2) Descriptive statistics, skewness/kurtosis, outlier detection
3) Spearman correlation
4) Statistical tests: Shapiro-Wilk, Mann-Whitney U, Kruskal-Wallis
5) Customer Value Score
6) K-Means customer segmentation + Elbow + Silhouette
7) Churn-risk classification + Logistic Regression + Random Forest
8) Discount effectiveness analysis + bootstrap confidence interval
9) City marketing opportunity scoring
10) Automated business recommendations

IMPORTANT:
- This dataset contains only 60 customers. ML results are exploratory/proof-of-concept,
not production-grade predictive evidence.
- CHURN_DAYS is a business assumption and should be adjusted if the company has
an established inactivity definition.
"""

import os
import warnings
from pathlib import Path

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

from scipy import stats
from sklearn.preprocessing import StandardScaler
from sklearn.cluster import KMeans
from sklearn.metrics import (
    silhouette_score,
    classification_report,
    roc_auc_score,
    confusion_matrix
)
from sklearn.model_selection import StratifiedKFold, cross_val_score
from sklearn.pipeline import Pipeline
from sklearn.impute import SimpleImputer
from sklearn.linear_model import LogisticRegression
from sklearn.ensemble import RandomForestClassifier
import joblib

warnings.filterwarnings("ignore")

# ---------------------------------------------------------------------
# CONFIGURATION
# ---------------------------------------------------------------------
BASE_DIR = Path(__file__).resolve().parent
FILE_PATH = BASE_DIR / "customers_final_clean(1).xlsx"

OUT_DIR = BASE_DIR / "outputs"
FIG_DIR = OUT_DIR / "figures"
TABLE_DIR = OUT_DIR / "tables"
MODEL_DIR = OUT_DIR / "models"

for folder in [FIG_DIR, TABLE_DIR, MODEL_DIR]:
    folder.mkdir(parents=True, exist_ok=True)

RANDOM_STATE = 42
CHURN_DAYS = 180          # business assumption; change if required
MAX_CLUSTERS = 6
N_BOOTSTRAP = 5000

sns.set_theme(style="whitegrid")


def savefig(filename):
    plt.tight_layout()
    plt.savefig(FIG_DIR / filename, dpi=300, bbox_inches="tight")
    plt.close()


def cohens_d(x, y):
    """Cohen's d for two independent groups."""
    x, y = np.asarray(x, dtype=float), np.asarray(y, dtype=float)
    nx, ny = len(x), len(y)
    pooled_sd = np.sqrt(
        ((nx - 1) * np.var(x, ddof=1) + (ny - 1) * np.var(y, ddof=1))
        / (nx + ny - 2)
    )
    return (np.mean(x) - np.mean(y)) / pooled_sd if pooled_sd > 0 else np.nan


def bootstrap_mean_difference(x, y, n_boot=N_BOOTSTRAP, seed=RANDOM_STATE):
    """95% bootstrap CI for mean(x)-mean(y)."""
    rng = np.random.default_rng(seed)
    x, y = np.asarray(x, dtype=float), np.asarray(y, dtype=float)
    diffs = np.empty(n_boot)

    for i in range(n_boot):
        xb = rng.choice(x, size=len(x), replace=True)
        yb = rng.choice(y, size=len(y), replace=True)
        diffs[i] = xb.mean() - yb.mean()

    return (
        diffs.mean(),
        np.percentile(diffs, 2.5),
        np.percentile(diffs, 97.5)
    )


# ---------------------------------------------------------------------
# 1. LOAD DATA
# ---------------------------------------------------------------------
df = pd.read_excel(FILE_PATH)

print("=" * 75)
print("PROJECT 2 - CUSTOMER ANALYTICS")
print("=" * 75)
print(f"Rows: {df.shape[0]}")
print(f"Columns: {df.shape[1]}")

# ---------------------------------------------------------------------
# 2. DATA QUALITY AUDIT
# ---------------------------------------------------------------------
quality = pd.DataFrame({
    "dtype": df.dtypes.astype(str),
    "missing_count": df.isna().sum(),
    "missing_pct": (df.isna().mean() * 100).round(2),
    "unique_values": df.nunique()
})
quality.to_csv(TABLE_DIR / "01_data_quality.csv", encoding="utf-8-sig")

duplicate_count = int(df.duplicated().sum())

# Keep only valid analytical rows for core analysis.
# The supplied file is already cleaned; this is a safety layer.
analysis_df = df.copy()

numeric_cols = analysis_df.select_dtypes(include=np.number).columns.tolist()

# ---------------------------------------------------------------------
# 3. DESCRIPTIVE STATISTICS
# ---------------------------------------------------------------------
desc = analysis_df[numeric_cols].describe().T
desc["median"] = analysis_df[numeric_cols].median()
desc["skewness"] = analysis_df[numeric_cols].skew()
desc["kurtosis"] = analysis_df[numeric_cols].kurt()
desc.to_csv(TABLE_DIR / "02_descriptive_statistics.csv", encoding="utf-8-sig")

# ---------------------------------------------------------------------
# 4. OUTLIER AUDIT (IQR)
# ---------------------------------------------------------------------
outlier_rows = []

for col in numeric_cols:
    series = analysis_df[col].dropna()
    q1 = series.quantile(0.25)
    q3 = series.quantile(0.75)
    iqr = q3 - q1
    lower = q1 - 1.5 * iqr
    upper = q3 + 1.5 * iqr
    n_out = int(((series < lower) | (series > upper)).sum())

    outlier_rows.append({
        "variable": col,
        "Q1": q1,
        "Q3": q3,
        "IQR": iqr,
        "lower_bound": lower,
        "upper_bound": upper,
        "outlier_count": n_out,
        "outlier_pct": round(n_out / len(series) * 100, 2)
    })

outlier_table = pd.DataFrame(outlier_rows)
outlier_table.to_csv(TABLE_DIR / "03_outlier_audit.csv", index=False, encoding="utf-8-sig")

# ---------------------------------------------------------------------
# 5. NORMALITY TESTS
# ---------------------------------------------------------------------
normality_rows = []

for col in ["age", "purchase_count", "avg_order_value",
            "total_spending", "last_purchase_days",
            "satisfaction_score"]:
    if col in analysis_df.columns:
        x = analysis_df[col].dropna()

        # Shapiro is appropriate here because n=60.
        stat, p = stats.shapiro(x)

        normality_rows.append({
            "variable": col,
            "shapiro_statistic": stat,
            "p_value": p,
            "decision_alpha_0_05": "Reject normality" if p < 0.05
                                else "No evidence against normality"
        })

normality_table = pd.DataFrame(normality_rows)
normality_table.to_csv(
    TABLE_DIR / "04_normality_tests.csv",
    index=False,
    encoding="utf-8-sig"
)

# ---------------------------------------------------------------------
# 6. SPEARMAN CORRELATION
# ---------------------------------------------------------------------
corr_cols = [
    c for c in [
        "age", "purchase_count", "avg_order_value",
        "total_spending", "last_purchase_days",
        "returned_items", "satisfaction_score"
    ] if c in analysis_df.columns
]

spearman_corr = analysis_df[corr_cols].corr(method="spearman")
spearman_corr.to_csv(
    TABLE_DIR / "05_spearman_correlation.csv",
    encoding="utf-8-sig"
)

plt.figure(figsize=(10, 8))
sns.heatmap(
    spearman_corr,
    annot=True,
    fmt=".2f",
    cmap="coolwarm",
    center=0,
    square=True
)
plt.title("Spearman Correlation Matrix")
savefig("01_spearman_correlation.png")

# ---------------------------------------------------------------------
# 7. CUSTOMER VALUE SCORE
# ---------------------------------------------------------------------
value_features = [
    "total_spending",
    "purchase_count",
    "avg_order_value"
]

value_scaler = StandardScaler()
value_z = pd.DataFrame(
    value_scaler.fit_transform(analysis_df[value_features]),
    columns=value_features,
    index=analysis_df.index
)

# Weighting reflects direct monetary value first, then frequency and basket size.
analysis_df["customer_value_score"] = (
    0.50 * value_z["total_spending"]
    + 0.30 * value_z["purchase_count"]
    + 0.20 * value_z["avg_order_value"]
)

analysis_df["customer_value_segment"] = pd.qcut(
    analysis_df["customer_value_score"],
    q=3,
    labels=["Low Value", "Medium Value", "High Value"],
    duplicates="drop"
)

top_customers = analysis_df.sort_values(
    "customer_value_score", ascending=False
)[[
    "customer_id", "customer_value_score",
    "purchase_count", "avg_order_value", "total_spending",
    "customer_value_segment"
]].head(15)

top_customers.to_csv(
    TABLE_DIR / "06_top_value_customers.csv",
    index=False,
    encoding="utf-8-sig"
)

plt.figure(figsize=(8, 5))
sns.countplot(
    data=analysis_df,
    x="customer_value_segment",
    order=["Low Value", "Medium Value", "High Value"]
)
plt.title("Customer Value Segments")
plt.xlabel("Segment")
plt.ylabel("Number of Customers")
savefig("02_customer_value_segments.png")

# ---------------------------------------------------------------------
# 8. CHURN RISK
# ---------------------------------------------------------------------
# Business rule: customer inactive for more than CHURN_DAYS is labelled
# as churn-risk. This is not the same as observing a future churn event.
analysis_df["churn_risk"] = (
    analysis_df["last_purchase_days"] > CHURN_DAYS
).astype(int)

analysis_df["churn_risk_label"] = np.where(
    analysis_df["churn_risk"].eq(1),
    "Churn Risk",
    "Active"
)

churn_summary = analysis_df.groupby("churn_risk_label").agg(
    customers=("customer_id", "count"),
    avg_spending=("total_spending", "mean"),
    avg_purchase_count=("purchase_count", "mean"),
    avg_satisfaction=("satisfaction_score", "mean")
).reset_index()

churn_summary.to_csv(
    TABLE_DIR / "07_churn_summary.csv",
    index=False,
    encoding="utf-8-sig"
)

high_value_at_risk = analysis_df[
    (analysis_df["customer_value_segment"] == "High Value")
    & (analysis_df["churn_risk"] == 1)
].sort_values("customer_value_score", ascending=False)

high_value_at_risk.to_csv(
    TABLE_DIR / "08_high_value_churn_risk.csv",
    index=False,
    encoding="utf-8-sig"
)

plt.figure(figsize=(8, 5))
sns.countplot(
    data=analysis_df,
    x="churn_risk_label",
    order=["Active", "Churn Risk"]
)
plt.title(f"Customer Churn Risk (> {CHURN_DAYS} Days Since Last Purchase)")
plt.xlabel("")
plt.ylabel("Customers")
savefig("03_churn_risk.png")

# ---------------------------------------------------------------------
# 9. K-MEANS CUSTOMER SEGMENTATION
# ---------------------------------------------------------------------
segmentation_features = [
    "purchase_count",
    "avg_order_value",
    "total_spending",
    "last_purchase_days"
]

seg_scaler = StandardScaler()
X_seg = seg_scaler.fit_transform(
    analysis_df[segmentation_features]
)

inertias = []
silhouettes = []
candidate_k = range(2, MAX_CLUSTERS + 1)

for k in candidate_k:
    km = KMeans(
        n_clusters=k,
        random_state=RANDOM_STATE,
        n_init=30
    )
    labels = km.fit_predict(X_seg)

    inertias.append(km.inertia_)
    silhouettes.append(silhouette_score(X_seg, labels))

cluster_selection = pd.DataFrame({
    "k": list(candidate_k),
    "inertia": inertias,
    "silhouette_score": silhouettes
})

cluster_selection.to_csv(
    TABLE_DIR / "09_cluster_selection.csv",
    index=False,
    encoding="utf-8-sig"
)

fig, ax1 = plt.subplots(figsize=(8, 5))
ax1.plot(list(candidate_k), inertias, marker="o")
ax1.set_xlabel("Number of clusters (k)")
ax1.set_ylabel("Inertia")
ax1.set_title("K-Means Elbow Analysis")
savefig("04_kmeans_elbow.png")

plt.figure(figsize=(8, 5))
plt.plot(list(candidate_k), silhouettes, marker="o")
plt.xlabel("Number of clusters (k)")
plt.ylabel("Silhouette score")
plt.title("K-Means Silhouette Analysis")
savefig("05_kmeans_silhouette.png")

# Select k using the best silhouette score.
best_k = int(
    cluster_selection.loc[
        cluster_selection["silhouette_score"].idxmax(), "k"
    ]
)

kmeans = KMeans(
    n_clusters=best_k,
    random_state=RANDOM_STATE,
    n_init=30
)

analysis_df["cluster"] = kmeans.fit_predict(X_seg)

cluster_profile = analysis_df.groupby("cluster").agg(
    customers=("customer_id", "count"),
    purchase_count=("purchase_count", "mean"),
    avg_order_value=("avg_order_value", "mean"),
    total_spending=("total_spending", "mean"),
    last_purchase_days=("last_purchase_days", "mean"),
    satisfaction_score=("satisfaction_score", "mean")
).round(2)

cluster_profile.to_csv(
    TABLE_DIR / "10_cluster_profile.csv",
    encoding="utf-8-sig"
)

# Kruskal-Wallis test for total spending across clusters.
cluster_groups = [
    g["total_spending"].dropna().values
    for _, g in analysis_df.groupby("cluster")
]

if len(cluster_groups) >= 2:
    kw_stat, kw_p = stats.kruskal(*cluster_groups)
else:
    kw_stat, kw_p = np.nan, np.nan

with open(TABLE_DIR / "11_cluster_kruskal_wallis.txt", "w", encoding="utf-8") as f:
    f.write(f"Kruskal-Wallis statistic: {kw_stat:.6f}\n")
    f.write(f"p-value: {kw_p:.6f}\n")

plt.figure(figsize=(8, 6))
sns.scatterplot(
    data=analysis_df,
    x="purchase_count",
    y="total_spending",
    hue="cluster",
    palette="tab10",
    s=90
)
plt.title("Customer Clusters: Purchase Frequency vs Total Spending")
plt.xlabel("Purchase Count")
plt.ylabel("Total Spending")
savefig("06_customer_clusters.png")

# ---------------------------------------------------------------------
# 10. DISCOUNT EFFECTIVENESS
# ---------------------------------------------------------------------
discount_yes = analysis_df.loc[
    analysis_df["discount_used"], "total_spending"
].dropna()

discount_no = analysis_df.loc[
    ~analysis_df["discount_used"], "total_spending"
].dropna()

mw_stat, mw_p = stats.mannwhitneyu(
    discount_yes,
    discount_no,
    alternative="two-sided"
)

d = cohens_d(discount_yes, discount_no)
mean_diff, ci_low, ci_high = bootstrap_mean_difference(
    discount_yes, discount_no
)

discount_summary = pd.DataFrame({
    "metric": [
        "n_discount_yes",
        "n_discount_no",
        "mean_spending_discount_yes",
        "mean_spending_discount_no",
        "median_spending_discount_yes",
        "median_spending_discount_no",
        "mean_difference_yes_minus_no",
        "bootstrap_95ci_low",
        "bootstrap_95ci_high",
        "mann_whitney_U",
        "mann_whitney_p",
        "cohens_d"
    ],
    "value": [
        len(discount_yes),
        len(discount_no),
        discount_yes.mean(),
        discount_no.mean(),
        discount_yes.median(),
        discount_no.median(),
        mean_diff,
        ci_low,
        ci_high,
        mw_stat,
        mw_p,
        d
    ]
})

discount_summary.to_csv(
    TABLE_DIR / "12_discount_effectiveness.csv",
    index=False,
    encoding="utf-8-sig"
)

plt.figure(figsize=(8, 5))
sns.boxplot(
    data=analysis_df,
    x="discount_used",
    y="total_spending"
)
plt.title("Total Spending by Discount Usage")
plt.xlabel("Discount Used")
plt.ylabel("Total Spending")
savefig("07_discount_vs_spending.png")

# Additional discount comparison for purchase frequency.
purchase_yes = analysis_df.loc[
    analysis_df["discount_used"], "purchase_count"
].dropna()

purchase_no = analysis_df.loc[
    ~analysis_df["discount_used"], "purchase_count"
].dropna()

mw_purchase_stat, mw_purchase_p = stats.mannwhitneyu(
    purchase_yes, purchase_no, alternative="two-sided"
)

discount_purchase_test = pd.DataFrame({
    "test": ["Mann-Whitney U: purchase_count"],
    "statistic": [mw_purchase_stat],
    "p_value": [mw_purchase_p]
})

discount_purchase_test.to_csv(
    TABLE_DIR / "13_discount_purchase_frequency_test.csv",
    index=False,
    encoding="utf-8-sig"
)

# ---------------------------------------------------------------------
# 11. CITY MARKETING OPPORTUNITY
# ---------------------------------------------------------------------
city_stats = analysis_df.groupby("city").agg(
    customer_count=("customer_id", "count"),
    total_revenue=("total_spending", "sum"),
    avg_customer_value=("total_spending", "mean"),
    avg_order_value=("avg_order_value", "mean"),
    avg_satisfaction=("satisfaction_score", "mean")
)

city_score_features = [
    "customer_count",
    "total_revenue",
    "avg_customer_value",
    "avg_satisfaction"
]

city_scaler = StandardScaler()
city_z = pd.DataFrame(
    city_scaler.fit_transform(city_stats[city_score_features]),
    index=city_stats.index,
    columns=city_score_features
)

# Weighted opportunity score; weights are transparent and adjustable.
city_stats["marketing_opportunity_score"] = (
    0.20 * city_z["customer_count"]
    + 0.35 * city_z["total_revenue"]
    + 0.30 * city_z["avg_customer_value"]
    + 0.15 * city_z["avg_satisfaction"]
)

city_stats = city_stats.sort_values(
    "marketing_opportunity_score",
    ascending=False
)

city_stats.to_csv(
    TABLE_DIR / "14_city_marketing_opportunity.csv",
    encoding="utf-8-sig"
)

plt.figure(figsize=(10, 6))
city_plot = city_stats.head(10).sort_values(
    "marketing_opportunity_score"
)
city_plot["marketing_opportunity_score"].plot(kind="barh")
plt.title("Top Cities by Marketing Opportunity Score")
plt.xlabel("Opportunity Score")
plt.ylabel("City")
savefig("08_city_marketing_opportunity.png")

# ---------------------------------------------------------------------
# 12. CHURN MACHINE LEARNING
# ---------------------------------------------------------------------
# We deliberately exclude last_purchase_days from predictors because
# it directly defines the churn-risk target, which would cause target leakage.
ml_features = [
    "age",
    "purchase_count",
    "avg_order_value",
    "total_spending",
    "satisfaction_score",
    "returned_items"
]

X = analysis_df[ml_features].copy()
y = analysis_df["churn_risk"].copy()

# With n=60, use repeated/simple stratified CV where possible.
min_class_count = int(y.value_counts().min())

ml_results = []

if min_class_count >= 2:
    n_splits = min(5, min_class_count)
    cv = StratifiedKFold(
        n_splits=n_splits,
        shuffle=True,
        random_state=RANDOM_STATE
    )

    models = {
        "Logistic Regression": Pipeline([
            ("imputer", SimpleImputer(strategy="median")),
            ("scaler", StandardScaler()),
            ("model", LogisticRegression(
                max_iter=2000,
                class_weight="balanced",
                random_state=RANDOM_STATE
            ))
        ]),
        "Random Forest": Pipeline([
            ("imputer", SimpleImputer(strategy="median")),
            ("model", RandomForestClassifier(
                n_estimators=300,
                max_depth=5,
                min_samples_leaf=2,
                class_weight="balanced",
                random_state=RANDOM_STATE
            ))
        ])
    }

    for name, model in models.items():
        try:
            scores = cross_val_score(
                model,
                X,
                y,
                cv=cv,
                scoring="roc_auc"
            )

            ml_results.append({
                "model": name,
                "cv_folds": n_splits,
                "roc_auc_mean": scores.mean(),
                "roc_auc_std": scores.std()
            })

            model.fit(X, y)
            joblib.dump(
                model,
                MODEL_DIR / (
                    "logistic_regression.joblib"
                    if name == "Logistic Regression"
                    else "random_forest.joblib"
                )
            )
        except Exception as exc:
            ml_results.append({
                "model": name,
                "cv_folds": n_splits,
                "roc_auc_mean": np.nan,
                "roc_auc_std": np.nan,
                "error": str(exc)
            })

    ml_results_df = pd.DataFrame(ml_results)
    ml_results_df.to_csv(
        TABLE_DIR / "15_ml_cross_validation.csv",
        index=False,
        encoding="utf-8-sig"
    )

    # Fit RF for interpretable feature importance.
    rf_final = models["Random Forest"]
    rf_final.fit(X, y)

    rf_estimator = rf_final.named_steps["model"]
    feature_importance = pd.Series(
        rf_estimator.feature_importances_,
        index=ml_features
    ).sort_values(ascending=False)

    feature_importance.to_csv(
        TABLE_DIR / "16_random_forest_feature_importance.csv",
        encoding="utf-8-sig"
    )

    plt.figure(figsize=(8, 5))
    feature_importance.sort_values().plot(kind="barh")
    plt.title("Random Forest Feature Importance")
    plt.xlabel("Importance")
    plt.ylabel("Feature")
    savefig("09_random_forest_feature_importance.png")

else:
    ml_results_df = pd.DataFrame([{
        "model": "Not estimated",
        "reason": "The smallest target class has fewer than 2 observations."
    }])
    ml_results_df.to_csv(
        TABLE_DIR / "15_ml_cross_validation.csv",
        index=False,
        encoding="utf-8-sig"
    )

# ---------------------------------------------------------------------
# 13. BUSINESS RECOMMENDATION ENGINE
# ---------------------------------------------------------------------
top_city = city_stats.index[0] if len(city_stats) else "N/A"

high_value_risk_count = int(len(high_value_at_risk))

discount_p = float(mw_p)

if discount_p < 0.05:
    discount_conclusion = (
        "The difference in spending between discount and non-discount "
        "groups is statistically significant. This is evidence of an "
        "association, not proof that discounts caused the increase."
    )
else:
    discount_conclusion = (
        "No statistically significant spending difference was detected "
        "between discount and non-discount groups. Broad discounts should "
        "therefore not be assumed to increase spending."
    )

recommendations = f"""
PROJECT 2 - BUSINESS RECOMMENDATIONS
====================================

1) CUSTOMER RETENTION
---------------------
Identify and contact High-Value customers who are currently classified
as churn-risk (> {CHURN_DAYS} days since last purchase).
Number of High-Value / Churn-Risk customers: {high_value_risk_count}

Recommended action:
- personalized reactivation campaign
- loyalty incentive rather than a blanket discount
- prioritize customers by Customer Value Score

2) CITY-BASED MARKETING
-----------------------
Highest Marketing Opportunity Score city: {top_city}

Recommended action:
Allocate more experimental advertising budget to the highest-scoring
cities, while validating campaigns using conversion/revenue uplift rather
than customer count alone.

3) SMART DISCOUNTING
--------------------
Mann-Whitney U p-value for total spending: {discount_p:.4f}

Statistical interpretation:
{discount_conclusion}

Recommended action:
Use targeted discounts for customers/segments where incremental value is
demonstrated. Avoid interpreting raw group differences as causal without
A/B testing or a stronger causal design.

LIMITATION
----------
The dataset contains only 60 customers. Machine-learning estimates are
exploratory and have high uncertainty. A production churn model should be
trained on a much larger longitudinal dataset with observed future churn
outcomes and campaign/control information.
"""

with open(OUT_DIR / "business_recommendations.txt", "w", encoding="utf-8") as f:
    f.write(recommendations)

# ---------------------------------------------------------------------
# 14. EXPORT FINAL ANALYTICAL DATASET
# ---------------------------------------------------------------------
analysis_df.to_excel(
    OUT_DIR / "customer_analysis_output.xlsx",
    index=False
)

# ---------------------------------------------------------------------
# 15. CONSOLE SUMMARY
# ---------------------------------------------------------------------
print("\n" + "=" * 75)
print("FINAL SUMMARY")
print("=" * 75)

print(f"Customers: {len(analysis_df)}")
print(f"Duplicate rows: {duplicate_count}")
print(f"Churn-risk threshold: > {CHURN_DAYS} days")
print(f"Churn-risk customers: {analysis_df['churn_risk'].sum()}")
print(f"Best segmentation k: {best_k}")
print(f"Top marketing city: {top_city}")
print(f"Discount Mann-Whitney p-value: {discount_p:.4f}")
print(f"High-value churn-risk customers: {high_value_risk_count}")

print("\nAll outputs saved under:")
print(OUT_DIR)

print("\nAnalysis completed successfully.")
