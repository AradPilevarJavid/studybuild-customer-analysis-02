# StudyBuild - Project 02: Customer Behavior Analysis

## Project Overview
In this project, I acted as a Junior Data Analyst for an e-commerce platform. The primary objective was to analyze customer behavior, identify key purchasing patterns, and generate data-driven, actionable insights to optimize marketing and retention strategies.

## Data Quality Checks & Preparation
- **Missing Values:** Addressed by dropping rows with missing crucial identifiers or metrics, ensuring analysis was performed on complete, reliable subsets.
- **Data Types:** Standardized datetime formats for signup dates and ensured all financial and categorical variables were correctly typed for aggregation.
- **Normalization:** Applied Min-Max normalization to calculate a balanced, multi-variable customer loyalty score.

## Key Findings
1. **Customer Profiling:** The majority of the customer base falls within specific age brackets, utilizing distinct payment methods and devices, allowing for highly targeted ad placements.
2. **Geographical Value:** Revenue is not evenly distributed. Cities like Mashhad and Tabriz generate significant revenue despite having a smaller customer base compared to the capital.
3. **At-Risk Segments:** A critical cluster of historical high-spenders was identified as "at-risk" due to prolonged inactivity (over 250 days), requiring immediate win-back initiatives.
4. **Discount Impact:** While discounts correlate with higher overall spending, they also show a parallel increase in item returns.

## Analysis Limitations
*   **Aggregated Data:** Each row represents a summarized customer profile rather than individual transactional data, limiting granular order-level analysis.
*   **Recency Metric:** The `last_purchase_days` column provides time since the last action but lacks the full temporal history of the customer's buying frequency.
*   **Correlation vs. Causation:** The analysis regarding discount usage is observational. It proves correlation but does not establish a definitive causal relationship between discounts and customer behavior.
*   **Return Rates:** The `returned_items` column indicates absolute volume. Without total items purchased per customer, calculating a true "Return Rate" percentage is not feasible.

## Repository Structure
- `customer_analytics_lianafarsi.ipynb`: The main Colab notebook containing all Python code, EDA, and visualizations.
- `customer_analytics_results.xlsx`: Final aggregated datasets and KPI summaries ready for stakeholder review.
- `cleaned_dataset_lianafarsi.xlsx`: The prepared dataset used for this analysis.
- `Report.pdf`: A 1-page visual executive summary containing top charts and business recommendations.
