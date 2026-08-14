# Customer Analytics & Business Intelligence

## 📊 Project Overview

This project analyzes customer behavior data to identify high-value customer segments, geographic opportunities, loyalty program priorities, customer inactivity risks, and behavioral patterns related to discounts, devices, and payment methods.

The objective is to transform raw customer-level data into actionable business insights that can support marketing, customer retention, loyalty management, and strategic decision-making.

---

## 🎯 Business Questions

The analysis addresses six key business questions:

1. Who are the store's main customers?
2. Which province and city are the most suitable for advertising investment?
3. Which customers should be prioritized for the loyalty program?
4. Which high-value customers are at risk of becoming inactive?
5. How are discounts, devices, and payment methods associated with customer behavior?
6. What are the most important KPIs and findings for a five-minute CEO report?

---

## 📁 Dataset

The dataset contains:

- **60 customers**
- **21 features**

### Main Features

| Feature | Description |
|---|---|
| customer_id | Unique customer identifier |
| first_name | Customer first name |
| gender | Customer gender |
| age | Customer age |
| city | Customer city |
| province | Customer province |
| signup_date | Customer registration date |
| membership_tier | Membership level |
| purchase_count | Number of purchases |
| avg_order_value | Average order value |
| total_spending | Total customer spending |
| last_purchase_days | Days since the last purchase |
| payment_method | Preferred payment method |
| device | Primary device |
| discount_used | Whether the customer used discounts |
| returned_items | Number of returned items |
| satisfaction_score | Customer satisfaction score |
| returns_data_issue | Return-related data quality indicator |
| activity_level | Customer activity classification |
| return_rate | Customer-level return rate |
| customer_value | Customer value segment |

---

# 🔍 Key Findings

## 1. Customer Profile

The customer base consists of 60 customers.

- 60% are male and 40% are female.
- Average customer age: **43.7 years**
- Average purchase count: **17.38**
- Gold is the largest membership segment with **31.67%** of customers.
- High-Value, Medium-Value, and Low-Value customers each represent **33.33%** of the customer base.

Although the three customer-value segments have equal population sizes, their economic contribution is highly unequal.

### High-Value Segment

High-Value customers generate:

- **158,182.68 total revenue**
- **7,909.13 average spending**
- **23.95 average purchases**
- **289.51 average order value**

They represent only one-third of customers but generate approximately **71% of total revenue**.

### Business Insight

High-Value customers are the economically most important customer segment and should receive the highest retention and loyalty priority.

---

# 📍 2. Geographic Advertising Opportunity

## City Performance

| City | Customers | Total Revenue | Avg. Spending | Avg. Satisfaction |
|---|---:|---:|---:|---:|
| Tabriz | 12 | 36,192.49 | 3,016.04 | 3.00 |
| Mashhad | 11 | **64,118.44** | **5,828.95** | 2.91 |
| Ahvaz | 8 | 23,384.78 | 2,923.10 | 3.50 |
| Karaj | 7 | 26,189.81 | 3,741.40 | 2.86 |
| Tehran | 6 | 15,161.29 | 2,526.88 | 2.67 |
| Shiraz | 6 | 20,715.92 | 3,452.65 | 2.00 |
| Isfahan | 5 | 21,975.32 | **4,395.06** | **4.40** |
| Rasht | 5 | 15,168.54 | 3,033.71 | 2.60 |

### Recommendation

**Mashhad/Khorasan is the primary advertising investment opportunity.**

Mashhad generates the highest total revenue and the highest average customer spending.

**Isfahan is a secondary growth opportunity.**

Although it has a smaller customer base, it has high average spending and the highest satisfaction score.

### Strategic Priority

1. **Mashhad / Khorasan — Primary investment**
2. **Isfahan — Secondary expansion opportunity**

---

# ❤️ 3. Loyalty Program Priorities

The loyalty program should prioritize customers according to economic value and purchasing behavior rather than membership tier alone.

### Priority 1: High-Value Customers

High-Value customers generate approximately 71% of total revenue.

Recommended benefits:

- Exclusive rewards
- Personalized offers
- Early access to products
- VIP customer support
- Retention incentives

### Priority 2: High-Frequency Medium-Value Customers

These customers represent an opportunity to increase customer lifetime value and move customers toward the High-Value segment.

Recommended strategies:

- Cross-selling
- Personalized recommendations
- Tier upgrades
- Targeted rewards

### Priority 3: VIP Customers

VIP customers have the highest average purchase frequency among membership tiers:

**18.87 purchases per customer**

They also have relatively high satisfaction.

---

# ⚠️ 4. High-Value Customers at Risk

Customer retention is a major concern.

The dataset classifies:

- **35 customers (58.33%) as Inactive**
- **15 customers (25.00%) as At Risk**
- **6 customers (10.00%) as Active**
- **4 customers (6.67%) as Highly Active**

Therefore, more than 83% of customers are either inactive or at risk according to the activity classification.

### High-Value + At Risk Customers

Several high-value customers require immediate retention actions.

| Customer ID | City | Purchases | Total Spending | Last Purchase Days | Satisfaction |
|---|---|---:|---:|---:|---:|
| 1033 | Tabriz | 24 | 5,521.20 | 112 | 5 |
| 1044 | Shiraz | 33 | 14,354.34 | 165 | 2 |
| 1045 | Rasht | 24 | 3,871.92 | 132 | 1 |
| 1047 | Tabriz | 23 | 5,080.01 | 180 | 3 |

### Critical Win-Back Example

Customer **1030** is a particularly important reactivation case:

- High Value
- 26 purchases
- 25,000 total spending
- 340 days since last purchase
- Inactive status

### Recommendation

Implement a dedicated:

**High-Value Churn Prevention & Win-Back Program**

The program should distinguish between:

1. High-Value + At Risk
2. High-Value + Inactive
3. High-Value + Active

---

# 💳 5. Discounts, Devices, and Payment Methods

## Discount Usage

| Metric | Discount Used | No Discount |
|---|---:|---:|
| Customers | 26 | 34 |
| Avg. Spending | 3,686.82 | 3,736.74 |
| Avg. Purchases | **17.50** | 17.29 |
| Avg. Order Value | 203.29 | **220.70** |
| Satisfaction | **3.27** | 2.76 |

Discount users show slightly higher purchase frequency and satisfaction, but lower average order value.

This suggests that discounts may encourage purchasing activity while reducing basket size.

However, these results show **association, not causation**.

---

## Device Usage

| Device | Customers | Percentage |
|---|---:|---:|
| Android | 22 | 36.67% |
| Web | 20 | 33.33% |
| iPhone | 18 | 30.00% |

Android is the most common device, but device usage is relatively balanced.

The available aggregated results support conclusions about device adoption but do not provide enough evidence to establish device-specific revenue or satisfaction differences.

---

## Payment Method

| Payment Method | Customers | Avg. Spending | Avg. Order Value | Satisfaction | Total Revenue |
|---|---:|---:|---:|---:|---:|
| Cash | 19 | **4,251.68** | 192.26 | **3.47** | **80,781.87** |
| Card | 18 | 3,929.00 | **224.14** | 3.28 | 70,722.09 |
| Online Wallet | 23 | 3,104.46 | 221.82 | **2.35** | 71,402.63 |

Online Wallet is the most commonly used payment method, accounting for **38.33%** of customers.

However, it also has the lowest average spending and lowest satisfaction.

### Business Insight

The Online Wallet experience should be investigated because its combination of high adoption and low satisfaction may indicate friction in the payment process.

Cash customers show the strongest monetary performance, with the highest average spending and total revenue.

---

# 📈 6. CEO Five-Minute Report

## Executive Summary

The customer base contains **60 customers** with an average age of **43.7 years** and an average of **17.38 purchases per customer**.

The most important strategic finding is the concentration of revenue among High-Value customers.

High-Value customers represent only **33.33% of customers but generate approximately 71% of total revenue**.

At the same time, customer inactivity represents a major business risk:

- 58.33% Inactive
- 25.00% At Risk

This means that customer retention and reactivation should be major strategic priorities.

From a geographic perspective, **Mashhad/Khorasan** is the strongest immediate advertising opportunity because it generates the highest revenue and average spending.

**Isfahan** represents an additional growth opportunity because of its high average spending and highest satisfaction score.

---

# 📊 KPI Dashboard

| KPI | Value |
|---|---:|
| Total Customers | 60 |
| Number of Features | 21 |
| Average Age | 43.70 |
| Average Purchases | 17.38 |
| Average Spending | 3,715.11 |
| Average Satisfaction | 2.98 / 5 |
| High-Value Customers | 33.33% |
| High-Value Revenue Share | ~71% |
| Inactive Customers | 58.33% |
| At-Risk Customers | 25.00% |
| Largest City by Customers | Tabriz |
| Highest-Revenue City | Mashhad |
| Highest-Spending City | Mashhad |
| Highest-Satisfaction City | Isfahan |
| Largest Membership Tier | Gold |
| Most Common Device | Android |
| Most Common Payment Method | Online Wallet |
| Highest-Revenue Payment Method | Cash |

---

# 💡 Strategic Recommendations

### 1. Protect High-Value Customers

Because approximately 71% of revenue comes from one-third of customers, High-Value retention should be the company's top priority.

### 2. Launch High-Value Churn Prevention

Immediately target High-Value customers classified as At Risk or Inactive.

### 3. Increase Advertising in Mashhad

Mashhad combines a meaningful customer base with the highest revenue and average spending.

### 4. Test Isfahan as a Growth Market

Isfahan has a small customer base but high spending and excellent satisfaction, making it attractive for controlled expansion.

### 5. Improve Online Wallet Experience

Online Wallet has the highest adoption but the lowest satisfaction and average spending.

### 6. Use Discounts Selectively

Discounts are associated with slightly higher purchase frequency and satisfaction but lower average order value. Therefore, discounts should be targeted toward customers where incremental purchasing justifies the reduced basket value.

### 7. Prioritize Reactivation

With more than 83% of customers classified as either Inactive or At Risk, reactivation represents a major potential source of incremental revenue.

---

# 🔬 Correlation Insights

Several meaningful relationships appear in the correlation analysis.

### Purchase Count and Total Spending

Correlation:

**r = 0.51**

This indicates a moderate positive relationship between purchase frequency and total spending. Customers who purchase more frequently tend to generate higher total spending.

### Purchase Count and Return Rate

Correlation:

**r = -0.54**

This is a moderate negative relationship, suggesting that customers with more purchases tend to have lower customer-level return rates.

### Average Order Value and Return Rate

Correlation:

**r = 0.41**

Customers with higher average order values tend to have higher return rates in this dataset.

### Last Purchase Days and Satisfaction

Correlation:

**r = -0.29**

There is a weak-to-moderate negative relationship, suggesting that longer periods since the last purchase are associated with lower satisfaction.

### Returned Items and Satisfaction

Correlation:

**r = -0.28**

Customers with more returned items tend to report lower satisfaction.

### Important Note

Correlation analysis identifies statistical association and should not be interpreted as evidence of causality.

---

# ⚠️ Data Quality Considerations

Several observations require careful interpretation.

### Extreme Return Rates

Some customers have unusually high return rates, including values above 1.0. These values can occur because return rate is calculated at the individual customer level and should not automatically be interpreted as a percentage of all orders.

### Zero-Purchase Customer

Customer 1024 has:

- 0 purchases
- 0 total spending

Consequently, the return rate is undefined and should be handled carefully during modeling or further analysis.

### Extreme Spending Value

Customer 1030 has **25,000 total spending**, which is considerably higher than most observations.

This observation should be investigated as either:

- a genuine high-value customer,
- a business outlier,
- or a potential data-entry issue.

### Observational Analysis

The dataset is observational. Therefore, relationships between discounts, payment methods, customer behavior, and satisfaction should be interpreted as associations rather than causal effects.

---

# 🏁 Final Business Conclusion

The analysis reveals a customer base with strong revenue concentration and significant retention risk.

The central business insight is:

> **One-third of customers generate approximately 71% of total revenue, while more than 83% of customers are classified as either inactive or at risk.**

Therefore, the most valuable strategic action is not simply acquiring more customers, but **protecting high-value customers and reactivating valuable inactive customers**.

From a geographic perspective, **Mashhad/Khorasan should receive the highest advertising priority**, while **Isfahan represents a promising secondary growth market**.

The company should also investigate the **Online Wallet experience**, use discounts selectively, and build a behavior-based loyalty program centered on customer value and purchase frequency.

Overall, the analysis supports a shift from broad customer marketing toward **value-based segmentation, targeted retention, geographic optimization, and data-driven customer relationship management**.

---

## 🛠️ Technologies Used

- Python
- Pandas
- NumPy
- Matplotlib
- Seaborn
- Google Colab
- Exploratory Data Analysis (EDA)
- Customer Segmentation
- Business Intelligence
- Customer Analytics

---

## 📌 Project Outcome

This project demonstrates how customer-level transactional and behavioral data can be transformed into actionable business intelligence for:

- Customer segmentation
- Marketing optimization
- Loyalty program design
- Churn prevention
- Customer retention
- Geographic targeting
- Payment experience optimization
- Executive KPI reporting
