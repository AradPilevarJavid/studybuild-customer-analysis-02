# Executive Customer Analytics & Strategy Report
**Author:** Mohammad Amin Nemati

## Project Overview
This repository contains a structured data analysis of an e-commerce customer dataset. The project processes customer records utilizing Python and Pandas to extract actionable business intelligence and define targeted marketing strategies. 

The codebase translates raw demographic and behavioral data into executive-level reporting. It directly addresses strategic management queries regarding core persona identification, geographic advertising allocation, loyalty program induction, churn risk mitigation, and behavioral discount associations.

## Technical Execution
*   **Data Processing:** Python, Pandas
*   **Visualization:** Matplotlib, Seaborn
*   **Methodology:** Macro-segmentation, RFM-S (Recency, Frequency, Monetary, Satisfaction) modeling, and Market Potential Index (MPI) scoring.
*   **Automated Output:** Programmatic generation of Markdown executive summaries and multi-sheet Excel workbooks.

## Question 1: Core Customer Profile Analysis

**Objective:** 
Define the dominant customer persona to guide the initial marketing campaign strategy.

**Methodology:**
*   Processed the 60-customer e-commerce dataset using Pandas to identify overlapping demographic and behavioral traits.
*   Determined that granular micro-segmentation yielded statistically unstable groups (maximum n=2).
*   Applied macro-consolidation to categorical variables to increase segment reliability:
    *   **Age:** Merged into 'Under 35' and '35+'.
    *   **Membership:** Grouped VIP/Gold into 'Premium' and Silver/Bronze into 'Standard'.
    *   **Device:** Grouped iPhone/Android into 'Mobile'.
*   Utilized global intersection grouping rather than sequential filtering to eliminate greedy algorithm bias.
*   Prioritized a 4-trait behavioral profile over bivariate demographic filters to generate actionable operational directives.

**Dominant Persona Identified:**
The strongest actionable core customer profile is a **Male utilizing Mobile devices to make Online Wallet payments within a Premium membership tier** (16.6% of the customer base). Age distribution across this segment is flat.

**Strategic Implications:**
*   **Targeting:** Omit age restrictions from the initial campaign filters.
*   **Optimization:** Strictly optimize UI/UX and marketing assets for Mobile and frictionless Online Wallet checkout flows.

**Recommended Action:**
Cross-reference this behavioral segment against total spending metrics to validate actual profitability before authorizing ad spend. 

**Visualizations:**
![Core Customer Distributions](<visualizations/customer_profile_analysis.png>)

## Question 2: Geographic Advertising Investment Strategy

**Objective:** 
Identify the optimal province and city for targeted advertising allocation based on revenue, behavioral metrics, and satisfaction scores.

**City-Level Metric Summary (Top Candidates):**
| province        | city    |   customer_count |   total_revenue |   avg_spending |   avg_purchase_freq |   avg_satisfaction |
|:----------------|:--------|-----------------:|----------------:|---------------:|--------------------:|-------------------:|
| Khorasan        | Mashhad |               11 |         43197.6 |        3927.05 |               22.64 |               2.91 |
| East Azerbaijan | Tabriz  |               12 |         36192.5 |        3016.04 |               15.75 |               3    |
| Isfahan         | Isfahan |                5 |         21975.3 |        4395.06 |               19.8  |               4.4  |
| Alborz          | Karaj   |                7 |         26189.8 |        3741.4  |               16    |               2.86 |
| Khuzestan       | Ahvaz   |                8 |         23384.8 |        2923.1  |               13.88 |               3.5  |

**Primary Recommendation: Mashhad, Khorasan**
*   **Advantage:** Primary investment is justified by three leading indicators:
    1. **Volume:** Highest total revenue generated ($43197.58).
    2. **Density:** The second-largest established active user base (11 customers).
    3. **Retention:** Stable average satisfaction score (2.9/5.0).
*   **Risk:** Monitor market saturation limits due to the existing high customer density.

**Alternative Recommendation: Tabriz, East Azerbaijan**
*   **Advantage:** Represents a high-efficiency growth market justified by three unit-economic indicators:
    1. **Value:** High average spending per customer ($3016.04).
    2. **Engagement:** Strong purchase frequency (15.8 orders/user).
    3. **Product-Market Fit:** Exceptional customer satisfaction (3.0/5.0).
*   **Risk:** Scaling ad spend requires prior validation that the total addressable market (TAM) in this city is large enough to absorb higher volume.

**Visualizations:**
![Geographic Performance](<visualizations/geographic_performance.png>)
## Question 3: Loyalty Program Prioritization

**Objective:** 
Select the top ten customers for the loyalty program based on a composite metric of financial value, frequency, recency, and satisfaction.

**Weighting Logic (RFM-S Model):**
The standard RFM (Recency, Frequency, Monetary) model was adapted to include Satisfaction. Weights reflect business priorities:
*   **Total Spending (40%):** Financial value is the primary driver of profitability.
*   **Purchase Count (30%):** Frequency validates behavioral habit and predictable future revenue.
*   **Recency (15%):** Recent activity mitigates churn risk. 
*   **Satisfaction (15%):** High satisfaction indicates low refund risk and high advocacy potential.

**Top 10 Loyalty Program Inductees:**
|   customer_id | first_name   | membership_tier   |   total_spending |   purchase_count |   last_purchase_days |   satisfaction_score |   loyalty_score |
|--------------:|:-------------|:------------------|-----------------:|-----------------:|---------------------:|---------------------:|----------------:|
|          1057 | Maryam       | Bronze            |         13532.7  |               31 |                   82 |                    4 |           87.91 |
|          1044 | Mina         | Gold              |         14354.3  |               33 |                  165 |                    2 |           82.5  |
|          1009 | Kimia        | Silver            |         11615.4  |               34 |                  232 |                    2 |           72.98 |
|          1059 | Ali          | Gold              |          8898.55 |               31 |                  224 |                    5 |           72.16 |
|          1012 | Arash        | Gold              |         11731.5  |               27 |                  224 |                    2 |           67.63 |
|          1004 | Sina         | Gold              |          6121.45 |               23 |                   40 |                    4 |           62.13 |
|          1033 | Neda         | Vip               |          5521.2  |               24 |                  112 |                    5 |           61.35 |
|          1014 | Reza         | Vip               |          3353.89 |               31 |                   97 |                    4 |           58.93 |
|          1023 | Ali          | Bronze            |          3851.44 |               31 |                  170 |                    4 |           57.32 |
|          1017 | Parsa        | Vip               |          3239.4  |               30 |                  135 |                    4 |           56.19 |

**Selection Reasoning:**
*   **Maryam (ID: 1057)**: Score 87.9. Primary driver: Elite financial contribution ($13532.74).
*   **Mina (ID: 1044)**: Score 82.5. Primary driver: Elite financial contribution ($14354.34).
*   **Kimia (ID: 1009)**: Score 73.0. Primary driver: High brand loyalty (34 transactions).
*   **Ali (ID: 1059)**: Score 72.2. Primary driver: Flawless brand advocacy (5/5.0 satisfaction).
*   **Arash (ID: 1012)**: Score 67.6. Primary driver: Elite financial contribution ($11731.50).
*   **Sina (ID: 1004)**: Score 62.1. Primary driver: Consistent recent activity (40 days ago).
*   **Neda (ID: 1033)**: Score 61.4. Primary driver: Flawless brand advocacy (5/5.0 satisfaction).
*   **Reza (ID: 1014)**: Score 58.9. Primary driver: High brand loyalty (31 transactions).
*   **Ali (ID: 1023)**: Score 57.3. Primary driver: High brand loyalty (31 transactions).
*   **Parsa (ID: 1017)**: Score 56.2. Primary driver: High brand loyalty (30 transactions).

**Strategic Interpretation:**
*   **Spend vs. Frequency Correlation:** The highest-ranked customers generally exhibit simultaneous high total spending and high purchase counts. Volume drives value in this dataset.
*   **The Recency Penalty:** Customers with historical high spending but very old activity (high `last_purchase_days`) are actively penalized by the recency weight. A customer who has not purchased recently is functionally churned; allocating limited loyalty rewards to them is inefficient compared to reinforcing active buyers.
*   **Tier Inconsistencies:** The data reveals misalignments between calculated `loyalty_score` and current `membership_tier`. Standard membership tiers often reward cumulative historical action or singular large purchases without factoring in recency or current satisfaction. The calculated score dynamically demotes "stale" high-tier members and promotes highly active, satisfied lower-tier members who demonstrate stronger current momentum.

**Visualizations:**
![Customer Value vs Frequency](<visualizations/loyalty_scatter.png>)
## Question 4: Inactive High-Value Customer Reactivation

**Objective:** 
Identify high-value customers exhibiting prolonged inactivity and define targeted reactivation strategies based on underlying satisfaction.

**Data-Based Definition of "At-Risk":**
A customer is classified as "At-Risk" if they meet two criteria simultaneously:
1.  **High Value:** `total_spending` is strictly greater than or equal to the dataset median ($2128.69).
2.  **High Inactivity:** `last_purchase_days` is strictly greater than or equal to the dataset median (203 days).

**Prioritized Reactivation List (Top 10):**
|   customer_id | first_name   |   total_spending |   purchase_count |   last_purchase_days |   satisfaction_score | churn_risk_status      |
|--------------:|:-------------|-----------------:|-----------------:|---------------------:|---------------------:|:-----------------------|
|          1012 | Arash        |         11731.5  |               27 |                  224 |                    2 | At-Risk (Dissatisfied) |
|          1009 | Kimia        |         11615.4  |               34 |                  232 |                    2 | At-Risk (Dissatisfied) |
|          1059 | Ali          |          8898.55 |               31 |                  224 |                    5 | At-Risk (Satisfied)    |
|          1010 | Arash        |          7241.47 |               19 |                  276 |                    1 | At-Risk (Dissatisfied) |
|          1050 | Reza         |          6198    |               30 |                  205 |                    2 | At-Risk (Dissatisfied) |
|          1055 | Mina         |          6068.22 |               19 |                  221 |                    1 | At-Risk (Dissatisfied) |
|          1035 | Arash        |          5918.21 |               17 |                  365 |                    3 | At-Risk (Satisfied)    |
|          1053 | Sina         |          5805.54 |               18 |                  320 |                    1 | At-Risk (Dissatisfied) |
|          1046 | Maryam       |          4923.45 |               15 |                  229 |                    4 | At-Risk (Satisfied)    |
|          1032 | Neda         |          4615.05 |               15 |                  243 |                    5 | At-Risk (Satisfied)    |

**Strategic Interpretation & Recommended Actions:**
There are currently **17** customers in the high-value, high-inactivity region. This dataset measures *inactivity-risk*, which is a leading indicator, but does not prove confirmed churn. 

The at-risk cohort must be segmented to prevent deploying capital inefficiently:
*   **At-Risk (Dissatisfied) - 10 Customers:** Inactivity here is highly correlated with a poor user experience. 
    *   *Action:* Require immediate, high-touch intervention. Do not send standard marketing material. Deploy automated customer service outreach requesting feedback to repair the relationship before offering discounts.
*   **At-Risk (Satisfied) - 7 Customers:** Inactivity here implies a lack of immediate need or loss of brand top-of-mind awareness.
    *   *Action:* Deploy automated "We Miss You" campaigns. Utilize personalized offers, exclusive access to new inventory, or aggressive discount codes to stimulate a transaction and break the inactivity pattern.

**Visualizations:**
![Churn Risk Analysis](<visualizations/churn_risk_scatter.png>)
## Question 5: Behavioral Associations (Discounts, Devices, Payments)

**Objective:** 
Compare customer behavior across discount usage, device preference, and payment methods to identify descriptive patterns.

**Discount Use Comparison Table:**
| discount_used   |   customer_count |   total_spending |   purchase_count |   avg_order_value |   returned_items |   satisfaction_score |
|:----------------|-----------------:|-----------------:|-----------------:|------------------:|-----------------:|---------------------:|
| No              |               34 |          3736.74 |            17.29 |            220.7  |             4.23 |                 2.76 |
| Yes             |               26 |          2882.17 |            17.5  |            203.29 |             3.78 |                 3.27 |

**Descriptive Pattern Observation:**
*   **Spending & Frequency:** Customers utilizing discounts exhibit an average total spending of $2882.17 (26 users), compared to $3736.74 (34 users) for non-discount users. Average purchase frequency for discount users is 17.5 versus 17.29 for non-users.
*   **Returns & Satisfaction:** Discount users average 3.78 returned items with a satisfaction score of 3.27/5.0. Non-discount users average 4.23 returns with a score of 2.76/5.0.

**Highest Average Value Segments:**
*   **Device:** iPhone yields the highest average spending ($3773.94). This segment contains 18 customers.
*   **Payment Method:** Card yields the highest average spending ($3929.00). This segment contains 18 customers.

**Strategic Interpretation:**
*   **Sample Size Viability:** Base business decisions on these device and payment method rankings only if the documented `customer_count` represents a statistically significant portion of the active user base. Segments with fewer than 15% of the total dataset should be treated as anecdotal rather than structural.
*   **Explicit Causal Statement:** **This analysis does not establish a causal relationship.** Variations in spending, returns, or frequency between groups do not prove that applying a discount causes higher spending or increased returns. These are observational associations.

**Visualizations:**
![Behavioral Analysis](<visualizations/behavior_analysis.png>)
## Question 6: Executive Summary & State of the Business

**Objective:** 
Provide a five-minute overview of business health, prioritizing immediate opportunities and critical risks.

**Data Limitation Notice:** 
*The following insights are derived from a 60-customer sample. I cannot confirm these trends will scale linearly. You should verify these observational patterns against a complete database export before authorizing permanent strategic shifts.*

### I. Overall State of the Business (KPIs)
| KPI                           | Value       |
|:------------------------------|:------------|
| Total Unique Customers        | 60          |
| Total Revenue                 | $201,985.73 |
| Average Spending per Customer | $3,366.43   |
| Average Purchase Count        | 17.38       |
| Average Satisfaction Score    | 2.98        |
| Total Returned Items          | 218.0       |

### II. Management Recommendations

**1. Primary Customer Opportunity: High-Efficiency Geographic Expansion**
*   **KPI:** Average Order Value (AOV) and Satisfaction Score.
*   **Evidence:** The geographic analysis (Chart 1) identifies secondary markets exhibiting lower total volume but superior average spending and satisfaction compared to the primary volume-leading city.
*   **Action:** A pilot should be implemented with a limited budget targeting the highest-AOV secondary city to test if these demographics can be acquired at scale. The budget should then be increased based on the results.

**2. Primary Customer Risk: Inactive High-Value Customers**
*   **KPI:** Days Since Last Purchase (Inactivity).
*   **Evidence:** The inactivity risk analysis (Chart 2) isolates a specific cohort of customers whose historical spending exceeds the median, but whose inactivity also exceeds the median. A subset of these users concurrently report below-average satisfaction.
*   **Action:** Immediately deploy a high-touch outreach campaign to the dissatisfied, inactive cohort. The cause of deactivation may be poor user experience, but this is only one of the possibilities and needs to be investigated further through direct feedback.

**3. Operational Efficiency: Discount Association**
*   **KPI:** Average Returned Items.
*   **Evidence:** The behavioral analysis (Chart 3) demonstrates the observational variance in average returned items between discount users and non-discount users. 
*   **Action:** Implement A/B testing on future discount campaigns, strictly monitoring the net revenue. If discounts correlate heavily with elevated average returned items, pivot the promotional strategy from price-cutting to value-add (e.g., expedited shipping) to protect overall revenue retention.

### III. Strategic Visualizations

**Geographic Performance (Opportunity)**
![Geographic Performance](<visualizations/geographic_performance.png>)

**Churn Risk Matrix (Risk)**
![Churn Risk Analysis](<visualizations/churn_risk_scatter.png>)

**Behavioral Associations (Operations)**
![Behavioral Analysis](<visualizations/behavior_analysis.png>)
