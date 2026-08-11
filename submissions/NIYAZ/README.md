# Customer Behavior Analysis — Project 02

## Project Overview
This project analyzes customer behavior data for an online store, taking on the role of a junior data analyst. Rather than producing a simple statistical report, the goal was to translate raw customer data into actionable business decisions across six areas: customer profiling, regional ad targeting, loyalty program selection, churn risk identification, discount/channel behavior, and an executive summary report.

## Dataset Description
The dataset contains 60 customer records with 17 columns:

| Column | Description |
|---|---|
| customer_id | Unique customer identifier |
| first_name | Customer's first name |
| gender | Customer gender |
| age | Customer age |
| city | City of residence |
| province | Province of residence |
| signup_date | Date the customer signed up |
| membership_tier | Membership level (Bronze, Silver, Gold, VIP) |
| purchase_count | Number of purchases made |
| avg_order_value | Average value per order |
| total_spending | Total amount spent by the customer |
| last_purchase_days | Days since the customer's last purchase |
| payment_method | Payment method used (Card, Cash, Online Wallet) |
| device | Device used to shop (Android, iPhone, Web) |
| discount_used | Whether the customer used a discount (Yes/No) |
| returned_items | Number of items returned |
| satisfaction_score | Customer satisfaction rating |

## Data Quality Checks
- No missing values were found across any column.
- No duplicate records were found.
- An unnamed index column (`Unnamed: 0`) generated during export was dropped.
- `signup_date` was converted from text to a proper datetime format.
- Numeric columns were validated/converted to ensure correct data types for analysis.
- No invalid or out-of-range values (e.g., negative ages or spending) were identified.

## Business Questions
1. Who are the store's core customers? (demographic and behavioral profile)
2. Which province and city are best suited for ad investment?
3. Which customers should be prioritized for the loyalty program?
4. Which high-value customers are at risk of becoming inactive?
5. How do discount usage, device, and payment method relate to customer behavior?
6. What does a 5-minute executive summary of the business look like?

## Key Findings

**Q1 — Customer Profile:** Out of 60 customers (average age 43.7, median 45), the largest age group is 55–64 (16 customers), followed by 45–54 (15), 25–34 (11), 35–44 (10), under 25 (7), and 65+ (1). The dominant customer is male, most commonly Gold-tier, using Android as their device and Online Wallet as their payment method.

**Q2 — Regional Opportunity:** Mashhad generates the highest total revenue (43,197.58) from 11 customers, but satisfaction there is below average (2.91). Isfahan has the highest satisfaction score (4.40) but only 5 customers and moderate revenue (21,975.32). Revenue and satisfaction do not always align, so regional strategy should account for both rather than revenue alone.

**Q3 — Loyalty Program:** Using a weighted score (35% total spending, 30% purchase frequency, 20% recency, 15% satisfaction), the top-ranked customer (Maryam, ID 1057, loyalty score 0.86) holds a Bronze membership tier — not Gold or VIP — showing that membership tier alone is not a reliable indicator of actual customer loyalty. Several Gold/VIP customers ranked lower in the top 10 due to lower purchase frequency or longer inactivity.

**Q4 — Churn Risk:** 3 customers qualify as high-value and at-risk (top 25% of spending, above-median purchase count, top 25% of inactivity): Arash (ID 1010, Silver, satisfaction 1/5), Arash (ID 1035, Bronze, satisfaction 3/5), and Sina (ID 1053, Gold, satisfaction 1/5). Two of the three report very low satisfaction, suggesting dissatisfaction-driven disengagement; the third shows moderate satisfaction despite a full year of inactivity, suggesting a different cause.

**Q5 — Discount/Device/Payment Behavior:** Customers who did *not* use a discount (34 customers) spent more on average (3,837.47) than those who did (26 customers, 3,055.72), while also reporting lower satisfaction (2.76 vs 3.27). Return rates were similar between the two groups (4.26 vs 4.08). iPhone users showed the highest average spending among devices, and Card was the highest-spending payment method — despite Android and Online Wallet being the most commonly used options overall. These are descriptive patterns only; no causal relationship is claimed.

**Q6 — Executive Summary:** Across 60 customers, total revenue is 209,922.67, with average spending per customer of 3,498.71, average purchase count of 17.77, average satisfaction of 2.98/5, and 251 total returned items — indicating solid revenue but only moderate customer satisfaction, with room for improvement.

## Business Recommendations

**Recommendation 1**
- **KPI:** Regional Revenue & Satisfaction
- **Action:** Prioritize ad budget for Mashhad while launching a satisfaction-recovery survey there; run a smaller customer-centric campaign in Isfahan to protect and grow its already-loyal base.
- **Evidence:** Mashhad has the highest revenue (43,197.58) but below-average satisfaction (2.91); Isfahan has the highest satisfaction (4.40) with a smaller but healthy customer base (5 customers).

**Recommendation 2**
- **KPI:** High-Value Customer Retention
- **Action:** Launch a targeted win-back campaign for the 3 identified high-value at-risk customers — service-recovery outreach for the two with satisfaction scores of 1/5, and a re-engagement incentive for the one with moderate satisfaction.
- **Evidence:** 3 customers fall in the top 25% of spending and inactivity; 2 of them report satisfaction scores of 1/5.

**Recommendation 3**
- **KPI:** Discount Program Effectiveness
- **Action:** Re-evaluate discount targeting — investigate whether discounts are mainly used by lower-spending or already-dissatisfied segments, rather than assuming discounts drive spending growth.
- **Evidence:** Non-discount customers spent more on average (3,837.47 vs 3,055.72) despite lower satisfaction (2.76 vs 3.27) — a correlation, not a confirmed cause.

## Limitations
- Each row represents a summary snapshot of a customer, not their full order history, so order-level analysis is not possible.
- `last_purchase_days` only shows time since the last purchase, not a complete purchase timeline, so full churn behavior cannot be modeled.
- The discount analysis is descriptive; no causal relationship between discount use and customer behavior can be established from this data.
- `returned_items` shows only the count of returned items, not the total items purchased, so a true return rate cannot be calculated.
- Some cities and segments have small sample sizes (as few as 5 customers), so their averages should be interpreted with caution.
- All conclusions are based solely on the available dataset and should be validated with additional data before major business decisions are made.
