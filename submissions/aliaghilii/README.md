# Customer Analytics Project - README

## Project Overview

This project analyzes customer behavior for an e-commerce store to support data-driven business decisions. The analysis covers customer segmentation, geographic performance, loyalty program targeting, churn risk identification, and the impact of discounts, devices, and payment methods on customer behavior.

## Dataset Description

- **Total Records:** 60 customers
- **Key Columns:** customer_id, gender, age, province, city, membership_tier, device, payment_method, total_spending, purchase_count, last_purchase_days, satisfaction_score, discount_used, returned_items

## Data Quality Checks

- **Missing Values:** None. All required columns are complete.
- **Data Types:** All numeric columns are properly converted (int64, float64, datetime64).
- **Duplicate Records:** No duplicate customer IDs were found.
- **Date Conversion:** signup_date was successfully converted to datetime format.
- **String Columns:** All text fields were stripped of leading/trailing spaces.

## Business Questions & Key Findings

### Q1: Who Are Our Core Customers?
- **Dominant Persona:** Male, age 56-65, Gold membership tier, Android device, Online Wallet payment method
- **Mean Age:** 43.7 | **Median Age:** 45.0
- **Key Insight:** Membership tiers do not fully reflect actual customer value

### Q2: Which City Deserves Marketing Investment?
- **Primary Recommendation:** Mashhad (Khorasan) – highest total revenue (43,197 IRR), 11 customers
- **Alternative:** Ahvaz – balanced profile with solid revenue and high satisfaction (3.5)
- **Risk:** Mashhad has below-average satisfaction (2.91), requiring quality control

### Q3: Top 10 Customers for Loyalty Program
- **Top Customer:** Maryam (ID: 1057) – loyalty score: 0.863
- **Weights Used:** Value (35%), Frequency (30%), Recency (20%), Satisfaction (15%)
- **Key Insight:** Current membership tiers are misaligned with loyalty scores

### Q4: Valuable Customers at Risk of Churning
- **Definition:** Top 25% spending + Top 25% inactivity + below-median purchase count
- **At-Risk Customers:** 1 (Arash, ID: 1035 – 5,918 IRR, 365 days inactive)
- **Action:** Personalized win-back campaign with 15% discount

### Q5: Impact of Discount, Device, and Payment Method
- **Discount:** Non-discount users spend more (3,768 vs 2,882), but discount users report higher satisfaction
- **Device:** iPhone users have highest avg spending (3,774), Web users lowest (2,898)
- **Payment Method:** Card users have highest avg spending (3,929), Cash & Wallet users similar (~3,150)
- **Critical Note:** This analysis does not prove causation

### Q6: Executive Summary
- **Total Customers:** 60 | **Total Revenue:** 203,068.12 | **Avg Satisfaction:** 2.98
- **3 Recommendations:**
  1. Quality control + satisfaction survey in Mashhad
  2. Revise membership tier system based on loyalty scores
  3. Smart discount strategy: 5% for all inactive, 15% personalized for high-value customers

## Business Recommendations

| # | Recommendation | KPI | Action |
|---|----------------|-----|--------|
| 1 | Invest in Mashhad with quality control | Revenue: 43,197 | Launch satisfaction survey to identify dissatisfaction drivers |
| 2 | Revise membership tier system | Loyalty Score | Redefine criteria based on actual customer value; upgrade high-loyalty customers |
| 3 | Smart discount strategy for inactive customers | At-Risk Customers: 1 | 5% discount for all inactive; 15% personalized for high-value customers like Arash |

## Limitations

1. **Small Sample Size:** Only 60 customers – results may not be statistically significant.
2. **Incomplete Order History:** Only last purchase date available – cannot definitively confirm churn.
3. **Descriptive Only:** Discount analysis does not prove causation.
4. **Limited Geography:** Only 8 cities represented.
5. **No Temporal Data:** No time-series data to track customer behavior over time.

## Files Delivered

- `customer_analytics_aliaghilii.ipynb` – Complete analysis notebook
- `customer_analytics_results.xlsx` – Excel file with key output tables
- `README.md` – This file
- `customer_analytics_report.pdf` – Executive summary PDF

## Author

Ali Aghili

## Date

August 2026