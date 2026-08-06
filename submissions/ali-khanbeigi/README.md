## 1. Project Title

**Customer Behavior & Sales Analysis for Business Decision Making**

---

## 2. Business Problem

The company wants to better understand customer behavior and sales performance in order to make data-driven business decisions.

The objectives of this project are:

- Identify the best-performing cities.
- Select customers for a loyalty campaign.
- Detect customers at risk of churn.
- Segment customers based on purchasing behavior.
- Evaluate the impact of discounts.
- Analyze revenue concentration using the Pareto Principle.
- Provide business recommendations for increasing sales.

---

## 3. Dataset Description

The dataset contains customer purchase information, including:

- Customer ID
- Customer Name
- City
- Membership Tier
- Purchase Count
- Total Spending
- Last Purchase Days
- Satisfaction Score
- Returned Items
- Discount Usage

The dataset was cleaned before analysis by handling missing values, correcting inconsistent records, and removing duplicate entries.

---

## 4. Tools and Libraries

- Python
- Pandas
- Matplotlib
- Jupyter Notebook

---

## 5. Analysis Steps

The project includes the following analyses:

1. Data Cleaning
2. Exploratory Data Analysis (EDA)
3. City Revenue Analysis
4. Loyalty Campaign Customer Selection
5. At-Risk Customer Identification
6. Discount Effect Analysis
7. Customer Segmentation
8. Pareto (80/20) Analysis
9. Business Recommendations
10. Dataset Limitations

---

## 6. Key Findings

- Mashhad generated the highest total revenue.
- Active customers with high spending were selected for the loyalty campaign.
- Several high-value customers were identified as being at risk due to long inactivity.
- The top 20% of customers generated approximately **54.95%** of total revenue, indicating that the dataset does not strongly follow the Pareto Principle.
- Customer segmentation identified four major customer groups:
  - Champions
  - Loyal Customers
  - At Risk
  - Needs Attention

---

## 7. Customer Segmentation

Customers were segmented using simple business rules:

| Segment | Description |
|----------|-------------|
| Champions | High spending customers with recent purchases |
| Loyal Customers | Customers with frequent purchases |
| At Risk | Customers who have not purchased for more than 180 days |
| Needs Attention | Customers who require engagement to increase loyalty |

---

## 8. Business Recommendations

Recommendation 1

Evidence

Mashhad generated the highest total revenue among all cities, indicating a strong market potential.

Action

Increase marketing campaigns and promotional activities in Mashhad to maximize sales and customer acquisition.

KPI

Measure the increase in total revenue, number of new customers, and return on marketing investment (ROMI) after the campaign.

Recommendation 2
Evidence

Several valuable customers were identified as At Risk because they had high spending but had not purchased for more than 180 days.

Action

Launch personalized re-engagement campaigns, such as exclusive discounts or reminder emails, to encourage these customers to return.

KPI

Track the customer reactivation rate, repeat purchase rate, and revenue generated from reactivated customers.

Recommendation 3
Evidence

The customer segmentation analysis identified Champions and Loyal Customers as the most valuable customer groups.

Action

Introduce a loyalty program with exclusive rewards, early access to promotions, or personalized offers to retain these customers.

KPI

Monitor customer retention rate, repeat purchase frequency, and average customer lifetime value (CLV).

---

## 9. Dataset Limitations

Dataset Limitations

Limitation 1

The dataset does not include the profit for each order. As a result, the analysis is based only on revenue, which may not reflect the actual profitability of customers or products.

Limitation 2

The dataset does not contain the exact order date. Without detailed transaction dates, it is difficult to analyze seasonal trends, customer purchasing patterns over time, or sales growth.

Limitation 3

The dataset does not include the customer acquisition source (such as social media, search engines, or email campaigns). Therefore, it is not possible to evaluate the effectiveness of different marketing channels.

---

## 10. Conclusion

This project demonstrates how data analysis can support business decision-making by identifying customer segments, evaluating sales performance, detecting churn risks, and providing actionable recommendations. The insights generated from this analysis can help improve customer retention, optimize marketing strategies, and support sustainable business growth.
