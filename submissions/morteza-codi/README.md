# Customer Data Cleaning & Analysis

A complete data cleaning, exploratory analysis, and customer segmentation (RFM) pipeline built on a raw customer transactions dataset in `pandas`. The project walks through fixing data-quality issues in the raw file, then uses the cleaned data to answer business questions about customer value, churn risk, and marketing spend.

## 📊 Dataset

`Dataset.xlsx` contains 61 customer records with 17 columns:

| Column | Description |
|---|---|
| `customer_id` | Unique customer identifier |
| `first_name` | Customer's first name |
| `gender` | M / F |
| `age` | Customer age |
| `city`, `province` | Location |
| `signup_date` | Account creation date |
| `membership_tier` | Bronze / Silver / Gold / VIP |
| `purchase_count` | Total number of orders |
| `avg_order_value` | Average value per order |
| `total_spending` | Lifetime spending |
| `last_purchase_days` | Days since last purchase (recency) |
| `payment_method` | Card / Cash / Online Wallet |
| `device` | Android / iPhone / Web |
| `discount_used` | Whether the customer used a discount |
| `returned_items` | Number of returned items |
| `satisfaction_score` | 1–5 rating |

---

## 🧹 Part 1 — Data Cleaning

All cleaning is done in `__data_cleaning.ipynb`, in the following order. Each step also explains **why** that approach was chosen instead of an alternative (e.g. dropping rows).

### 1. Initial inspection
- Loaded the file with `pd.read_excel()` and reviewed it with `.info()`, `.describe()`, and `.describe(include='object')` to get a first sense of data types, ranges, and missing values.
- **Why:** before touching anything, we needed a full picture of the dataset's size, types, and obvious problem areas, so every later fix is based on evidence rather than guessing.

### 2. Missing values
- Checked missing values per column with `data.isna().sum()`.
- Two columns had missing values: `age` and `total_spending`.
- **Why we imputed instead of dropping:** the dataset only has **61 rows** to begin with, and each missing value affected just a single row. Dropping rows would have thrown away otherwise-complete, valid data for no real benefit — with a dataset this small, every row matters for the later averages, RFM scores, and city-level comparisons. Imputing kept the sample size intact while still giving each field a reasonable, defensible value.

### 3. Fixing the `gender` column
- The raw `gender` column was unreliable — the same first name appeared with both `M` and `F` values across rows, so the column couldn't be trusted as-is.
- Rebuilt it from `first_name` using a known list of female Persian first names (`Kimia, Neda, Zahra, Maryam, Mina, Sara`); every other name was set to `M`.
- **Why:** since `first_name` is far more reliable than the corrupted `gender` column, and Persian first names are almost always gender-specific, this let us recover a trustworthy `gender` value for every single row instead of dropping or leaving rows uncertain.

### 4. Filling missing `age`
- Computed the median age **per gender** (`groupby('gender')['age'].median()`).
- Filled missing `age` values with the corresponding gender's median, then cast the column to `int`.
- **Why the median (not the mean, and not dropping the row):** the median is resistant to outliers (like the age-145 error found in the next step), so it's a safer central value than the mean. Splitting by gender first gives a more realistic estimate than a single dataset-wide median. Since this only affected one row, imputing preserved that customer's other valid data (spending, purchases, satisfaction, etc.) instead of losing it.

### 5. Fixing an age outlier
- Found one record with an impossible age (`145`).
- Corrected it manually to the verified value (`47`) after checking the record individually.
- **Why we corrected instead of deleting the row:** with only 61 records, removing a whole customer over one bad field would mean losing valid, usable data (spending, purchase history, satisfaction score, etc.) for that customer. Since only the `age` field was implausible, a manual, verified correction was more appropriate than discarding the entire record.

### 6. Filling missing `total_spending`
- Missing `total_spending` values were reconstructed as `purchase_count * avg_order_value`, using the customer's own purchase history rather than a generic average.
- **Why:** this customer already had valid `purchase_count` and `avg_order_value` values, so we could derive an accurate, customer-specific estimate instead of relying on a dataset-wide average (which would be far less precise) or dropping the row and losing that customer entirely.

### 7. (Considered) dropping the `customer_id` column
- Noted that `customer_id` isn't needed for the statistical/visual analysis, but the drop was left commented out / not executed so the ID stays available for referencing specific customers throughout the notebook (e.g. in the RFM and at-risk tables).

### 8. Fixing a `returned_items` inconsistency
- Some rows had `returned_items` greater than `purchase_count`, which isn't logically possible.
- Capped `returned_items` at `purchase_count` using a row-wise `min()`.
- **Why capping instead of dropping:** these rows were otherwise valid and useful; the issue was isolated to one field being logically inconsistent (can't return more items than were purchased), so constraining that one value was the least destructive fix.

### 9. Consistency / sanity checks
- Reviewed the unique values of every categorical column (`city`, `province`, `membership_tier`, `purchase_count`, `payment_method`, `device`, `satisfaction_score`, `returned_items`) to catch typos, unexpected categories, or invalid entries.
- **Why:** a final safety net to make sure no hidden data-entry errors (typos, unexpected categories, impossible values) slipped through before moving on to duplicate removal and analysis.

### 10. Removing duplicates
- Dropped exact duplicate rows with `drop_duplicates()`.
- **Why this is the one case where dropping is correct:** a fully duplicated row adds no new information — keeping it would double-count that customer's spending and activity in every aggregate metric (total revenue, averages, KPI table), which would bias the analysis. Unlike the missing-value cases above, no unique data is lost by removing it.

### 11. Data types
- Converted `signup_date` from text to a proper `datetime` type.
- **Why:** without a real `datetime` type, date-based operations (sorting, filtering, calculating tenure) either fail or behave incorrectly, since the column would just be treated as plain text.

### 12. Fixing a miscalculated `total_spending` value
- Found one row where `total_spending` didn't match `purchase_count * avg_order_value` at all.
- Recalculated and corrected it to the accurate value.
- **Why:** this value directly affects revenue totals, the KPI summary, and RFM scores, so a single wrong number here can distort every downstream metric — it was safer to correct it using the row's own reliable fields than to drop the row or leave the error in place.

> ✅ After this step, the dataset is fully cleaned and used for all analysis below. **Note:** the notebook should be run top-to-bottom in one pass (Kernel → Restart & Run All) so every later chart and KPI reflects this fully corrected data.

---

## 📈 Part 2 — Exploratory Data Analysis (EDA)

- **Age distribution:** customers grouped into age bins (`0–24, 25–34, 35–44, 45–54, 55–64, 65+`) and plotted as a bar chart.
- **Membership tier distribution:** count of customers per tier (Bronze/Silver/Gold/VIP).
- **Device usage distribution:** count of customers per device (Android/iPhone/Web).
- **Payment method distribution:** count of customers per payment method (Card/Cash/Online Wallet).
- **Profile summary table:** mean age, median age, most common (mode) gender, membership tier, device, and payment method — a quick "average customer" snapshot.
- **Key questions answered directly from the EDA:**
  - Which age group is the largest? → **55–64**.
  - Which membership tier do most customers belong to? → **Gold**.
  - Which device and payment method are most common? → **Android** and **Online Wallet**.
  - Is there a smaller but more valuable customer segment worth investigating separately? → Flagged as **yes**, which is what motivated the RFM analysis in Part 4.

## 🏙️ Part 3 — City & Province Analysis

- Built a smaller working table (`mini_data`) with `province`, `city`, `customer_id`, `total_spending`, `purchase_count`, `avg_order_value`, and `satisfaction_score`.
- Aggregated by `province` + `city` into `city_summary`, computing per city: number of customers, total revenue, average spending per customer, average purchase count, average order value, and average satisfaction.
- **Top 10 cities by total revenue** — bar chart.
- **Revenue vs. satisfaction bubble chart** — one bubble per city, size = number of customers, to see which cities combine high revenue *and* high satisfaction (vs. cities that only look good on one metric).
- **Written insight — advertising risk in "high revenue / low satisfaction" cities:** cities like **Mashhad** (~43K revenue, 2.9 satisfaction) and **Tabriz** (~36K revenue, 3.0 satisfaction) carry two risks if marketing spend is increased there without fixing the underlying issue: it can accelerate churn among newly acquired, already-dissatisfied customers, and it can amplify negative word-of-mouth, lowering the ROI of the campaign.
- **Final market-prioritization strategy (based on revenue + satisfaction + customer count together):**
  - **High priority for growth (Isfahan, Ahvaz):** Isfahan has the highest satisfaction (4.4) with moderate revenue — ready for market-expansion campaigns. Ahvaz has strong satisfaction (3.5), good revenue (~23K), and a healthy customer base — best candidate for scaling up ad spend.
  - **Needs fixing before scaling (Mashhad, Tabriz):** temporarily cap ad budget here and redirect it to support/retention until satisfaction rises above ~3.5.
  - **Critical (Shiraz):** lowest satisfaction (2.0) and low revenue — needs a deep root-cause investigation before any advertising investment.

## 🎯 Part 4 — Customer Segmentation (RFM Analysis)

- Built a `loyalty_df` subset (`customer_id`, `first_name`, `membership_tier`, `purchase_count`, `total_spending`, `last_purchase_days`, `satisfaction_score`).
- Calculated normalized **Recency, Frequency, Monetary (RFM)** scores per customer:
  - `R_score` — normalized recency (based on `last_purchase_days`, inverted so *more recent* = higher score)
  - `F_score` — normalized frequency (based on `purchase_count`)
  - `M_score` — normalized monetary value (based on `total_spending`)
  - `RFM_Score` — sum of the three
- Extracted and printed the **top 10 customers by RFM score**.
- Added an `activity_score` (`1 / (last_purchase_days + 1)`) and visualized the top 10 on a scatter plot: purchase count vs. total spending, bubble size = activity/recency, color = RFM score.
- **Key questions answered:**
  - Do the top customers score high on *both* frequency and spending at the same time? → **Not necessarily** — some customers have many purchases but a lower total (frequent small buyers), while others buy less often but spend heavily per order.
  - Should a customer with high lifetime spending but a very old last purchase still receive loyalty rewards? → **No.** One customer had the single highest total spending in the dataset but hadn't purchased in ~340 days — effectively churned. The recommendation was to replace loyalty rewards for this group with **win-back / re-activation campaigns** conditioned on a new purchase, rather than standard loyalty perks.
  - Does the current `membership_tier` match each customer's actual RFM ranking? → **Not always.** One customer ranked **#1 overall** on RFM score despite being on the lowest (**Bronze**) tier — a clear mismatch in the tiering system. Conversely, some **VIP** customers ranked poorly (very inactive, or low total spending), showing that tier alone is not a reliable proxy for true customer value.

## ⚠️ Part 5 — At-Risk / Churn Detection

- Built a `risk_df` subset (`customer_id`, `first_name`, `total_spending`, `purchase_count`, `last_purchase_days`, `membership_tier`, `satisfaction_score`).
- Defined an **at-risk** customer as one with: spending ≥ median, purchase count ≥ median, **and** inactivity ≥ 180 days (a stricter, threshold-based definition alongside the simpler two-condition median-only definition used later in the executive summary).
- Labeled each customer's `Status` (`At Risk` / `Normal`) and visualized them on a scatter plot (days since last purchase vs. total spending), with reference lines at the spending and recency thresholds.
- **Key questions answered:**
  - How many customers fall in the "high value + inactive" (top-right) zone? → **16** using the median/median definition, or **18** using the fixed 180-day threshold.
  - Are these at-risk customers dissatisfied, or just inactive despite being happy? → **A mix, leaning toward dissatisfied:** ~56% of this group had a satisfaction score of 1–2 (churn clearly tied to a bad experience), while ~44% had a satisfaction score of 4–5 despite being inactive (likely due to no current need, forgetting the brand, or switching to a competitor — not dissatisfaction).
  - Can we prove definitive churn from this data? → **Not fully.** The dataset only records days since the *last* purchase, not the customer's typical purchase cycle — so a customer who buys once a year might look "inactive" without actually having churned. Recommended next step: start tracking inter-purchase intervals so occasional shoppers can be told apart from genuinely churned ones.

## 💳 Part 6 — Discount, Device & Payment Method Impact

- Built a `factor_df` subset (`customer_id`, `discount_used`, `device`, `payment_method`, `total_spending`, `purchase_count`, `avg_order_value`, `returned_items`, `satisfaction_score`).
- Counted customers by `discount_used` (Yes/No), then aggregated `summary_by_discount`: customer count, average spending, average purchase count, average order value, average returns, and average satisfaction per group.
- **Average spending: discount users vs. non-users** — bar chart.
- **Average returned items: discount users vs. non-users** — bar chart.
- **Average total spending by device** — bar chart.
- **Average total spending by payment method** — bar chart.
- **Key questions answered:**
  - Do customers who use discounts spend more on average? → **No** — discount usage didn't meaningfully raise average order value.
  - Do discount users also return more items? → **No** — using a discount wasn't associated with a higher return rate in this data.
  - Is the sample size big enough to trust these conclusions? → Good enough for **exploratory, descriptive patterns** (61 customers total, split reasonably across devices, payment methods, and discount groups), but a larger sample is recommended before running formal statistical tests (e.g. a t-test) or making firm policy decisions.

## 📋 Part 7 — Executive KPI Summary

- Built a final KPI table (rendered with `tabulate`) summarizing: total revenue, total customers, average spending, average satisfaction, number/percentage of at-risk customers, and average returned items — each with a plain-language "status" (e.g. *Optimal*, *Warning*, *Critical*).
- Built a final **3-panel summary chart**: (1) top 10 cities by revenue, (2) at-risk customers highlighted on the spending-vs-inactivity scatter plot, (3) average spending by payment method.
- **Three structured management recommendations (KPI → Action → Evidence):**
  1. **Launch a win-back campaign** for high-value, at-risk customers — evidence: 16 customers with above-median spending haven't purchased in 200+ days.
  2. **Reallocate discount/marketing budget** toward high-satisfaction cities (Isfahan, Ahvaz) instead of broad, unconditional discounts — evidence: discount users don't spend meaningfully more than non-users.
  3. **Improve the online payment experience** — evidence: Online Wallet has the highest transaction count but a noticeably lower average order value than card/cash payments.

---

## 🛠️ Tech Stack

- Python 3.13
- `pandas`, `numpy`
- `matplotlib`, `seaborn`
- `tabulate`

## 🚀 Getting Started

```bash
pip install pandas numpy matplotlib seaborn tabulate openpyxl
jupyter notebook __data_cleaning.ipynb
```

Run all cells **top to bottom** (Kernel → Restart & Run All) to reproduce the cleaned dataset and all charts/results consistently.

## 📁 Project Structure

```
.
├── Dataset.xlsx              # Raw customer dataset
├── __data_cleaning.ipynb     # Full cleaning + analysis notebook
└── README.md
```
