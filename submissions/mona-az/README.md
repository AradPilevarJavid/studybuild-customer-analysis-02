Project 02 — Customer Analytics

Study&Build 2026

Project Overview

This project focuses on analyzing customer behavior in an e-commerce dataset to support business and managerial decision-making.

The analysis is structured around six main business questions:

What are the main characteristics of the customers?
Which geographical areas are more suitable for advertising?
Which customers should be prioritized for the loyalty program?
Which high-value customers are at risk of becoming inactive?
What is the relationship between discounts, devices, payment methods, and customer behavior?
How can the main findings be presented in a concise management report?

The objective is not only to describe the customer base, but also to identify business opportunities, high-value customers, potential churn risks, and actionable areas for management attention.

Data Preparation

The analysis was performed using the cleaned customer dataset generated in the previous data-cleaning project.

The cleaned dataset was loaded once at the beginning of the analysis notebook and was used as the main source for all six questions.

The analysis did not modify the original cleaned dataset directly. Instead, separate DataFrame copies were created for specific analyses when necessary.

For each analysis, rows with missing values in the variables required for that specific calculation were excluded from that particular analysis. This approach prevents unnecessary deletion of customer records from the overall dataset.

For example, if a customer has a missing returned_items value, that customer is not automatically removed from the entire dataset. The customer may still be included in analyses that do not require returned_items.

Missing returned_items values were not artificially replaced with zero or fabricated values because doing so could introduce misleading information into the analysis.

Question 1 — Understanding Customer Characteristics
Business Question

What are the main characteristics of the customer base?

The analysis examined the following customer attributes:

customer_id
gender
age
membership_tier
device
payment_method

Customers with missing values in the required demographic and behavioral fields were excluded only from this specific analysis.

An age_group variable was created to categorize customers into the following groups:

Under 25
25–34
35–44
45–54
55–64
65 and older

The analysis calculated:

Number of unique customers
Mean age
Median age
Most common gender
Most common membership tier
Most common device
Most common payment method

The distribution of age groups, membership tiers, devices, and payment methods was also visualized.

Key Finding

The customer profile analysis provides an overall view of the demographic and behavioral characteristics of the customer base.

The detailed numerical results are available in the analysis notebook and the final Excel output.

These results can help management better understand the current customer population and identify the dominant customer segments.

Question 2 — Selecting Suitable Areas for Advertising
Business Question

Which geographical areas are more suitable for advertising campaigns?

The analysis was performed at the city and province level using:

province
city
customer_id
total_spending
purchase_count
avg_order_value
satisfaction_score

For each city, the following metrics were calculated:

Number of unique customers
Total customer revenue
Average customer spending
Average purchase count
Average order value
Average customer satisfaction

Cities with fewer than three customers were excluded from the ranking to avoid making decisions based on very small customer populations.

The top 10 cities were then identified based on total revenue.

A scatter plot was also used to compare the financial value of cities with customer satisfaction.

Key Finding

The analysis identifies the cities with the highest total customer spending and therefore highlights geographical areas with stronger observed commercial value.

The top 10 cities can be considered potential priorities for further advertising investigation.

However, high historical revenue alone does not necessarily mean that additional advertising will produce a higher return. Advertising decisions should also consider customer satisfaction, customer volume, acquisition costs, and future growth potential.

The detailed city-level results are available in the City Analysis sheet of the final Excel file.

Question 3 — Identifying High-Value and Loyal Customers
Business Question

Which customers should be prioritized for the loyalty program when only 10 customers can be selected?

The selection was not based solely on membership tier.

Instead, customers were evaluated using four dimensions:

Financial value
Purchase frequency
Recency of activity
Customer satisfaction

The following variables were used:

customer_id
first_name
membership_tier
purchase_count
total_spending
last_purchase_days
satisfaction_score

Min-max normalization was applied to:

total_spending
purchase_count
satisfaction_score

A recency score was also calculated so that customers with fewer days since their last purchase received a higher score.

The final loyalty score was calculated using the following weights:

Loyalty Score =
0.35 × Financial Value
+ 0.30 × Purchase Frequency
+ 0.20 × Recency
+ 0.15 × Satisfaction

The 10 customers with the highest loyalty scores were selected as priority customers for the loyalty program.

Key Finding

The loyalty analysis provides a more comprehensive selection method than relying only on membership tier.

The final list of 10 selected customers is available in the Top Loyal Customers sheet of the final Excel file.

The selected customers represent those who combine stronger financial value, more frequent purchasing behavior, more recent activity, and higher satisfaction according to the defined scoring model.

Question 4 — Identifying High-Value Customers at Risk of Becoming Inactive
Business Question

Which valuable customers may be at risk of becoming inactive?

The analysis aimed to identify customers who have historically generated significant value but have not purchased recently.

Three thresholds were defined:

Financial value threshold: 75th percentile of total_spending
Purchase frequency threshold: median of purchase_count
Inactivity threshold: 75th percentile of last_purchase_days

A customer was classified as being at risk when all three conditions were satisfied:

total_spending ≥ 75th percentile
AND
purchase_count ≥ median
AND
last_purchase_days ≥ 75th percentile

This approach identifies customers who:

Have relatively high financial value
Have demonstrated meaningful purchase activity
Have not purchased for a relatively long period
Key Finding

The identified customers represent a potentially important target group for retention and win-back campaigns.

The purpose of this analysis is to prioritize customers for re-engagement rather than to claim that these customers will definitely churn.

The complete list of customers identified as being at risk is available in the At Risk Customers sheet of the final Excel file.

Question 5 — Comparing Customer Behavior by Discount, Device, and Payment Method
Business Question

How do discounts, devices, and payment methods differ in their observed relationship with customer behavior?

The analysis examined:

discount_used
device
payment_method
total_spending
purchase_count
avg_order_value
returned_items
satisfaction_score

The following metrics were calculated:

Number of customers
Average total spending
Average purchase count
Average order value
Average returned items
Average satisfaction

The analysis compared customer groups based on:

Discount usage
Device type
Payment method

The comparison was descriptive and observational.

No causal relationship was assumed between discount usage and purchasing or return behavior.

For example, if customers who used discounts had higher average spending, this result does not prove that discounts caused higher spending. Other factors may also influence the observed differences.

Similarly, missing returned_items values were not automatically replaced with zero because a missing value does not necessarily mean that no items were returned.

Key Finding

The analysis provides a descriptive comparison of customer behavior across different discount, device, and payment-method groups.

The results can help management identify behavioral differences between customer segments and generate hypotheses for further investigation.

The detailed results are available in the Discount Analysis sheet of the final Excel file.

Question 6 — Final Management Report
Business Question

What are the most important findings and opportunities that management should focus on?

The final management view summarizes the overall business situation using six main KPIs:

Unique customers
Total customer spending
Average customer spending
Average purchase count
Average satisfaction
Total returned items

Three selected visualizations were used to provide a concise management view:

1. Top 10 Cities by Total Customer Spending

This chart highlights geographical areas with the highest observed customer revenue and helps identify potential priorities for future marketing analysis.

2. High-Value Customers at Risk of Becoming Inactive

This visualization highlights customers who combine relatively high financial value and purchase activity with a relatively long period since their last purchase.

3. Discount Usage: Spending and Returns

This comparison provides a descriptive view of differences in average customer spending and returned items between discount users and non-users.

These three visualizations were selected to represent:

Growth opportunity
Customer retention risk
Marketing and promotion behavior
Evidence → Action → KPI
Recommendation 1 — Prioritize High-Value At-Risk Customers

Evidence:
A group of customers was identified as having relatively high spending and purchase activity while also being inactive for a relatively long period.

Action:
Design a targeted win-back campaign for these customers using personalized communication and relevant offers.

KPI:

Reactivation rate
Repeat purchase rate
Revenue recovered from reactivated customers
Average days to next purchase
Recommendation 2 — Prioritize High-Value Geographical Markets

Evidence:
The city-level analysis identified the top 10 cities based on total customer spending.

Action:
Evaluate these cities as potential priorities for targeted marketing campaigns, while considering customer volume and satisfaction before increasing advertising investment.

KPI:

Revenue generated by campaign
Customer acquisition cost
Return on advertising spend
New customer acquisition
Revenue growth by city
Recommendation 3 — Evaluate Discount Strategy Through Controlled Testing

Evidence:
The descriptive analysis shows differences in customer spending and returned-item behavior across discount usage groups.

Action:
Do not interpret these differences as proof of causality. Instead, test discount strategies through controlled experiments or A/B testing to determine whether specific discount policies actually improve purchasing behavior without increasing returns.

KPI:

Incremental revenue
Conversion rate
Average order value
Return rate
Net revenue after discounts and returns
Limitations

The analysis has several limitations that should be considered when interpreting the results.

1. Observational Data

The analysis is based on historical observational data. Therefore, the results describe relationships and differences between customer groups but do not establish causal relationships.

2. Missing Values

Some variables contain missing values. Customers with missing values were excluded only from analyses that required those variables.

Missing returned_items values were not automatically treated as zero because doing so could introduce incorrect assumptions.

3. Threshold-Based Segmentation

The definitions of high-value and at-risk customers depend on statistical thresholds such as the 75th percentile and median.

Different threshold choices may produce different customer segments.

4. Loyalty Score Weights

The loyalty score depends on predefined weights:

35% Financial Value
30% Purchase Frequency
20% Recency
15% Satisfaction

Changing these weights may change the ranking of the top 10 customers.

5. Limited Customer History

The available dataset provides a snapshot of customer behavior. A longer observation period and historical transaction-level data could provide a stronger basis for customer lifetime value and churn prediction.

Output Files

The project produces the following deliverables:

Analysis Notebook
customer_analytics_username.ipynb

Contains the complete analysis process and code for Questions 1–6.

Excel Results
customer_analytics_results.xlsx

The Excel file contains the main analytical outputs, including:

KPI
City Analysis
Top Loyal Customers
At Risk Customers
Discount Analysis
Cleaned Dataset
cleaned_dataset.xlsx

This is the cleaned dataset used as the basis for the customer analysis.

Management Report
customer_analytics_report.pdf

A concise one-page management report containing:

Six KPI summary
Three selected visualizations
Three Evidence → Action → KPI recommendations
Conclusion

This project demonstrates a practical customer analytics workflow designed to support business decision-making.

The analysis moves from understanding the customer base to identifying valuable geographical markets, selecting high-value and loyal customers, identifying potential inactivity risks, and comparing customer behavior across discounts, devices, and payment methods.

The most important business opportunities identified through the analysis are:

Retaining valuable customers who may be at risk of becoming inactive
Focusing further marketing analysis on high-value geographical markets
Testing discount strategies carefully to understand their actual impact on revenue and returns

Overall, the analysis provides management with a concise, data-driven view of customer value, retention risk, and potential marketing opportunities while avoiding unsupported causal conclusions.