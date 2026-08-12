
---
# 📊 Customer Analytics Project – StudyBuild

**Project:** Customer Analytics – Project 02  
**Author:** [sahandkhdaoyi]  
**Date:** August 2026

---

## 📌 Project Overview

This project analyzes customer data from an online store to answer six real-world business questions. The goal is to understand customer profiles, identify high-value segments, evaluate marketing opportunities, and provide actionable recommendations to the CEO.

The analysis is performed using Python (Pandas, NumPy, Matplotlib) in a Jupyter Notebook. All steps – from data loading and cleaning to visualization and reporting – are fully documented.

---

## 📁 Dataset Description

The dataset (`First Dataset.xlsx`) contains **106 customer records** (after cleaning) with the following columns:

| Column Name | Description |
|-------------|-------------|
| `customer_id` | Unique customer identifier |
| `first_name` | Customer's first name |
| `gender` | Gender (F/M) |
| `age` | Age in years |
| `city` | City of residence |
| `province` | Province of residence |
| `signup_date` | Date of account creation |
| `membership_tier` | Membership level (VIP, Gold, Silver, Bronze) |
| `purchase_count` | Total number of purchases |
| `avg_order_value` | Average value per order |
| `total_spending` | Total lifetime spending |
| `last_purchase_days` | Days since last purchase |
| `payment_method` | Preferred payment method |
| `device` | Device used (Android, iPhone, Web) |
| `discount_used` | Whether the customer has used a discount (Yes/No) |
| `returned_items` | Number of returned items |
| `satisfaction_score` | Customer satisfaction score (1–5) |

---

## 🧹 Data Quality Checks

The following steps were performed to prepare the data:

- **Column Validation:** All 17 required columns were verified.
- **Data Type Conversion:**
  - `signup_date` → datetime
  - Numeric columns (`age`, `total_spending`, etc.) → numeric (invalid values converted to `NaN`)
- **Text Cleaning:** Removed leading/trailing whitespace from all string columns.
- **Duplicate Removal:** One duplicate record (customer_id 1014) was detected and removed.
- **Handling Missing Values:**
  - Missing values are not imputed globally. Instead, each analysis drops rows that are missing **only** the columns required for that specific question.
  - Missing counts are reported in the notebook.

> **Note:** The cleaned dataset is saved as `cleaned_customer_data.xlsx` for future reference.

---

## ❓ Business Questions & Key Findings

### 1️⃣ Who are the main customers?
**Goal:** Build a clear picture of the typical customer (age, gender, membership tier, device, payment method).

**Key Findings:**
- The most common **gender** is `F`.
- The most common **age group** is `35–44`.
- Most customers have **Silver** membership.
- Most customers use **Android** devices and prefer **Card** as payment method.

---

### 2️⃣ Which region is best for advertising?
**Goal:** Identify the top 10 cities by total spending and find the best city considering revenue, satisfaction, and customer count.

**Key Findings:**
- Top city by total revenue: **Mashhad – Khorasan** (with high spending and decent satisfaction).
- The recommended city for the next campaign is selected based on `total_revenue`, `avg_satisfaction`, and `customer_count`.

**Visualizations:** Horizontal bar chart (top 10 cities) + scatter plot (revenue vs satisfaction, sized by customer count).

---

### 3️⃣ Which customers are priority for the loyalty program?
**Goal:** Select 10 customers with the highest combined score based on:
- Financial value (35%)
- Purchase frequency (30%)
- Recency (20%)
- Satisfaction (15%)

**Key Findings:**
- The top 10 loyal customers are identified and displayed in a table.
- All selected customers show high scores across multiple dimensions.
- Membership tier alone is **not** a reliable proxy for loyalty.

**Visualizations:** Scatter plot showing purchase count vs total spending, with the top 10 highlighted as stars.

---

### 4️⃣ Which valuable customers are at risk of churning?
**Goal:** Identify high-value customers who have been inactive for a long time.

**Definition of at-risk:** Customers with:
- Total spending ≥ 75th percentile
- Purchase count ≥ median
- Days since last purchase ≥ 75th percentile

**Key Findings:**
- A list of at-risk customers is generated and sorted by spending (descending) and inactivity (descending).
- These customers should be targeted with re-engagement campaigns.

**Visualizations:** Scatter plot with thresholds, highlighting at-risk customers with an 'X' marker.

---

### 5️⃣ How do discounts, devices, and payment methods relate to customer behavior?
**Goal:** Compare spending, returns, and satisfaction across discount users vs non‑users, and across different devices & payment methods.

**Key Findings:**
- **Discount users** tend to have higher total spending, but also higher return rates (descriptive, not causal).
- **iPhone** users have the highest average spending, followed by Android and Web.
- **Online Wallet** and **Card** payment methods yield higher average spending compared to Cash.

**Important:** This analysis does **not** prove causality – observed differences may be due to other factors.

**Visualizations:** Bar charts for discount comparison, and horizontal bar charts for device & payment method comparison.

---

### 6️⃣ CEO One-Page Dashboard
**Goal:** Create a compact executive summary with 6 KPIs, 3 selected charts, and 3 actionable recommendations.

**KPIs:**
- Total unique customers
- Total revenue
- Average revenue per customer
- Average purchase count
- Average satisfaction score
- Total returned items

**Selected Charts (from previous questions):**
1. Age distribution
2. Top 10 cities by revenue
3. Loyalty scatter plot (purchase count vs total spending)

**Recommendations (example):**
- **KPI:** Average satisfaction  
  **Action:** Investigate low satisfaction among Cash payment users  
  **Evidence:** Cash users have the lowest average satisfaction.

---

## 🛠️ Setup & Dependencies

### Requirements
- Python 3.7+
- Jupyter Notebook
- Libraries: `pandas`, `numpy`, `matplotlib`, `openpyxl` (for Excel export)

Install all required packages with:
```bash
pip install pandas numpy matplotlib openpyxl
```

### Persian Font Configuration
To display Persian text correctly in plots, we added the following code at the beginning of the notebook:

```python
import matplotlib.pyplot as plt

plt.rcParams['font.family'] = 'sans-serif'
plt.rcParams['font.sans-serif'] = ['B Nazanin', 'BNazanin', 'Tahoma', 'Arial Unicode MS', 'DejaVu Sans']
plt.rcParams['axes.unicode_minus'] = False
```

If your system does not have these fonts, you can either:
- Use `font_manager.FontProperties(fname='path/to/persian_font.ttf')`
- Install a Persian font (e.g., Vazir) using `pip install vazir-font`

---

## 📂 Deliverables

The project produces the following files:

| File Name | Description |
|-----------|-------------|
| `customer_analytics_username.ipynb` | The main Jupyter Notebook with all code, visualizations, and outputs. |
| `customer_analytics_results.xlsx` | Excel file with sheets: `KPI`, `City Analysis`, `Top Loyal Customers`, `At Risk Customers`, `Discount Analysis`, `Customer Profile`. |
| `cleaned_customer_data.xlsx` | The cleaned dataset after preprocessing. |
| `README.md` | This documentation. |
| `Executive_Summary.pdf` | *(Optional)* A one‑page PDF with the dashboard charts and recommendations. |

---

## ⚠️ Analysis Limitations

- **Aggregated data:** Each row represents a customer summary, not individual transactions. Therefore, we cannot analyze order‑level details.
- **Limited recency info:** `last_purchase_days` only shows days since last purchase – no full purchase history or timing patterns are available.
- **Discount analysis is observational:** It does **not** prove causality. Discounts may be used more by naturally higher‑spending customers.
- **Return rate not calculable:** We only have `returned_items`, not total items purchased per customer, so we cannot compute an accurate return rate.
- **Small sample sizes:** Some cities or device groups have very few customers, making averages less stable. Interpret with caution.

---

