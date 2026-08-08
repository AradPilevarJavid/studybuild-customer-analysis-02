# Project 02: Customer Behavior Analysis and Business Decision Making

## Overview

This project focuses on analysing customer behaviour to support business decision-making using a retail customer dataset.

The analysis answers a series of real-world business questions related to customer value, city performance, churn prediction, discount effectiveness, customer segmentation, and revenue distribution.

To support these decisions, techniques such as feature engineering, Min-Max normalization, weighted scoring, customer segmentation, and Pareto Analysis were applied to transform raw customer data into actionable business insights.

---

# Tools and Libraries

The following libraries were used throughout the project:

- **Pandas** for data manipulation, aggregation, filtering, and feature engineering.
- **Matplotlib** for data visualization.
- 
---

# Business Questions

The project addresses the following business problems:

- Select the best city for future advertising investment.
- Identify the company's top 10 most valuable customers.
- Detect customers at risk of churn.
- Evaluate whether discounts improve customer purchasing behaviour.
- Segment customers according to purchasing behaviour.
- Determine whether customer revenue follows the Pareto Principle (80/20 rule).

---

# Data Transformation

Several preprocessing and feature engineering techniques were applied before performing the analyses.

### Normalization

Numerical variables were normalized using **Min-Max Scaling** before calculating weighted business scores.

This ensured that variables with different numerical scales contributed fairly to the final scores.

---

### Weighted Scoring

Two weighted scoring models were developed:

- **City Score**
- **Customer Score**

Each score combines multiple business indicators into a single performance metric.

---

### Feature Engineering

Several new analytical features were created, including:

- Return Rate
- Customer Score
- City Score
- Membership Tier Encoding
- Customer Segment

---

# Business Analysis

## City Performance Analysis

Cities were evaluated using multiple business indicators rather than total revenue alone.

The analysis considered:

- Total Revenue
- Number of Customers
- Purchase Count
- Average Spending
- Customer Satisfaction
- Return Rate

After normalization, a weighted City Score was calculated to rank cities according to their overall business performance.

---

## Top Customer Selection

Customers were ranked using a weighted Customer Score based on:

- Total Spending
- Purchase Frequency
- Membership Tier
- Customer Satisfaction
- Recency (Days Since Last Purchase)

The highest-scoring customers were selected as the company's most valuable customers.

---

## Customer Churn Analysis

Customers with high historical value but long periods of inactivity were identified as potential churn risks.

This analysis supports customer retention strategies before valuable customers are lost.

---

## Discount Effectiveness Analysis

Customers who used discounts were compared with customers who did not.

The following metrics were analysed:

- Average Spending
- Purchase Count
- Customer Satisfaction
- Return Rate

This comparison evaluates whether discount campaigns generate additional customer value.

---

## Customer Segmentation

Customers were segmented into four business groups:

- Champions
- Loyal Customers
- At Risk
- Needs Attention

The segmentation was based on spending behaviour, purchase frequency, and purchase recency.

---

## Pareto Analysis

Customers were sorted according to revenue contribution.

A cumulative revenue percentage was calculated to evaluate whether the dataset follows the **80/20 Pareto Principle**.

---

# Results

## City Performance Ranking

The weighted City Score identifies the strongest city for future advertising investment by combining revenue, customer behaviour, satisfaction, and return rate.

<p align="center">
  <img src="images/city-analysis.png" width="750">
</p>

---

## Customer Segmentation

Customers were classified into four business segments to support personalized marketing and customer retention strategies.

<p align="center">
  <img src="images/customer-segmentation.png" width="500">
</p>

---

## Pareto Analysis

The Pareto chart evaluates revenue concentration among customers.

The analysis showed that the **top 20% of customers generated approximately 54.5% of total revenue**, indicating that the dataset does **not** follow the traditional 80/20 Pareto Principle.

<p align="center">
  <img src="images/pareto-analysis.png" width="750">
</p>

---

# Key Business Insights

- The highest-ranked city represents the strongest opportunity for future advertising investment.
- High-value customers were identified through a multi-factor weighted scoring model.
- Churn-risk customers were detected based on purchase history and inactivity.
- Customers using discounts generally spent more and reported higher satisfaction, while the increase in return rate remained relatively small.
- Customer segmentation supports targeted marketing campaigns and loyalty strategies.
- Revenue is relatively well distributed among customers rather than being concentrated in a small group.

---

# Technologies

- Python
- Pandas
- Matplotlib
---

# Final Outcome

This project demonstrates how customer transaction data can be transformed into meaningful business intelligence through statistical analysis, feature engineering, weighted scoring, customer segmentation, and data visualization.

The analyses provide actionable recommendations that support marketing strategy, customer retention, and data-driven business decision-making.
