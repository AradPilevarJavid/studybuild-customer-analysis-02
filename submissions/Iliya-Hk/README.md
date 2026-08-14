# Project 02 — The First Day as a Junior Data Analyst

Customer behavior analysis for the CEO, built on the cleaned dataset from Project 01 (60 customers, 17 attributes, no missing values). **Revised after review feedback** — see "What changed" at the bottom.

**Files in this submission**
- `project02_analysis.ipynb` — full analysis, charts (all Seaborn where possible), and machine learning. All paths are **relative**, so it runs unmodified after a fresh clone.
- `README.md` — this summary
- `charts/` — exported PNGs of every chart in the notebook

**Guiding question:** *How can this analysis help the CEO make better business decisions?*

---

## Question 1 — Customer Profile & Dominant Persona

Built profiles for **Age Group** (5 bands), **Gender**, **Membership Tier**, **Device**, and **Payment Method**, with one chart per dimension (4 charts total).

**Dominant persona:** a **male customer aged 56–65**, **Gold** tier, shopping on **Android**, paying by **Online Wallet**. Gender skews male (58%/42%), and 56–65 is the single largest age band (17 of 60, 28%) — an older base than a typical e-commerce assumption.

## Question 2 — Province & City Analysis

Grouped by **Province + City** on Customer Count, Total/Average Spending, Average Purchase Count, Average Order Value, and Average Satisfaction, with a scatter of **Total Revenue vs. Average Satisfaction** (bubble size = customer count).

**Correction:** the city with the *most customers* is **Tabriz (12)**, not Mashhad (11) — an earlier draft misstated this. **Recommendation is still Mashhad**, but for the correct reason: Mashhad has the **highest total revenue** (~21% of company revenue) even with one fewer customer than Tabriz, meaning it converts to more revenue per customer. Isfahan (highest satisfaction, 4.4/5, and strong average spend, but only 5 customers) is proposed as a secondary high-touch pilot, not the lead campaign.

## Question 3 — Top 10 Valuable Customers (Composite Loyalty Score)

Replaced the previous "sort by `total_spending`" approach with a weighted **Loyalty Score** combining all four required factors: **Spending (35%) + Frequency (25%) + Recency (20%) + Satisfaction (20%)**, each min-max normalized before weighting. The output table includes `last_purchase_days`. A chart plots `purchase_count` vs. `total_spending`, colored by recency, with the Top 10 ring-highlighted. Each of the 10 customers now has an individual, printed reason for selection (e.g. "top-quartile spend," "very frequent buyer," "purchased very recently," "highly satisfied").

## Question 4 — Valuable Customers at Risk (redefined)

**Redefined per feedback.** A customer now only counts as at risk if **all three** hold: `total_spending` ≥ median, `purchase_count` ≥ median (so a zero-spend customer can never qualify), **and** `last_purchase_days` in the worst quartile. This yields **6 valuable-and-inactive customers** (~$27,422 of revenue), correctly excluding the previous list's zero-spend customer. The chart is now `last_purchase_days` vs. `total_spending` (not satisfaction), as required. The group is split into two tracks needing different actions:
- **Dissatisfied at-risk (3 customers, satisfaction ≤ 2):** proactive service-recovery outreach.
- **Satisfied-but-inactive at-risk (3 customers, satisfaction ≥ 3):** a lightweight re-engagement nudge, not an apology.

## Question 5 — Discount Users vs. Non-Users (Device & Payment folded in)

Device and payment-method breakdowns are now answered **inside** Question 5, not split into a later "extra analysis" section. Discount users report higher satisfaction (3.27 vs. 2.76) and slightly higher frequency; none of the differences are statistically significant at n=60 (t-tests, all p > 0.18) — a hypothesis to A/B test, not a proven effect. iPhone users who use a discount spend notably more than iPhone users who don't; Android shows the opposite direction — worth testing as a targeted-discount idea.

## Question 6 — CEO Report (6 KPIs, 3 Charts, 3 Recommendations)

**Constrained to the required format** per feedback:

**6 KPIs:** Total Customers · Total Revenue · Avg. Order Value · Avg. Purchases/Customer · Avg. Satisfaction · Discount Usage Rate. *(The invalid "item return rate" KPI from the earlier draft — computed by dividing item counts by order counts, a unit mismatch, and not computable at all without total items purchased — has been removed.)*

**3 Charts:** Revenue by City · Top 10 Customers by Loyalty Score · Satisfaction: Discount vs. Not.

**3 Recommendations (KPI → Evidence → Action):**
1. **KPI:** City revenue concentration → **Evidence:** Mashhad generates ~21% of revenue despite Tabriz having more customers (12 vs. 11) → **Action:** lead the next campaign in Mashhad; pilot Isfahan.
2. **KPI:** Membership-tier avg. spend inconsistency → **Evidence:** Silver out-spends Gold and VIP; VIP has the lowest avg. spend of all tiers → **Action:** audit the tier logic; use the Loyalty Score in the interim.
3. **KPI:** Satisfaction gap by discount use → **Evidence:** 3.27 vs. 2.76 (not statistically significant at n=60) → **Action:** run a controlled A/B test before scaling discounts.

## Additional Analysis (clearly separated, not part of the 6 required questions)

Kept as extra material, now explicitly labeled as such so it doesn't crowd the graded answers:
- **Pareto analysis** — correctly interpreted: the 80/20 pattern does not hold exactly in this dataset (more than 20% of customers are needed to reach 80% of revenue), and that's reported as-is rather than forced to fit the "80/20" name.
- **Membership tier vs. actual spending** — flagged as a data-quality issue (§7.2).
- **RFM + K-Means clustering** — **corrected**: the silhouette score is actually highest at **k=6 (0.368)**, not k=4. k=4 is used anyway, explicitly framed as a deliberate interpretability trade-off, not as "the silhouette-optimal choice."
- **Correlation & tenure analysis** — no strong linear relationships; tenure barely correlates with spending (r ≈ -0.05).
- **Supervised ML (Random Forest churn classifier)** — **corrected**: reported honestly as a weak model (0% recall on the at-risk class, ROC-AUC ≈ 0.66 on a tiny, imbalanced test split). Feature importances are **not** presented as a business finding, per feedback — the section exists to show the method and its limits transparently, not to claim insight it didn't earn.

## Limitations of This Dataset

- Small sample size (n=60) — most statistical tests are underpowered.
- **No true item return rate is computable** from this dataset — `returned_items` (item count) and `purchase_count` (order count) are different units, and total items purchased isn't recorded. Any return-rate figure from an earlier draft has been removed.
- Single snapshot, no per-transaction history — no visibility into trends or seasonality.
- No cost/margin data — revenue is used as a value proxy throughout.
- `membership_tier` appears unreliable (see Additional Analysis).
- The "at-risk" label (Question 4) is a heuristic I defined, not an observed churn event.
- No acquisition-channel or marketing-spend data.
- Severe class imbalance (6 vs. 54) makes the supervised churn model unreliable — included for transparency, not as a finding.

## Summary

The analysis gives the CEO three concrete, evidence-backed actions (Question 6), a correctly-scoped churn watchlist with two distinct response tracks (Question 4), and a defensible way to rank customer value that doesn't rely on the currently-unreliable membership tier (Question 3) — while being explicit about where the data is too thin for full confidence.

---

## What changed after review feedback (score: 58/100)

- **Q1 (previously missing):** added — Age Group, Gender, Membership Tier, Device, Payment Method profile with 4 charts and a named Dominant Persona.
- **Q2:** switched to Province+City grouping, added avg. purchase count and AOV to the table, fixed the scatter to Total Revenue vs. Satisfaction, and corrected the factual error that Mashhad has "the most customers" (it doesn't — Tabriz has 12 vs. Mashhad's 11; the city recommendation itself is unchanged, but the justification is now correct).
- **Q3:** replaced pure `total_spending` ranking with a weighted 4-factor Loyalty Score (Spending + Frequency + Recency + Satisfaction), added `last_purchase_days` to the table, added the required chart, and added individual reasoning per customer.
- **Q4:** redefined "at risk" to require **value** (spending + frequency above median) **and** inactivity, removing the previous definition's zero-spend customer; fixed the chart to recency vs. spending; split the response into a dissatisfied track and a satisfied-but-inactive track.
- **Q5:** merged the device/payment-method breakdown into this section instead of leaving it in a later extra-analysis block.
- **Q6:** trimmed to exactly 6 KPIs and 3 charts, removed the invalid item-return-rate KPI, and reformatted the 3 recommendations into a KPI → Evidence → Action structure.
- **K-Means:** corrected the silhouette-score narrative — k=6 actually scores highest; k=4 is now explicitly framed as an interpretability choice, not a silhouette-optimal one.
- **Random Forest:** now reports its actual weak performance (0% recall, ROC-AUC ≈ 0.66) and no longer presents feature importances as a reliable finding.
- **File paths:** confirmed relative throughout (`cleaned_dataset.xlsx`, `charts/...`) — no machine-specific absolute paths.
