# Project 02 — Customer Behavior Analysis

## 1. Project Title

### Customer Behavior Analysis for Business Decision-Making

This project analyzes customer behavior for an e-commerce store using the cleaned dataset produced in Project 01.

The main objective is to transform customer data into actionable business insights that can help management make better decisions about:

- Marketing budget allocation
- Customer loyalty
- Customer retention
- Discount strategy
- Customer segmentation
- Revenue concentration
- Sales growth

The analysis was performed using Python and the results were documented through a Jupyter Notebook, charts, an Excel results file, and a final PDF report.

---

## 2. Business Problem

The company has collected customer data, but management needs to understand how this data can support business decisions.

The CEO needs answers to several important questions:

- Which city should receive the advertising budget?
- Which customers are the most valuable for a loyalty campaign?
- Which customers may be at risk of churn?
- Do discounts appear to increase customer purchases?
- How should customers be segmented?
- Does a small group of customers generate a large share of revenue?
- What actions can increase sales?

The purpose of this project is not only to calculate statistics or create charts, but also to translate the results into practical business recommendations.

---

## 3. Dataset Description

The analysis uses the cleaned customer dataset from Project 01.

The dataset contains:

- 60 customers
- 17 variables
- No missing values after the cleaning process
- Customer demographic information
- Purchase behavior
- Membership information
- Customer satisfaction
- Payment and device information

Important variables include:

- `customer_id`
- `first_name`
- `gender`
- `age`
- `city`
- `province`
- `signup_date`
- `membership_tier`
- `purchase_count`
- `avg_order_value`
- `total_spending`
- `last_purchase_days`
- `payment_method`
- `device`
- `discount_used`
- `returned_items`
- `satisfaction_score`

### Main Dataset KPIs

| KPI | Value |
|---|---:|
| Total Customers | 60 |
| Total Purchases | 1,043 |
| Total Revenue | $201,985.73 |
| Average Spending per Customer | $3,366.43 |
| Average Order Value | $213.16 |
| Average Satisfaction | 2.98 / 5 |
| Return Rate | 21.86% |

---

## 4. Tools and Libraries

The project was developed using Python and Jupyter Notebook.

### Main Tools

- Python
- Jupyter Notebook
- Microsoft Excel

### Python Libraries

- Pandas
- NumPy
- Matplotlib
- Seaborn
- SciPy
- Scikit-learn

### Library Usage

**Pandas**

Used for:

- Loading the dataset
- Data cleaning and transformation
- Grouping and aggregation
- KPI calculation
- Customer analysis

**NumPy**

Used for numerical calculations and data manipulation.

**Matplotlib and Seaborn**

Used to create charts and visualizations.

**SciPy**

Used for statistical testing, including comparison of discount and non-discount customers.

**Scikit-learn**

Used for customer segmentation and machine-learning-related analysis.

---

## 5. Analysis Steps

The analysis was performed through the following steps:

1. Load the cleaned dataset from Project 01.
2. Inspect the dataset structure and data types.
3. Check missing values and data quality.
4. Calculate overall business KPIs.
5. Compare cities using multiple business indicators.
6. Select the best city for advertising.
7. Select the top 10 customers for a loyalty campaign.
8. Identify customers potentially at risk of churn.
9. Compare discount users and non-discount users.
10. Segment customers into four behavioral groups.
11. Perform Pareto revenue analysis.
12. Create management-oriented visualizations.
13. Develop three data-driven business recommendations.
14. Identify dataset limitations.
15. Export analysis results and charts.

---

## 6. Key Findings

### 6.1 Overall Business Performance

The dataset contains 60 customers and 1,043 purchases.

The company generated approximately:

**$201,985.73 in total customer spending.**

Average spending per customer is approximately:

**$3,366.43**

Average customer satisfaction is:

**2.98 / 5**

The return rate is approximately:

**21.86%**

The satisfaction score indicates that customer experience should be monitored and improved.

---

### 6.2 Best City for Advertising

Based on the analysis of:

- Total revenue
- Number of customers
- Purchase count
- Average spending
- Satisfaction
- Return rate

**Mashhad** was selected as the main city for the advertising campaign.

Mashhad results:

- Customers: 11
- Purchases: 249
- Total Revenue: $43,197.58
- Average Spending per Customer: $3,927.05
- Average Satisfaction: 2.91 / 5
- Return Rate: approximately 12%

Mashhad has the highest total revenue and the highest purchase count among the cities.

However, this recommendation should be considered carefully because the dataset does not contain advertising cost or customer acquisition cost.

---

### 6.3 Top 10 Customers for Loyalty Campaign

The company can only provide a loyalty reward to 10 customers.

The selected customers were evaluated using multiple factors:

- Total Spending
- Purchase Count
- Membership Tier
- Satisfaction Score
- Last Purchase Days

The objective is to prioritize customers who have demonstrated strong customer value and purchasing activity.

The selected customers should receive personalized loyalty benefits such as:

- Special rewards
- Exclusive offers
- Early access to products
- Personalized discounts
- Loyalty credits

---

### 6.4 Customers at Risk of Churn

Seven customers were identified as potentially at risk of churn.

The analysis considers customers who have:

- High or meaningful historical spending
- A long period since their last purchase
- Potential dissatisfaction

Historical spending associated with these customers is approximately:

**$31,113.53**

These customers should be considered potential churn risks rather than confirmed churned customers.

A targeted win-back campaign is recommended.

---

### 6.5 Discount Analysis

Customers who used discounts were compared with customers who did not use discounts.

The comparison included:

- Number of customers
- Purchase count
- Average spending
- Customer satisfaction
- Return rate

The analysis showed differences between the two groups.

However, a difference between two groups does not automatically mean that the discount caused higher sales.

Therefore:

> The current dataset does not provide sufficient evidence to conclude that discounts directly cause increased sales.

A controlled A/B test is recommended for future decision-making.

---

### 6.6 Pareto Revenue Analysis

The top 20% of customers represent:

**12 customers**

These customers generate approximately:

**51% of total revenue.**

Therefore, the company has meaningful revenue concentration among high-value customers.

However, the classic 80/20 pattern does not exist because 20% of customers generate approximately 51% rather than 80% of revenue.

This means that customer value is concentrated, but not extremely concentrated.

---

## 7. Customer Segmentation

Customers were divided into four behavioral groups:

### Champions

These customers show strong customer value through high spending, frequent purchases, recent activity, and relatively high satisfaction.

**Main characteristic:**

High-value and highly engaged customers.

**Recommended action:**

- Protect these customers
- Provide loyalty rewards
- Offer VIP benefits
- Provide early access to products
- Use personalized offers

---

### Loyal Customers

These customers purchase regularly and show relatively recent activity and good satisfaction.

**Main characteristic:**

Consistent purchasing behavior and relatively strong engagement.

**Recommended action:**

- Encourage repeat purchases
- Provide loyalty points
- Recommend relevant products
- Offer personalized rewards

---

### At Risk

These customers have meaningful historical value but have not purchased recently and may have low satisfaction.

**Main characteristic:**

Previously valuable customers showing signs of disengagement.

**Recommended action:**

- Launch win-back campaigns
- Offer personalized incentives
- Contact dissatisfied customers
- Investigate reasons for inactivity

---

### Needs Attention

This is the largest segment of the customer base.

These customers generally show moderate or lower spending, weaker engagement, or lower satisfaction.

**Main characteristic:**

Customers with potential for improvement but requiring targeted attention.

**Recommended action:**

- Use low-cost personalized communication
- Improve customer experience
- Encourage repeat purchases
- Use targeted promotions

---

## 8. Business Recommendations

### Recommendation 1 — Focus Marketing on Mashhad

#### Evidence

Mashhad has the highest total revenue at approximately $43,197.58 and the highest purchase count with 249 purchases.

#### Action

Allocate the main advertising budget to Mashhad and focus on customer acquisition and repeat purchases.

#### KPI

- Total Revenue
- Number of Customers
- Purchase Count
- Revenue per Customer

---

### Recommendation 2 — Launch a Win-Back Campaign

#### Evidence

Seven customers were identified as potentially at risk of churn, representing approximately $31,113.53 in historical spending.

#### Action

Create a targeted win-back campaign using personalized offers, limited-time incentives, free shipping, or customer-service follow-up.

#### KPI

- Reactivation Rate
- Repeat Purchase Rate
- Revenue from Reactivated Customers
- Customer Satisfaction

---

### Recommendation 3 — Use Discounts Selectively

#### Evidence

There are differences between customers who used discounts and customers who did not. However, these differences do not prove a causal relationship between discounts and increased sales.

#### Action

Run controlled A/B tests before expanding discount campaigns. Discounts should target selected customer segments instead of all customers.

#### KPI

- Purchase Count
- Revenue per Customer
- Average Order Value
- Return Rate
- Customer Satisfaction
- Profit Margin

---

## 9. Dataset Limitations

### 9.1 Small Sample Size

The dataset contains only 60 customers.

Therefore, statistical results may not represent the entire customer population.

---

### 9.2 No Transaction-Level History

The dataset contains aggregated variables such as:

- Purchase Count
- Total Spending
- Last Purchase Days

However, it does not contain individual transaction records and exact order dates.

Therefore, it is difficult to analyze:

- Purchasing trends
- Seasonality
- Monthly sales
- Changes in customer behavior over time

---

### 9.3 No Profit Information

The dataset contains revenue-related information but does not contain:

- Product cost
- Shipping cost
- Marketing cost
- Profit per order
- Profit margin

Therefore:

**Revenue should not be treated as the same as profit.**

---

### 9.4 Churn Is Not Directly Observed

The dataset does not contain an actual churn indicator.

The "At Risk" group was created using behavioral rules based on:

- Historical customer value
- Last purchase recency
- Customer satisfaction

Therefore, these customers should be considered potential churn risks rather than confirmed churned customers.

---

### 9.5 Limited Marketing Information

The dataset does not contain:

- Advertising cost
- Marketing campaign
- Customer acquisition channel
- Advertising source
- Customer acquisition cost

Therefore, the analysis cannot accurately calculate marketing ROI or customer acquisition cost.

---

### 9.6 Additional Data That Would Improve the Analysis

Future analysis would be more accurate if the company collected:

- Exact Order Date
- Order ID
- Product Category
- Product Price
- Product Cost
- Shipping Cost
- Profit per Order
- Marketing Campaign Cost
- Customer Acquisition Channel
- Advertising Source
- Discount Amount
- Discount Percentage
- Actual Churn Status
- Customer Support Interactions
- Order Cancellation Information

---

## Project Outputs

The project produces the following main outputs:

### Jupyter Notebook

`customer_analytics_aliaghilii.ipynb`

Contains the complete Python analysis, calculations, charts, and explanations.

### Excel Results

`customer_analytics_results.xlsx`

Contains the main analytical results and tables.

### Charts

The project includes charts for:

- City revenue analysis
- Top 10 customers
- Churn risk
- Discount comparison
- Customer segmentation
- Pareto revenue analysis

### PDF Report

`Project_Report.pdf`

A management-oriented report summarizing the most important findings, charts, recommendations, and limitations.

### README

`README.md`

Provides documentation about the project, methodology, findings, recommendations, and limitations.

---

## Conclusion

This project transforms customer data into practical business insights.

The analysis suggests that the company should:

1. Prioritize Mashhad for the main marketing campaign.
2. Protect high-value customers through loyalty initiatives.
3. Actively target potentially at-risk customers.
4. Use discounts selectively and validate their impact through controlled testing.
5. Use behavioral segmentation rather than relying only on existing membership tiers.

Because the dataset contains only 60 customers and lacks transaction-level, cost, profit, and marketing information, the findings should be treated as evidence-based business guidance rather than definitive long-term conclusions.