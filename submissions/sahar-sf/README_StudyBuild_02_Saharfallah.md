# StudyBuild – Project 02: Customer Analytics

## About the Project

This project is about analyzing customer data for an online store.

The goal is to use Python and basic data analysis to answer business questions and give simple recommendations for the business.

## Tools Used

- Python
- Jupyter Notebook
- Pandas
- NumPy
- Matplotlib
- Excel dataset

## Dataset

The project uses a cleaned Excel dataset containing customer and purchase information.

Some of the main columns used in the analysis are:

- `customer_id`
- `first_name`
- `age`
- `city`
- `membership_tier`
- `purchase_count`
- `total_spending`
- `avg_order_value`
- `last_purchase_days`
- `satisfaction_score`
- `returned_items`
- `discount_used`

## Main Business Questions

The analysis answers these six main questions:

1. Which cities should be targeted for marketing campaigns?
2. Who are the top 10 customers for a loyalty program?
3. Which customers are at risk of churn?
4. What is the impact of discounts on customer behavior?
5. How can customers be segmented based on value and behavior?
6. Do 20% of customers generate around 80% of the revenue?

## Project Steps

### 1. Load the Data

The cleaned Excel file is loaded with Pandas and the dataset structure is checked.

### 2. Business Overview and KPIs

The following KPIs are calculated:

- Total customers
- Total purchases
- Total revenue
- Average spending per customer
- Average order value
- Average satisfaction score
- Return rate

### 3. City Analysis

Cities are compared using:

- Number of customers
- Total revenue
- Number of purchases
- Average satisfaction
- Average returns
- Revenue per customer

A marketing score is calculated to select the best city for marketing.

A chart for revenue by city and marketing score is also created.

### 4. Top 10 Customers

Customers are ranked using a score based on:

- Total spending
- Number of purchases
- Recency of the last purchase
- Satisfaction score

The top 10 customers are selected for a possible loyalty campaign.

### 5. At-Risk Customers

Customers whose last purchase was more than 90 days ago are considered at risk.

These customers are identified so the business can try to bring them back.

### 6. Discount Impact

Customers who used and did not use discounts are compared.

The analysis looks at:

- Average spending
- Average purchases
- Average satisfaction
- Average returns

Box plots are also used to compare spending and satisfaction.

### 7. Customer Segmentation

Customers are divided into four groups:

- **Champions**
- **Loyal**
- **At Risk**
- **Needs Attention**

The segmentation is based mainly on customer spending and how recently they purchased.

A simple action is suggested for each group.

### 8. Pareto Analysis

A Pareto analysis is used to check whether a small percentage of customers generate a large percentage of total revenue.

The analysis focuses on the top 20% of customers and their share of total revenue.

### 9. CEO Dashboard

A simple dashboard is created with three charts:

1. Revenue by city
2. Customer segments
3. Satisfaction vs. spending

### 10. Business Recommendations

Based on the analysis, three main recommendations are provided:

- Focus marketing on the top-performing cities.
- Create a loyalty program for top customers.
- Try to reactivate at-risk customers.

## Main Analysis Rules

Some important rules used in the project are:

- Churn threshold: more than 90 days since the last purchase.
- Top customers: selected using a customer score.
- Customer segmentation: based mainly on spending and recency.
- Pareto analysis: focuses on the top 20% of customers.
- City selection: uses a combined marketing score.

## Output Files

The notebook creates several charts:

- `city_analysis.png`
- `discount_analysis.png`
- `pareto_analysis.png`
- `dashboard_ceo.png`

The notebook also prints the main KPI results, customer lists, segment summaries, Pareto result, and business recommendations.


