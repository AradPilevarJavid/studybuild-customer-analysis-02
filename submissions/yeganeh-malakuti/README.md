# Project 02: Customer Behavior Analysis & Visualization

## 📊 Overview

This project is part of the **StudyBuild** program and is a continuation of the
previous e-commerce data cleaning project.

The goal of this project is to analyze the cleaned customer dataset and
transform customer information into meaningful business insights through
data analysis and visualization.

The analysis focuses on customer value, purchasing behavior, marketing
opportunities, customer retention, and factors that influence customer
behavior.

---

## 🎯 Analysis Objectives

The project answers several business-oriented questions:

1. **Who are the most valuable customers?**
2. **Which cities are most suitable for marketing?**
3. **Which customers are suitable for loyalty planning?**
4. **Which valuable customers are at risk of becoming inactive?**
5. **How do discounts, devices, and payment methods affect customer behavior?**
6. **What are the most important insights for the CEO?**

---

## 🔍 Analysis Performed

### 1. Customer Value Analysis

Customers were evaluated based on:

* Total spending
* Purchase frequency
* Purchase recency
* Satisfaction score

These factors were normalized and combined into a weighted **Loyalty Score**
to identify the top 10 most valuable customers.

**Visualization:**

* Top 10 customers by Loyalty Score
* Purchase count vs. total spending
* Customer activity represented by point size

---

### 2. Marketing Location Analysis

Customers were grouped by **province and city** to identify locations with
stronger business potential.

The analysis considered:

* Number of customers
* Total spending
* Average purchase count
* Average order value
* Average satisfaction

Cities with fewer than three customers were excluded to avoid making
decisions based on very small customer groups.

**Visualizations:**

* Top 10 cities by total customer spending
* City spending vs. average satisfaction
* Customer count represented by point size

---

### 3. Loyalty Planning

A weighted scoring model was created to identify customers who are strong
candidates for loyalty programs.

The score considered:

* Total spending – **35%**
* Purchase frequency – **30%**
* Recency – **20%**
* Satisfaction – **15%**

Customers with higher scores were considered stronger candidates for
loyalty strategies.

---

### 4. Customer Churn Risk Analysis

The analysis identified valuable customers who may be at risk of becoming
inactive.

A customer was classified as at risk when they had:

* High total spending
* At least median purchase frequency
* High number of days since their last purchase

**Visualization:**

* Days since last purchase vs. total spending
* At-risk customers highlighted separately

---

### 5. Customer Behavior & Discount Analysis

The analysis examined whether different factors were associated with
differences in customer behavior.

The following factors were analyzed:

* Discount usage
* Device
* Payment method

Customer behavior was compared using metrics such as:

* Average total spending
* Average purchase count
* Average order value
* Average returned items
* Average satisfaction

A dual-axis visualization was used for discount analysis because total
spending and returned items have very different scales.

---

## 📈 Key Business Insights

The analysis provides several actionable insights:

* High-value customers can be identified using a combination of spending,
  purchase frequency, recency, and satisfaction rather than spending alone.
* Some cities generate significantly more customer spending and may be
  stronger candidates for targeted marketing.
* Valuable but inactive customers represent potential churn risks and can
  be targeted with retention strategies.
* Discount effectiveness should be evaluated by comparing increased spending
  with potential increases in returned items.
* Customer data can support more targeted marketing and loyalty strategies
  instead of applying the same approach to all customers.

---

## 💡 Business Recommendations

### 1. Focus Marketing on High-Performing Cities

**Evidence:**
Some cities generate substantially higher customer spending than others.

**Action:**
Prioritize marketing campaigns and budget allocation in high-performing
cities.

**KPI:**
Measure revenue generated per city and marketing ROI.

### 2. Build Loyalty Strategies for Valuable Customers

**Evidence:**
Customers with high spending, frequent purchases, recent activity, and good
satisfaction scores were identified as the most valuable segment.

**Action:**
Provide personalized rewards and incentives to encourage repeat purchases.

**KPI:**
Track repeat purchase rate, average customer spending, and retention rate.

### 3. Use Discounts Selectively

**Evidence:**
Customers using discounts showed different spending and return patterns
compared with customers who did not use discounts.

**Action:**
Target discounts toward customer segments where they generate additional
value rather than applying them broadly.

**KPI:**
Track incremental revenue, average order value, and return rate.

---

## 📊 Executive Summary

The analysis transforms the cleaned customer dataset into actionable
business insights related to customer value, marketing opportunities,
loyalty planning, churn risk, and purchasing behavior.

The results can help the business make more data-driven decisions about
where to focus marketing efforts, which customers to prioritize, and how
to improve retention and sales strategies.

---

## 🛠 Tools Used

* **Python 3.11**
* **pandas** – Data analysis and aggregation
* **NumPy** – Numerical calculations and normalization
* **Matplotlib** – Data visualization
* **Jupyter Notebook** – Analysis and development

---

## 📂 Files

* `customer_analysis_yeganeh-malakuti.ipynb` – Full analysis and
  visualization workflow
* `cleaned_dataset_yeganeh-malakuti.xlsx` – Cleaned dataset used for the
  analysis
* `analysis_report_yeganeh-malakuti.pdf` – Detailed analysis and findings

---

## ✅ Conclusion

This project demonstrates how a cleaned customer dataset can be transformed
into practical business insights using Python and data visualization.

By analyzing customer value, location, loyalty potential, churn risk, and
behavioral factors, the project provides a data-driven foundation for
improving **sales, customer retention, loyalty strategies, and marketing
decisions**.

---

**Prepared by:** Yeganeh Malakuti
**Project:** StudyBuild – Project 02
