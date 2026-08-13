# Customer Behavior & Sales Analysis

## 1. Project Title

**Customer Behavior & Sales Analysis for Business Decision Making**

---

## 2. Business Problem

The company wants to better understand customer behavior and sales performance in order to make data-driven business decisions.

The main objectives of this project are to:

* Identify the best-performing city for marketing investment.
* Select valuable customers for a loyalty campaign.
* Identify high-value customers who may be at risk of churn.
* Compare customers who used discounts with those who did not.
* Segment customers based on their purchasing behavior.
* Analyze revenue concentration using the Pareto Principle.
* Provide data-driven recommendations for increasing sales.

---

## 3. Dataset Description

The dataset contains customer-level information related to purchasing behavior, customer satisfaction, membership, and spending.

The main features include:

* Customer ID
* Customer Name
* City
* Membership Tier
* Purchase Count
* Total Spending
* Last Purchase Days
* Satisfaction Score
* Returned Items
* Discount Usage

The dataset was cleaned before analysis by handling missing values, correcting inconsistent records, and removing duplicate entries.

---

## 4. Tools and Libraries

The analysis was performed using:

* Python
* Pandas
* NumPy
* Matplotlib
* Seaborn
* Jupyter Notebook

---

## 5. Analysis Steps

The project followed these main steps:

1. Data Loading
2. Data Cleaning
3. Exploratory Data Analysis
4. Overall Customer Performance Analysis
5. City Performance Analysis
6. Loyalty Campaign Customer Selection
7. At-Risk Customer Identification
8. Discount Usage Analysis
9. Customer Segmentation
10. Pareto Revenue Analysis
11. Additional Business Analysis
12. Executive Dashboard Selection
13. Business Recommendations
14. Dataset Limitation Analysis

---

## 6. Key Findings

The analysis produced several important findings:

* **Mashhad** generated the highest total revenue among the analyzed cities and also recorded a high number of purchases.
* High-value customers who had not purchased for more than 180 days were identified as potential **At-Risk Customers**.
* The top 20% of customers generated approximately **54.95% of total revenue**.
* Therefore, the dataset does not strongly follow the traditional **80/20 Pareto pattern**.
* Customer segmentation identified four groups:

  * Champions
  * Loyal Customers
  * At Risk
  * Needs Attention
* Customers were also compared based on discount usage, membership tier, purchase frequency, and total spending.

---

## 7. Customer Segmentation

Customers were divided into four groups using simple business rules based on purchasing behavior and customer activity.

| Segment         | Description                                                                             |
| --------------- | --------------------------------------------------------------------------------------- |
| Champions       | High-spending customers who have purchased recently                                     |
| Loyal Customers | Customers with frequent purchases                                                       |
| At Risk         | Customers who have not purchased for more than 180 days                                 |
| Needs Attention | Customers who do not fall into the other segments and may require additional engagement |

### Recommended Actions by Segment

* **Champions:** Provide exclusive rewards and VIP benefits to maintain loyalty.
* **Loyal Customers:** Encourage repeat purchases through personalized loyalty offers.
* **At Risk:** Use targeted win-back campaigns and personalized incentives.
* **Needs Attention:** Encourage higher purchase frequency through relevant offers and engagement campaigns.

---

## 8. Business Recommendations

### Recommendation 1: Focus on High-Performing Cities

**Evidence:**
Mashhad generated the highest total revenue in the dataset.

**Action:**
Prioritize marketing campaigns in Mashhad and compare campaign performance with other cities before expanding the strategy.

**KPI:**
Measure revenue growth, customer acquisition, and return on marketing investment.

---

### Recommendation 2: Re-Engage High-Value At-Risk Customers

**Evidence:**
Some customers have high total spending but have not purchased for more than 180 days.

**Action:**
Launch targeted win-back campaigns using personalized offers, reminders, or loyalty incentives.

**KPI:**
Track customer reactivation rate, repeat purchase rate, and revenue generated from reactivated customers.

---

### Recommendation 3: Increase Customer Value Through Repeat Purchases

**Evidence:**
The analysis of purchase frequency and total spending shows the relationship between how often customers purchase and their overall spending.

**Action:**
Encourage customers with lower purchase frequency to make repeat purchases through personalized offers, loyalty rewards, and relevant product recommendations.

**KPI:**
Monitor purchase frequency, average customer spending, and repeat purchase rate.

---

### Recommendation 4: Avoid Relying Only on a Small Group of Customers

**Evidence:**
The top 20% of customers generate 54.95% of total revenue rather than approximately 80%.

**Action:**
Continue retaining high-value customers while also increasing the value of mid-value customers through targeted upselling and cross-selling campaigns.

**KPI:**
Measure average spending per customer, revenue contribution by customer segment, and repeat purchase frequency.

---

## 9. Executive Dashboard

If the CEO had only five minutes to review the analysis, the following three charts would provide the most important business insights.

### 1. High-Value Customers at Risk of Churn

**What does the chart show?**
This chart identifies customers who have both high total spending and a long period since their last purchase.

**Why is it important?**
These customers represent a potential revenue risk because the company may lose valuable customers if their inactivity continues.

**Business Decision**
Launch targeted win-back campaigns for these customers using personalized offers, reminders, or loyalty incentives.

---

### 2. Revenue Performance by City

**What does the chart show?**
This chart compares the total revenue generated by each city and highlights the strongest-performing markets.

**Why is it important?**
It helps management identify where the company generates the most revenue and where marketing resources may have the highest potential impact.

**Business Decision**
Prioritize marketing investment in high-performing cities, especially Mashhad, while monitoring the return from each campaign.

---

### 3. Purchase Frequency vs Total Spending

**What does the chart show?**
This chart shows the relationship between purchase frequency and total customer spending and highlights the top 10 highest-spending customers.

**Why is it important?**
It helps management understand whether frequent purchasing is associated with higher customer value and identifies customers who contribute significantly to revenue.

**Business Decision**
Focus retention and loyalty efforts on high-value customers and encourage repeat purchases among customers with lower purchase frequency.

---

### 10. Additional Business Analysis

To generate further customer and business insights, several complementary analyses were performed.

### Purchase Frequency vs Total Spending

This analysis examines the relationship between purchase count and total customer spending and highlights the top 10 highest-spending customers.

### High-Value Customers at Risk of Churn

High-value customers were identified based on spending above the average level and inactivity for more than 180 days. These customers were highlighted as potential churn risks.

### Average Spending by Membership Tier

The average spending of customers across different membership tiers was compared to understand whether higher membership levels are associated with greater customer value.

### Discount Usage vs Average Spending

Customers who used discounts were compared with customers who did not use discounts based on average spending.

The observed differences between the two groups do not prove that discounts directly caused higher spending. Additional data or controlled experiments would be required to establish causality.

---

## 11. Dataset Limitations

The dataset has several limitations that restrict the depth of the analysis:

* Profit per order is not available, so the analysis focuses on revenue rather than actual profitability.
* Exact order dates are unavailable, making it difficult to analyze seasonality and detailed purchasing trends over time.
* Customer acquisition sources are not included, so the effectiveness of different marketing channels cannot be evaluated.
* Marketing costs are not available, which prevents accurate calculation of marketing ROI.
* Product category information is not available, limiting product-level analysis.
* Shipping costs are not included, so the actual net value of orders cannot be calculated.

Additional features such as the following could improve future analysis:

* Profit per Order
* Shipping Cost
* Product Category
* Exact Order Date
* Customer Acquisition Source
* Marketing Cost
* Customer Registration Date

---

## 12. Conclusion

This project demonstrates how customer-level data can be transformed into actionable business insights using Python.

The analysis identified high-performing cities, valuable and at-risk customers, customer segments, discount usage patterns, and revenue concentration.

The results can support more targeted marketing, customer retention, and loyalty strategies while highlighting the limitations of making business decisions without additional information such as profit, marketing costs, and transaction-level dates.
