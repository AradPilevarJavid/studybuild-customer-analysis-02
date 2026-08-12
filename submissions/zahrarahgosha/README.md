# Customer Analytics with Python

## Project Summary

In this project, I performed customer analytics using Python based on the cleaned dataset from my previous data preprocessing project. The analysis focused on customer segmentation, churn risk detection, regional performance, and evaluating the effectiveness of discount strategies.

## Key Findings

### Customer Value Analysis (RFM)
Customers were segmented using the **RFM (Recency, Frequency, Monetary)** model into four groups. Only **14 customers** were classified as **Gold Customers**, yet they generated the largest share of total revenue, illustrating the **Pareto (80/20) Principle**.

### Churn Risk Identification
Instead of simply identifying inactive customers, I focused on customers who were **previously valuable but have recently become inactive**. Approximately **15 high-value customers** were identified as being at risk of churn, with some having historically generated several thousand dollars in revenue.

### Best City for Marketing Investment
While **Mashhad** and **Tabriz** generated the highest total revenue, they also had the largest customer bases, indicating more saturated markets. In contrast, **Isfahan**, with only **five customers**, achieved the **highest average revenue and customer satisfaction**, making it a promising market with significant growth potential.

### Discount Effectiveness
An independent **t-test** was conducted to compare customers who received discounts with those who did not. The results showed **no statistically significant difference**, suggesting that the company's current discount strategy is not effectively targeted.

## Business Recommendations

1. Focus promotional discounts on **high-value customers who are at risk of churn** rather than distributing discounts broadly.
2. Increase marketing efforts in **Isfahan**, where customer value and satisfaction are high despite a relatively small customer base.
3. Launch a **VIP loyalty program** for Gold Customers to improve retention and maximize long-term revenue.

## Tools & Libraries

- Python
- Pandas
- NumPy
- SciPy (t-test)
- Matplotlib
- RFM Analysis
