# Customer Analytics Project with Python

## Project Overview

This project focuses on analyzing customer behavior in an e-commerce store to extract business insights and support data-driven decision-making.

The main objectives of this analysis were:
- Understanding customer characteristics and purchasing behavior
- Identifying high-value and loyal customers
- Finding valuable customers at risk of churn
- Analyzing geographic sales patterns
- Evaluating the relationship between discount usage and customer behavior

The project was implemented using Python with Pandas, NumPy, and Matplotlib.

---

## Dataset Description

The dataset contains customer-level information from an online store.

Main features include:

- customer_id: Unique customer identifier
- first_name: Customer name
- gender: Customer gender
- age: Customer age
- city: Customer city
- province: Customer province
- signup_date: Registration date
- membership_tier: Customer membership level
- purchase_count: Number of purchases
- avg_order_value: Average order value
- total_spending: Total customer spending
- last_purchase_days: Days since the last purchase
- payment_method: Payment method
- device: Device used for shopping
- discount_used: Discount usage status
- returned_items: Number of returned items
- satisfaction_score: Customer satisfaction score

---

## Data Quality Checks

Before analysis, data quality checks and preprocessing steps were performed:

- Checked dataset structure and required columns
- Converted date columns into standard datetime format
- Converted numerical columns into appropriate data types
- Handled missing values
- Corrected inconsistent categorical values (such as gender categories)
- Checked duplicate records
- Removed or handled invalid data entries

These steps ensured that the dataset was prepared for reliable analysis.

---

## Business Questions

The analysis addressed the following business questions:

### 1. Who are the main customers of the store?

Analyzed:
- Age groups
- Gender distribution
- Membership levels
- Device usage
- Payment methods

Goal:
To understand the characteristics of current customers.

---

### 2. Which cities and provinces are suitable for marketing investment?

Analyzed:
- Total customer spending by city
- Number of customers
- Average spending
- Customer satisfaction

Goal:
To identify high-potential regions for advertising campaigns.

---

### 3. Which customers should be prioritized for loyalty programs?

Created a loyalty score based on:

- Total spending
- Purchase frequency
- Recent activity
- Customer satisfaction

Goal:
To identify valuable customers for loyalty programs.

---

### 4. Which valuable customers are at risk of churn?

Identified customers who:

- Have high total spending
- Purchase frequently
- Have not purchased recently

Goal:
To design customer retention and win-back campaigns.

---

### 5. How are discounts, devices, and payment methods related to customer behavior?

Compared:

- Average spending by discount usage
- Average returned items by discount usage
- Average spending by device
- Average spending by payment method

Note:
The analysis identifies relationships and patterns, not causal effects.

---

## Key Findings

Some important insights from the analysis:

- Customer groups differ in purchasing behavior based on demographic and usage characteristics.
- Certain cities generate higher customer value and can be considered potential targets for marketing investment.
- A group of high-value customers was identified as being at risk of churn due to long inactivity periods.
- Loyalty scoring helped prioritize customers for retention programs.
- Discount usage showed different purchasing and return patterns among customer groups.
- Customer behavior varies across devices and payment methods.

---

## Business Recommendations

### 1. Customer Retention Campaigns

Evidence:
High-value customers with long periods since their last purchase were identified.

Action:
Create personalized win-back campaigns with targeted offers.
KPI:
Customer reactivation rate.

---

### 2. Focus Marketing Budget on High-Value Regions

Evidence:
Some cities generated higher total spending and customer value.

Action:
Prioritize advertising campaigns in these locations.

KPI:
Revenue growth from targeted regions.

---

### 3. Improve Loyalty Programs

Evidence:
Top customers were identified based on spending, frequency, activity, and satisfaction.

Action:
Provide personalized rewards for high-value customers.

KPI:
Customer retention rate and repeat purchase rate.

---

## Limitations

- The dataset size is limited and may not represent all customers.
- The analysis is descriptive and identifies relationships rather than proving causation.
- Additional information such as customer acquisition cost, marketing campaigns, and product categories could improve future analysis.
