# Customer Analytics Project

**Project 02 — StudyBuild Community**

**Author:** Shayan Najafian

## Project Overview

This project analyzes customer behavior in an e-commerce dataset and
transforms the results into practical business insights.

The main objectives are to:

- Understand the main characteristics of existing customers
- Identify valuable cities and provinces for marketing investment
- Select customers for a loyalty program
- Detect valuable customers who may become inactive
- Compare customer behavior based on discounts, devices, and payment methods
- Produce a short management report with key performance indicators and recommendations

The analysis was completed in Python using pandas, NumPy, and
Matplotlib.

## Dataset Description

The cleaned dataset from Project 01 was used as the input for this
analysis.

The dataset contains **60 customers** and **17 columns**.

The columns include:

- `customer_id`: unique customer identifier
- `first_name`: customer first name
- `gender`: customer gender
- `age`: customer age
- `city`: customer city
- `province`: customer province
- `signup_date`: customer registration date
- `membership_tier`: membership level
- `purchase_count`: number of purchases
- `avg_order_value`: average order value
- `total_spending`: total customer spending
- `last_purchase_days`: number of days since the last purchase
- `payment_method`: preferred payment method
- `device`: device used by the customer
- `discount_used`: whether the customer used a discount
- `returned_items`: number of returned items
- `satisfaction_score`: customer satisfaction score

## Data Quality Checks

Before beginning the analysis, the dataset was validated.

The following checks were performed:

- Confirmed that all required columns were present
- Converted `signup_date` to a date data type
- Converted numeric columns to appropriate numeric types
- Removed unnecessary spaces from text columns
- Checked for missing values
- Checked for duplicate records
- Checked customer ID uniqueness
- Reviewed categorical values for consistency
- Checked numeric columns for invalid or negative values

The cleaned dataset contained no unexpected duplicate rows or missing
values.

## Business Questions

### 1. Who are the main customers?

Customer characteristics were analyzed based on:

- Age group
- Gender
- Membership level
- Device
- Payment method

The objective was to identify the dominant customer profile and help
the company design more relevant marketing campaigns.

### 2. Which city and province are most suitable for advertising?

Cities and provinces were compared using:

- Number of unique customers
- Total customer spending
- Average customer spending
- Average purchase count
- Average order value
- Average satisfaction score

Locations with very small customer samples were excluded from the main
comparison.

### 3. Which customers should be prioritized for a loyalty program?

A loyalty score was calculated using:

- Total spending
- Purchase frequency
- Recent purchasing activity
- Satisfaction score

The variables were normalized before being combined.

The scoring weights were treated as analytical assumptions and were
documented in the notebook.

### 4. Which valuable customers are at risk of becoming inactive?

Customers were identified as at risk when they simultaneously had:

- Spending at or above the 75th percentile
- Purchase count at or above the median
- Days since last purchase at or above the 75th percentile

These customers represent priority targets for reactivation campaigns.

### 5. How are discounts, devices, and payment methods related to customer behavior?

The analysis compared:

- Discount users and non-discount users
- Average spending
- Average purchase count
- Average order value
- Average returned items
- Average satisfaction
- Spending by device
- Spending by payment method

This was a descriptive analysis of observed relationships and does not
prove that discounts caused changes in customer behavior.

### 6. What should be included in the final management report?

The management report summarizes:

- Six key performance indicators
- Three important charts
- Three evidence-based recommendations

The recommendations use the following structure:

`KPI → Evidence → Action`

## Key Findings

### Customer Profile

- The dataset contains 60 customers.
- The average customer age is approximately **43.7 years**.
- The largest age groups are **45–54** and **55–64**.
- Male customers represent 35 customers, while female customers
  represent 25 customers.
- Gold is the largest membership tier.
- Android is the most frequently used device.
- Online Wallet is the most common payment method.

### Geographic Performance

- Mashhad generated the highest total customer spending.
- Tabriz had the largest number of customers.
- Isfahan showed strong average spending and the highest average
  satisfaction among the reviewed locations.
- High revenue alone was not considered sufficient for choosing a
  marketing location; customer volume, average value, and satisfaction
  were also reviewed.

### Loyalty and Retention

- The loyalty analysis identified customers with strong combinations
  of spending, purchase frequency, recent activity, and satisfaction.
- Membership tier alone did not always represent actual customer value.
- Some historically valuable customers also showed long periods of
  inactivity and may require retention campaigns.

### Discount Behavior

- Discount users and non-discount users had similar average spending.
- Their average purchase counts were also close.
- Discount users showed a higher observed average satisfaction score.
- VIP customers appeared less dependent on discounts than some other
  membership groups.
- These results describe associations only and do not establish
  cause-and-effect relationships.

## Business Recommendations

### 1. Protect valuable inactive customers

**KPI:** Number of high-value customers at risk

**Evidence:** Some customers have strong historical spending and
purchase frequency but have not purchased recently.

**Action:** Create personalized reactivation campaigns using loyalty
rewards, relevant product recommendations, and limited-time offers.

### 2. Focus marketing investment on strong locations

**KPI:** Total spending and customer count by city

**Evidence:** Mashhad generated the highest total spending, while
Tabriz had the largest customer base. Isfahan showed high customer
satisfaction and strong average spending.

**Action:** Prioritize Mashhad for value-focused campaigns, consider
Tabriz for customer-acquisition campaigns, and monitor Isfahan as a
potential growth market.

### 3. Use discounts selectively

**KPI:** Average spending and purchase count by discount usage

**Evidence:** Customers who used discounts did not spend substantially
more than customers who did not use discounts.

**Action:** Avoid broad discount campaigns. Use personalized discounts
for at-risk customers, selected loyalty members, and measurable
reactivation experiments.

## Limitations

The analysis has several important limitations:

- Each row represents a summary of one customer rather than individual
  order-level transactions.
- Complete purchase histories and exact purchase dates are not
  available.
- `last_purchase_days` only shows the number of days since the latest
  purchase and cannot prove that a customer has permanently churned.
- Discount analysis is observational and cannot establish a causal
  relationship between discounts and customer behavior.
- `returned_items` contains the number of returned items, but the total
  number of purchased items is unavailable. Therefore, a true return
  rate cannot be calculated.
- Results for cities or customer groups with small sample sizes may be
  unstable and should be interpreted carefully.
- Loyalty-score weights and customer-risk thresholds are analytical
  assumptions and may need adjustment using real business knowledge.
- The dataset contains only 60 customers, so the findings should not be
  generalized to a larger customer population without further data.