# Customer Analytics Project



## Feedback Applied

Before beginning the new project, I read the feedback on my first project and applied the main points:

* Added proper **data inspection and final validation** steps.
* Added **outlier detection** using IQR.
* Used `customer_id` instead of row indexes when working with specific records.
* Switched to **relative file paths**.
* Stopped changing `purchase_count` just to fix `returned_items` inconsistencies and instead **flagged those records**.
* Rechecked the relationship between `purchase_count`, `avg_order_value`, and `total_spending`.
* Handled the remaining missing `age` value.
* Changed how I handled **gender inconsistencies**, treating them as potential issues instead of assuming the correct value from `first_name`.

### Important Points

* I still think that changing the gender column based on `first_name` is not necessarily a bad approach. Since gender is often entered through a selectable field, I think it can be more likely for someone to select the wrong gender than to enter a completely different first name. However, without knowing how the data was collected, this cannot be confirmed.
* The main lesson I took from the feedback was to be **less aggressive when cleaning data**: if the correct value cannot be determined with enough confidence, it is better to **flag the issue rather than change the data**.

<br><br>
---

## Project overview

The analysis covers the customer profile, advertising locations, loyalty candidates, customers at risk of becoming inactive, and descriptive differences related to discounts, devices, and payment methods.

## Data quality

The cleaned dataset contains 60 rows and 60 unique customer IDs. I found no duplicate rows, duplicate customer IDs, or missing values in the required fields.

Six rows have a `returned_items_exceeds_purchase_count` flag. I kept these rows because returned items and purchases measure different things: one purchase can contain several items. However, return findings should be interpreted carefully because the total number of purchased items is not available.

## Main findings

- The largest age group is 55–64. The most common categories are female, Gold membership, Android, and Online Wallet. These are separate modal characteristics and should not be assumed to describe one exact cross-segment.
- Mashhad has the highest total customer spending at 43,197.58 from 11 customers. It also has a strong average purchase count, although its average satisfaction is only 2.91.
- Isfahan is a good alternative advertising location. Its group is smaller at five customers, but it has the highest average customer spending at 4,395.06 and the highest city satisfaction at 4.40.
- The loyalty ranking uses spending, purchase frequency, recency, and satisfaction rather than membership tier alone. Customer 1057 ranks first even though the current membership tier is Bronze.
- Three valuable customers are at risk of becoming inactive: 1010, 1035, and 1053. Customers 1010 and 1053 also have satisfaction scores of 1.
- Customers with recorded discount use have lower average total spending than non-users in this dataset. They have slightly more purchases, slightly fewer returned items, and higher satisfaction. This analysis does not establish a causal relationship.
- iPhone customers have the highest average spending by device, while Card customers have the highest average spending by payment method.

## Recommendations

1. Run a limited advertising pilot in Mashhad and track new customers, spending, and satisfaction. Use Isfahan as a smaller comparison market.
2. Invite the ten highest-scoring loyalty customers instead of selecting only by membership tier. Use service-focused rewards for selected customers with low satisfaction.
3. Contact customers 1010 and 1053 first with service-recovery outreach. Send customer 1035 a personalized, time-limited win-back offer and measure reactivation within 30 days.

## Limitations

- The data contains one summarized row per customer, not individual orders.
- The reference date for `last_purchase_days` is not provided, so exact last-purchase dates cannot be calculated.
- Returned items are available, but the total number of purchased items is not, so a true return rate cannot be calculated.
- Loyalty weights, inactivity thresholds, and minimum group sizes are analyst assumptions.
- The discount comparison is observational and cannot show that discounts caused customer behavior.

## How to run the analysis

Keep the notebook and `cleaned_customer_data.xlsx` in the same folder, then run the notebook cells from top to bottom. Running cells in order is important because the later charts use summary tables created earlier in the notebook.

The notebook reads the cleaned workbook but does not save changes to either Excel file. Results are displayed inside the notebook so the existing `customer_analytics_results.xlsx` file is not overwritten by accident.

## Files

- `customer_analytics_username.ipynb` contains the analysis and executive report.
- `cleaned_customer_data.xlsx` is the cleaned source dataset.
- `customer_analytics_results.xlsx` is the existing results workbook and is not overwritten by the notebook.
