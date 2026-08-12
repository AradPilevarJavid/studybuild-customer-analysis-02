# 📊 Data-Driven Customer Analytics for E-Commerce

### Integrated Statistical, SQL, Python, Machine Learning & Tableau Approach

An end-to-end **Customer Analytics** project designed to transform e-commerce customer data into statistically supported and actionable business insights.

The project integrates **SQL, Python, statistical analysis, machine learning, analytical agents, and Tableau** to evaluate customer value, churn risk, behavioral segmentation, discount effectiveness, and geographic marketing opportunities.

## 🔧 Methods & Technologies

### Data & Analytics

- **SQL** — Data querying, aggregation, KPI generation and customer-level analysis
- **Python** — Data cleaning, EDA, statistical analysis and visualization
- **Tableau** — Interactive dashboards and Business Intelligence
- **Analytical Agents** — Automated analytical interpretation and decision support

### Statistical Methods

- Descriptive Statistics
- Shapiro–Wilk Normality Test
- IQR-based Outlier Detection
- Z-score Standardization
- Spearman Rank Correlation
- Mann–Whitney U Test
- Kruskal–Wallis Test
- Cohen's d Effect Size
- Bootstrap 95% Confidence Interval

### Machine Learning

- K-Means Clustering
- Silhouette Analysis
- Logistic Regression
- Random Forest
- Stratified 5-Fold Cross-Validation
- ROC-AUC Evaluation

## 📊 Key Statistical Findings

The analytical dataset contains **60 customers and 26 original variables**.

### Customer Value

A weighted Customer Value Score was developed using:

$$
CVS =
0.50Z(Total\ Spending)
+0.30Z(Purchase\ Count)
+0.20Z(AOV)
$$

Customers were divided into:

- **20 High-Value**
- **20 Medium-Value**
- **20 Low-Value**

The High-Value segment generated approximately **70.77% of total revenue**, indicating strong concentration of economic value.

### Churn Risk

Churn risk was defined using an inactivity threshold:

$$
LastPurchaseDays > 180
$$

Results:

- **36 customers (60%)** were classified as churn-risk.
- **12 customers** were both High-Value and Churn-Risk.

This group represents the **highest-priority retention opportunity**.

## 🔬 Statistical Results

Several variables showed significant departures from normality using the **Shapiro–Wilk test**, motivating the use of non-parametric methods.

The strongest reported Spearman relationship was:

$$
\rho_s = 0.613
$$

between **Purchase Count and Total Spending**, indicating a moderate positive monotonic association.

### Customer Segmentation

K-Means identified **3 behavioral clusters**:

$$
K=3,\qquad Silhouette=0.316
$$

Cluster differences were statistically significant according to the Kruskal–Wallis test:

$$
H=16.109,\qquad p=0.000318
$$

Therefore, customer spending differed significantly across the identified behavioral segments.

## 🤖 Machine Learning Results

Churn-risk prediction was evaluated using Logistic Regression and Random Forest.

| Model | Mean ROC-AUC |
|---|---:|
| Logistic Regression | **0.564** |
| Random Forest | **0.478** |

The models showed **weak predictive discrimination**, mainly due to the small sample size and limited longitudinal information.

`last_purchase_days` was excluded from the predictive features to prevent **target leakage**, since it directly defines the churn-risk target.

## 🎟️ Discount Analysis

Discount users and non-users were compared using the **Mann–Whitney U test**:

$$
U=391,\qquad p=0.4512
$$

The estimated effect size was:

$$
d\approx-0.022
$$

The bootstrap 95% confidence interval was:

$$
[-2146.19,\ 2400.88]
$$

No statistically significant difference in spending was detected.

Because the data are observational, discount effectiveness cannot be interpreted causally. **Controlled A/B testing** is recommended.

## 🌍 Geographic Analysis

**Mashhad** achieved the highest observed revenue:

- Customers: **11**
- Total Revenue: **64,118.44**
- Average Spending: **5,828.95**

Therefore, Mashhad was identified as a strong candidate for a **controlled marketing experiment**, while its moderate satisfaction level suggests that customer experience should also be considered.

## 🤖 Analytical Agent Workflow

The analytical workflow connects different stages of the project:

```text
SQL Data
   ↓
Python Data Analysis
   ↓
Statistical Analysis
   ↓
Machine Learning
   ↓
Analytical Agents
   ↓
Tableau Dashboards
   ↓
Business Decision Making
```

## 🤖 Analytical Agents

The analytical agents were designed to support the main stages of the customer analytics workflow:

- **Data Quality Analysis** — Detecting inconsistencies, anomalies, and potential data-quality issues
- **Statistical Interpretation** — Interpreting statistical tests, correlations, confidence intervals, and effect sizes
- **Customer Segmentation** — Identifying behavioral and value-based customer groups
- **Churn Intelligence** — Detecting high-risk and high-value customers requiring retention actions
- **Predictive Analytics** — Supporting churn prediction and model evaluation
- **Marketing Intelligence** — Identifying geographic and customer-level marketing opportunities
- **Decision Support** — Translating analytical findings into actionable business recommendations

## 🎯 Key Business Recommendations

### 1. Customer Retention

Prioritize the **12 High-Value + Churn-Risk customers** through personalized retention strategies, VIP services, and targeted incentives.

### 2. Revenue Growth

Target the **frequent low-AOV segment** with upselling, cross-selling, product bundles, and complementary-product recommendations.

### 3. Geographic Marketing

Use **Mashhad** as a candidate market for a controlled marketing experiment due to its highest observed revenue.

### 4. Discount Optimization

Avoid broad discounting and evaluate **targeted incentives through A/B testing** to measure incremental revenue.

## 📌 Conclusion

The analysis reveals substantial **customer heterogeneity and concentration of economic value**. Statistical results confirm significant differences between behavioral customer segments, while the relatively low ROC-AUC scores indicate that the current dataset is not sufficient for reliable production-level churn prediction.

The key strategic framework is:

> **Protect High-Value Customers → Reduce Churn Risk → Increase AOV → Optimize Marketing Through Experiments**

This project demonstrates an integrated workflow combining **SQL, Python, Statistical Analysis, Machine Learning, Analytical Agents, and Tableau** to transform customer data into evidence-based business intelligence and actionable decision support.

## 👩🏻‍💻 Author

**Mahdiyeh Mirzaei**  
*Statistics & Data Analytics*

🔗 [GitHub — Mahdiyeh Mirzaei](https://github.com/mahdiyeh-mirzaei-v2)

## 🤝 StudyBuild Community

Developed as part of the **StudyBuild Community**.

🔗 [StudyBuild Community](https://github.com/StudyBuildCommunity)
