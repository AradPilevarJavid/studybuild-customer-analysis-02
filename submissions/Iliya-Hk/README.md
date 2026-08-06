# Project 02 — The First Day as a Junior Data Analyst

Customer behavior analysis for the CEO, built on the cleaned dataset from Project 01 (60 customers, 17 attributes, no missing values).

**Files in this submission**
- `project02_analysis.ipynb` — full analysis, charts, and machine learning
- `README.md` — this summary
- `charts/` — exported PNGs of every chart in the notebook

**Guiding question:** *How can this analysis help the CEO make better business decisions?*

---

## 1. Business Overview (KPIs)

| KPI | Value |
|---|---|
| Total customers | 60 |
| Total revenue | ~$201,986 |
| Avg. order value | $213.16 |
| Avg. purchases / customer | 17.4 |
| Avg. customer value (CLV proxy) | $3,366 |
| Avg. satisfaction (1–5) | 2.98 |
| Discount usage rate | 43.3% |
| Item return rate | 21.9% |

The business is mid-sized with a middling satisfaction score and a notably high item return rate — both worth flagging for follow-up beyond this brief.

## 2. Recommended City for the Next Campaign: **Mashhad**

Mashhad has the most customers (11), the highest total revenue (~21% of company revenue, ~$43.2K), and average satisfaction in line with the company mean — the best combination of scale and health of any city. **Isfahan** has the highest average spend *per customer* (~$4,395) but too small a base (n=5) to lead a campaign; recommended as a secondary high-touch pilot rather than the primary target.

## 3. Top 10 Customers for a Loyalty Campaign

Ranked by lifetime spending (`total_spending`). These 10 customers (17% of the base) drive a disproportionate share of revenue — see the notebook for the full ranked table and chart. Notably, several top spenders are **not** VIP tier — see finding #2 below.

## 4. Customers At Risk of Churn

Flagged when **both** recency is in the worst quartile (≥ 273.75 days since last purchase) **and** satisfaction is ≤ 2/5. **9 customers (15%)** meet this bar, representing **~$23,183** of historical revenue — a small, targeted list for win-back outreach.

## 5. Discount Users vs. Non-Users

Discount users report **higher satisfaction** (3.27 vs. 2.76) and slightly more frequent purchases, at a small reduction in average order value. None of these differences are statistically significant at n=60 (t-tests, all p > 0.18) — promising direction, not proof. Recommend a proper A/B test before scaling discounting decisions.

## 6. Customer Segmentation (RFM + K-Means)

Built Recency/Frequency/Monetary features and ran K-Means (unsupervised ML, k=4, chosen via elbow + silhouette analysis). Four segments emerge that **cut across** the existing membership tiers:
- **Champions** — recent, frequent, high spend
- **High-Value, At-Risk** — big historical spend, going quiet (top win-back priority)
- **New / Promising** — recent signups, moderate activity
- **Low-Value / Lapsed** — infrequent, low spend, inactive

## 7. Pareto Analysis

The classic 80/20 rule does **not** strictly hold: it takes **~47% of customers** to reach 80% of revenue, not 20%. The top 20% of customers do generate a disproportionate **~51% of revenue**, so concentration exists — just less extreme than the Pareto heuristic assumes. Retention efforts need to reach well past the top decile to protect most of the revenue base.

## 8. CEO Dashboard

A 6-panel dashboard (revenue by city, spend by tier, satisfaction distribution, RFM segments, revenue concentration, discount vs. satisfaction) is built in the notebook — see `charts/08_ceo_dashboard.png`.

## 9. Extra Analysis (beyond the brief)

- **Correlation matrix** across all numeric features — no strong linear relationships (|r| < 0.4), reinforcing why the multi-feature RFM segmentation is more useful than any single-metric ranking.
- **Membership tier vs. actual spending is a data-quality red flag**: average spend is *not* monotonic across Bronze → Silver → Gold → VIP. Silver out-spends Gold and VIP; VIP has the *lowest* average spend of the four tiers. `membership_tier` should not currently be trusted for value-based targeting.
- **Gender / device / payment-method cuts**: card payers and iPhone users spend somewhat more on average — directional, not conclusive at this sample size.
- **Tenure vs. spending**: essentially no correlation (r ≈ -0.05) — being a long-time customer doesn't predict higher lifetime value here. Age has a weak positive relationship (r ≈ 0.35).
- **Supervised ML — churn-risk classifier**: a Random Forest (class-balanced) trained on the at-risk label highlights `avg_order_value`, `total_spending`, and `returned_items` as the top predictive features. With only 9 positive cases in 60 rows, this is treated as a hypothesis-generation tool, not a deployable model.

## 10. Three Business Recommendations

1. **Launch the next marketing campaign in Mashhad**, with a smaller high-value pilot in Isfahan.
2. **Audit and fix the `membership_tier` assignment logic** before using it for targeting; use the RFM/K-Means segments instead, and prioritize the 9 flagged at-risk customers (~$23K of revenue) for win-back outreach this quarter.
3. **Treat discounts as a satisfaction/engagement lever worth testing**, not a proven margin cost — validate the current directional signal with a controlled A/B test rather than rolling out broadly.

## 11. Limitations of This Dataset

- Small sample size (n=60) — most statistical tests are underpowered; treat directional findings as hypotheses.
- Single snapshot, no per-transaction history — can't see trends, seasonality, or acceleration/deceleration in behavior.
- No cost or margin data — revenue is used as a proxy for value throughout; real business impact depends on unseen margins.
- `membership_tier` appears unreliable (see finding above) and its assignment logic isn't documented.
- The churn "at-risk" label is a heuristic I defined, not an observed/confirmed churn event.
- No acquisition-channel or marketing-spend data — the city recommendation addresses where existing customers are healthiest, not necessarily where a marketing dollar goes furthest.
- Class imbalance (9 vs. 51) limits how much the supervised churn model can be trusted; it's illustrative of method, not deployment-ready.

## Summary

This analysis turns a raw customer table into three concrete actions for the CEO — **where** to spend the next marketing dollar, **who** to protect and win back right now, and **which internal system** (membership tiers) needs fixing before it misleads future targeting — while being explicit about where the data is too thin to justify full confidence.
