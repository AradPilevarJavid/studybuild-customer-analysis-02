# Customer Behavior & Business Insights

## Project Overview

This project analyzes customer behavior and purchasing patterns to uncover actionable business insights.

The analysis is based on the cleaned dataset produced in **Project 01 – Data Cleaning**. After preparing and validating the dataset in the previous project, the cleaned data is used here for exploratory data analysis and business-focused customer analysis.

The main goal is to understand customer value, identify potential purchase risks, evaluate geographic and discount related patterns, and explore customer segments that can support business decision making.

---

## Business Questions

This project focuses on the following business questions:

1. **Which customers generate the highest value for the business?**
2. **Which customers may be at risk of not making future purchases?**
3. **Which cities appear to have stronger potential for advertising?**
4. **Are discounts associated with higher or lower customer spending?**
5. **What actions could the company take to increase sales?**

---

## Dataset

The dataset contains customer-level information related to purchasing behavior, including variables such as:

* Customer demographics
* Purchase history
* Spending
* Order frequency
* Satisfaction
* Returns
* Location
* Membership tier
* Device
* Payment method
* Discount usage

The raw data was cleaned and prepared in **Project 01 – Data Cleaning**, and the resulting cleaned dataset was used as the input for this project.

---

## Tools & Technologies

* **Python**
* **Pandas**
* **NumPy**
* **Matplotlib**
* **Plotly**
* **Visual Studio Code**

---

## Workflow

1. **Data Loading & Initial Inspection**
2. **Exploratory Data Analysis**
3. **Customer Value Analysis**
4. **Customer Purchase Risk Analysis**
5. **City-Level Advertising Analysis**
6. **Discount Effectiveness Analysis**
7. **Customer Segmentation Analysis**

   * Membership Tier
   * Age Group
   * Device & Payment Method
8. **Business Insights & Recommendations**
9. **Conclusion**

---

## Key Analyses

### 1. Customer Value Analysis

Customers were evaluated based on three key metrics:

* Average Order Value (AOV)
* Total Spending
* Purchase Count

These metrics were normalized and combined into a **Customer Value Score** to identify high-value customers.

### 2. Customer Purchase Risk Analysis

A simple exploratory risk score was created using:

* Days since the last purchase
* Number of returned items
* Customer satisfaction

This score is intended to identify potential purchase risk patterns and **does not represent a predictive churn model**.

### 3. City Level Analysis

Customer spending and purchasing behavior were compared across cities to identify locations with stronger existing customer activity and potential opportunities for advertising.

### 4. Discount Analysis

Customer spending was compared between customers who used discounts and those who did not.

Since this is an observational analysis, the results show differences between groups but **cannot establish that discounts directly caused changes in spending**.

### 5. Customer Segmentation

Customer behavior was further explored across:

* Membership tiers
* Age groups
* Device and payment method combinations

These analyses were used to identify differences in customer value and purchasing behavior across segments.

---

## Key Insights

The analysis revealed several notable patterns:

* High value customers can be identified by combining spending, purchase frequency, and average order value rather than relying on a single metric.
* Some customers show potential purchase-risk signals based on recency, returns, and satisfaction.
* Certain cities demonstrate stronger customer spending and activity, making them potential candidates for further advertising analysis.
* Discount users and non-users show differences in spending behavior, although the analysis does not establish causality.
* Customer value varies across membership tiers and age groups.
* Device and payment method combinations show differences in customer spending, although some segments have relatively small customer counts.

---

## Business Recommendations

Based on the analysis, the following actions could help support sales growth:

1. **Focus on high-value customers** with targeted retention and loyalty strategies.
2. **Monitor potential at-risk customers** and consider personalized re-engagement campaigns.
3. **Further evaluate high-performing cities** before allocating additional advertising budget.
4. **Evaluate discount strategies carefully** rather than assuming discounts automatically increase spending.
5. **Use membership-tier insights** to develop more targeted loyalty strategies.
6. **Investigate high-value age groups** and tailor marketing campaigns to their purchasing behavior.
7. **Optimize customer channels** by examining device and payment-method preferences.
8. **Validate segment-level findings with larger datasets** before making major business decisions.


---

## Conclusion

This project demonstrates how exploratory data analysis can be used to move from customer level data to actionable business insights.

By analyzing customer value, purchase risk, geographic patterns, discount usage, and customer segments, the analysis provides several directions for customer retention, marketing, and sales strategies.

The project also demonstrates the complete workflow from **data cleaning in Project 01** to **business-focused analysis in Project 02**, using the cleaned dataset as the foundation for further analysis.

