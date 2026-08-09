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
