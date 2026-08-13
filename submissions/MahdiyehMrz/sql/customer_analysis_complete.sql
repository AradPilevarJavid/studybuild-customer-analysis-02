-- ================================================================
-- Customer Analytics Project - Complete MySQL SQL Script
-- Source: customer_analysis_output(2).xlsx
-- Records: 60 customers
-- Generated for Project 2: Customer Analytics
-- ================================================================

DROP DATABASE IF EXISTS customer_analytics;
CREATE DATABASE customer_analytics CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE customer_analytics;

DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
    `customer_id` INT PRIMARY KEY,
    `first_name` VARCHAR(100),
    `gender` VARCHAR(100),
    `age` INT,
    `city` VARCHAR(100),
    `province` VARCHAR(100),
    `signup_date` DATE,
    `membership_tier` VARCHAR(100),
    `purchase_count` INT,
    `avg_order_value` DECIMAL(14,2),
    `total_spending` DECIMAL(14,2),
    `last_purchase_days` INT,
    `payment_method` VARCHAR(100),
    `device` VARCHAR(100),
    `discount_used` BOOLEAN,
    `returned_items` INT,
    `satisfaction_score` INT,
    `total_spending_flag` VARCHAR(100),
    `expected_total` DECIMAL(14,2),
    `difference` DECIMAL(14,2),
    `total_spending_status` VARCHAR(100),
    `return_flag` VARCHAR(100),
    `return_status` VARCHAR(100),
    `future_signup_flag` VARCHAR(100),
    `overall_data_status` VARCHAR(100),
    `last_purchase_days_imputed` INT,
    `customer_value_score` INT,
    `customer_value_segment` VARCHAR(100),
    `churn_risk` VARCHAR(100),
    `churn_risk_label` VARCHAR(100),
    `cluster` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ================================================================
-- INSERT 60 CUSTOMER RECORDS
-- ================================================================

INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1001, 'Reza', 'F', 19, 'Karaj', 'Alborz', '2025-02-19', 'VIP', 17, 121.53, 2066.01, 16, 'Card', 'Android', 1, 3, 5, 0, 2066.01, 0.0, 'Valid', 0, 'Valid', 0, 'Valid', 0, -0.3446933002682671, 'Medium Value', 0, 'Active', 2);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1002, 'Sina', 'M', 53, 'Tehran', 'Tehran', '2022-08-19', 'Gold', 12, 326.47, 3917.64, 3, 'Card', 'Web', 0, 5, 3, 0, 3917.64, 4.547473508864641e-13, 'Valid', 0, 'Valid', 0, 'Valid', 0, 0.04073476515772109, 'Medium Value', 0, 'Active', 1);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1003, 'Parsa', 'F', 31, 'Shiraz', 'Fars', '2023-06-20', 'Gold', 21, 59.46, 1248.66, 22, 'Online Wallet', 'iPhone', 1, 6, 1, 0, 1248.66, 0.0, 'Valid', 0, 'Valid', 0, 'Valid', 0, -0.4175088659724668, 'Medium Value', 0, 'Active', 2);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1004, 'Sina', 'F', 58, 'Mashhad', 'Khorasan', '2021-11-08', 'Gold', 23, 266.15, 6121.45, 40, 'Card', 'Android', 0, 4, 4, 0, 6121.45, 0.0, 'Valid', 0, 'Valid', 0, 'Valid', 0, 0.53455342947879, 'High Value', 0, 'Active', 2);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1005, 'Kimia', 'M', 28, 'Isfahan', 'Isfahan', '2021-10-21', 'Silver', 23, 169.54, 3899.42, 273, 'Online Wallet', 'Android', 1, 7, 4, 0, 3899.42, 4.547473508864641e-13, 'Valid', 0, 'Valid', 0, 'Valid', 0, 0.1239459331967855, 'Medium Value', 1, 'Churn Risk', 2);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1006, 'Amir', 'F', 58, 'Mashhad', 'Khorasan', '2022-01-26', 'Gold', 35, 110.53, 3868.55, 205, 'Cash', 'Android', 1, 5, 2, 0, 3868.55, 0.0, 'Valid', 0, 'Valid', 0, 'Valid', 0, 0.3867997940043654, 'High Value', 1, 'Churn Risk', 2);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1007, 'Reza', 'F', 43, 'Rasht', 'Gilan', '2025-09-09', 'VIP', 29, 77.15, 2237.35, 298, 'Cash', 'iPhone', 1, 2, 5, 0, 2237.35, 4.547473508864641e-13, 'Valid', 0, 'Valid', 0, 'Valid', 0, -0.03545083538291022, 'Medium Value', 1, 'Churn Risk', 2);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1008, 'Reza', 'F', 23, 'Rasht', 'Gilan', '2024-10-03', 'VIP', 3, 389.58, 1168.74, 195, 'Online Wallet', 'iPhone', 0, 8, 1, 0, 1168.74, 0.0, 'Valid', 1, 'Needs Review', 0, 'Needs Review', 0, -0.4532613482580662, 'Medium Value', 1, 'Churn Risk', 1);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1009, 'Kimia', 'M', 61, 'Karaj', 'Alborz', '2021-05-14', 'Silver', 34, 341.63, 11615.42, 232, 'Card', 'Web', 0, 8, 2, 0, 11615.42, 0.0, 'Valid', 0, 'Valid', 0, 'Valid', 0, 1.625153949234466, 'High Value', 1, 'Churn Risk', 0);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1010, 'Arash', 'F', 45, 'Karaj', 'Alborz', '2022-06-25', 'Silver', 19, 381.13, 7241.47, 276, 'Online Wallet', 'Android', 0, 7, 1, 0, 7241.47, 0.0, 'Valid', 0, 'Valid', 0, 'Valid', 0, 0.7247288292524597, 'High Value', 1, 'Churn Risk', 1);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1011, 'Neda', 'F', 41, 'Karaj', 'Alborz', '2021-12-16', 'Bronze', 19, 119.16, 2264.04, 272, 'Card', 'Android', 0, 8, 2, 0, 2264.04, 0.0, 'Valid', 0, 'Valid', 0, 'Valid', 0, -0.2654549044889766, 'Medium Value', 1, 'Churn Risk', 2);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1012, 'Arash', 'F', 51, 'Mashhad', 'Khorasan', '2023-07-22', 'Gold', 27, 434.5, 11731.5, 224, 'Online Wallet', 'iPhone', 1, 3, 2, 0, 11731.5, 0.0, 'Valid', 0, 'Valid', 0, 'Valid', 0, 1.573679501411682, 'High Value', 1, 'Churn Risk', 0);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1013, 'Neda', 'F', 39, 'Karaj', 'Alborz', '2021-02-23', 'Bronze', 1, 270.91, 270.91, 117, 'Card', 'Android', 0, 1, 5, 0, 270.91, 0.0, 'Valid', 0, 'Valid', 0, 'Valid', 0, -0.8018485214215332, 'Low Value', 0, 'Active', 1);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1014, 'Reza', 'M', 35, 'Tabriz', 'East Azerbaijan', '2022-08-26', 'VIP', 31, 108.19, 3353.89, 97, 'Card', 'Android', 0, 5, 4, 0, 3353.89, 0.0, 'Valid', 0, 'Valid', 0, 'Valid', 0, 0.2034344743648983, 'High Value', 0, 'Active', 2);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1015, 'Kimia', 'F', 47, 'Ahvaz', 'Khuzestan', '2021-07-24', 'Gold', 3, 307.91, 923.73, 55, 'Card', 'Android', 1, 8, 4, 0, 923.73, 0.0, 'Valid', 1, 'Needs Review', 0, 'Needs Review', 0, -0.6082856455693733, 'Low Value', 0, 'Active', 1);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1016, 'Neda', 'F', 45, 'Shiraz', 'Fars', '2024-09-04', 'Bronze', 11, 136.17, 1497.87, 333, 'Online Wallet', 'Android', 1, 3, 2, 0, 1497.87, 0.0, 'Valid', 0, 'Valid', 0, 'Valid', 0, -0.5677200660733966, 'Low Value', 1, 'Churn Risk', 1);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1017, 'Parsa', 'F', 49, 'Ahvaz', 'Khuzestan', '2022-07-01', 'VIP', 30, 107.98, 3239.4, 135, 'Cash', 'iPhone', 0, 8, 4, 0, 3239.4, 0.0, 'Valid', 0, 'Valid', 0, 'Valid', 0, 0.1598396260043523, 'High Value', 0, 'Active', 2);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1018, 'Ali', 'F', 30, 'Shiraz', 'Fars', '2023-01-02', 'VIP', 18, 109.7, 1974.6, 257, 'Online Wallet', 'Android', 1, 8, 1, 0, 1974.6, 2.273736754432321e-13, 'Valid', 0, 'Valid', 0, 'Valid', 0, -0.3439184540405017, 'Medium Value', 1, 'Churn Risk', 2);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1019, 'Neda', 'M', 22, 'Shiraz', 'Fars', '2021-10-08', 'Bronze', 4, 308.72, 1234.88, 317, 'Card', 'iPhone', 0, 4, 2, 0, 1234.88, 0.0, 'Valid', 0, 'Valid', 0, 'Valid', 0, -0.5406365875069782, 'Low Value', 1, 'Churn Risk', 1);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1020, 'Kimia', 'M', 45, 'Isfahan', 'Isfahan', '2024-06-25', 'Bronze', 16, 187.17, 2994.72, 4, 'Cash', 'Web', 1, 1, 5, 0, 2994.72, 0.0, 'Valid', 0, 'Valid', 0, 'Valid', 0, -0.1638456214432553, 'Medium Value', 0, 'Active', 2);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1021, 'Amir', 'F', 50, 'Tabriz', 'East Azerbaijan', '2022-06-10', 'Silver', 16, 72.62, 1161.92, 224, 'Online Wallet', 'Web', 0, 8, 1, 0, 1161.92, 0.0, 'Valid', 0, 'Valid', 0, 'Valid', 0, -0.5564043046856907, 'Low Value', 1, 'Churn Risk', 2);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1022, 'Reza', 'M', 60, 'Mashhad', 'Khorasan', '2021-02-24', 'Silver', 6, 423.43, 2540.58, 139, 'Cash', 'Web', 1, 5, 2, 0, 2540.58, 0.0, 'Valid', 0, 'Valid', 0, 'Valid', 0, -0.1502041077773484, 'Medium Value', 0, 'Active', 1);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1023, 'Ali', 'F', 50, 'Mashhad', 'Khorasan', '2024-05-02', 'Bronze', 31, 124.24, 3851.44, 170, 'Card', 'Web', 0, 2, 4, 0, 3851.44, 0.0, 'Valid', 0, 'Valid', 0, 'Valid', 0, 0.2867491516444914, 'High Value', 0, 'Active', 2);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1024, 'Sina', 'F', 53, 'Ahvaz', 'Khuzestan', '2025-01-27', 'Gold', 0, 63.67, 0.0, 298, 'Online Wallet', 'Android', 0, 2, 1, 0, 0.0, 0.0, 'Valid', 1, 'Needs Review', 0, 'Needs Review', 0, -1.183778780354759, 'Low Value', 1, 'Churn Risk', 1);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1025, 'Neda', 'F', 41, 'Mashhad', 'Khorasan', '2021-06-25', 'VIP', 2, 406.03, 812.06, 317, 'Online Wallet', 'Android', 1, 2, 2, 0, 812.06, 0.0, 'Valid', 0, 'Valid', 0, 'Valid', 0, -0.4995913721231915, 'Low Value', 1, 'Churn Risk', 1);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1026, 'Amir', 'M', 19, 'Ahvaz', 'Khuzestan', '2022-05-06', 'Bronze', 11, 335.41, 3689.51, 195, 'Card', 'iPhone', 1, 3, 4, 0, 3689.51, 0.0, 'Valid', 0, 'Valid', 0, 'Valid', 0, -0.002083757984589291, 'Medium Value', 1, 'Churn Risk', 1);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1027, 'Kimia', 'F', 37, 'Isfahan', 'Isfahan', '2024-06-09', 'Bronze', 14, 111.97, 1567.58, 142, 'Cash', 'Web', 0, 8, 3, 0, 1567.58, 0.0, 'Valid', 0, 'Valid', 0, 'Valid', 0, -0.507501224024979, 'Low Value', 0, 'Active', 2);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1028, 'Mina', 'F', 25, 'Tehran', 'Tehran', '2021-10-14', 'Gold', 16, 92.68, 1482.88, 160, 'Cash', 'Web', 1, 6, 5, 0, 1482.88, 0.0, 'Valid', 0, 'Valid', 0, 'Valid', 0, -0.4876594143684209, 'Low Value', 0, 'Active', 2);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1029, 'Ali', 'F', 34, 'Tabriz', 'East Azerbaijan', '2023-07-03', 'Gold', 2, 323.32, 646.64, 319, 'Cash', 'Web', 1, 4, 5, 0, 646.64, 0.0, 'Valid', 1, 'Needs Review', 0, 'Needs Review', 0, -0.6468631790810753, 'Low Value', 1, 'Churn Risk', 1);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1030, 'Sina', 'M', 60, 'Mashhad', 'Khorasan', '2025-03-07', 'VIP', 26, 156.89, 25000.0, 340, 'Cash', 'Web', 1, 4, 4, 1, 4079.139999999999, 20920.86, 'Needs Review', 0, 'Valid', 0, 'Needs Review', 0, 2.675219021702307, 'High Value', 1, 'Churn Risk', 0);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1031, 'Zahra', 'M', 37, 'Tehran', 'Tehran', '2024-08-15', 'Silver', 18, 106.43, 1915.74, 261, 'Cash', 'Web', 1, 1, 3, 0, 1915.74, 2.273736754432321e-13, 'Valid', 0, 'Valid', 0, 'Valid', 0, -0.3558937212461741, 'Medium Value', 1, 'Churn Risk', 2);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1032, 'Neda', 'F', 23, 'Isfahan', 'Isfahan', '2022-01-02', 'Silver', 15, 307.67, 4615.05, 243, 'Online Wallet', 'Android', 0, 6, 5, 0, 4615.05, 0.0, 'Valid', 0, 'Valid', 0, 'Valid', 0, 0.1831154412177657, 'High Value', 1, 'Churn Risk', 1);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1033, 'Neda', 'F', 63, 'Tabriz', 'East Azerbaijan', '2021-02-25', 'VIP', 24, 230.05, 5521.2, 112, 'Card', 'Web', 0, 0, 5, 0, 5521.200000000001, 9.094947017729282e-13, 'Valid', 0, 'Valid', 0, 'Valid', 0, 0.4379828611528213, 'High Value', 0, 'Active', 2);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1034, 'Maryam', 'M', 25, 'Tabriz', 'East Azerbaijan', '2024-10-27', 'VIP', 29, 73.0, 2117.0, 280, 'Cash', 'Android', 0, 7, 3, 0, 2117.0, 0.0, 'Valid', 0, 'Valid', 0, 'Valid', 0, -0.05601718968628258, 'Medium Value', 1, 'Churn Risk', 2);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1035, 'Arash', 'M', 58, 'Tabriz', 'East Azerbaijan', '2022-05-15', 'Bronze', 17, 348.13, 5918.21, 365, 'Cash', 'Android', 0, 5, 3, 0, 5918.21, 0.0, 'Valid', 0, 'Valid', 0, 'Valid', 0, 0.4585045452327464, 'High Value', 1, 'Churn Risk', 1);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1036, 'Sina', 'F', 26, 'Karaj', 'Alborz', '2022-02-14', 'VIP', 9, 115.6, 1040.4, 169, 'Online Wallet', 'iPhone', 0, 0, 2, 0, 1040.4, 2.273736754432321e-13, 'Valid', 0, 'Valid', 0, 'Valid', 0, -0.7129193765305819, 'Low Value', 0, 'Active', 2);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1037, 'Zahra', 'M', 42, 'Ahvaz', 'Khuzestan', '2024-01-12', 'Gold', 1, 387.68, 387.68, 199, 'Cash', 'Web', 1, 7, 2, 0, 387.68, 0.0, 'Valid', 1, 'Needs Review', 0, 'Needs Review', 0, -0.6076621570609093, 'Low Value', 1, 'Churn Risk', 1);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1038, 'Amir', 'M', 45, 'Mashhad', 'Khorasan', '2022-08-05', 'Bronze', 31, 27.63, 856.53, 201, 'Online Wallet', 'Web', 1, 1, 4, 0, 856.53, 0.0, 'Valid', 0, 'Valid', 0, 'Valid', 0, -0.2147481051767856, 'Medium Value', 1, 'Churn Risk', 2);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1039, 'Parsa', 'M', 47, 'Shiraz', 'Fars', '2022-08-11', 'Gold', 11, 36.87, 405.57, 194, 'Cash', 'iPhone', 0, 1, 4, 0, 405.57, 0.0, 'Valid', 0, 'Valid', 0, 'Valid', 0, -0.8496297498377939, 'Low Value', 1, 'Churn Risk', 2);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1040, 'Amir', 'F', 65, 'Tehran', 'Tehran', '2021-11-02', 'Bronze', 34, 37.66, 126.0, 205, 'Card', 'Android', 1, 3, 2, 1, 1280.44, 1154.44, 'Needs Review', 0, 'Valid', 0, 'Needs Review', 1, -0.1957380727327657, 'Medium Value', 1, 'Churn Risk', 2);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1041, 'Neda', 'M', 60, 'Rasht', 'Gilan', '2023-06-06', 'Bronze', 7, 260.33, 1822.31, 83, 'Cash', 'Android', 1, 4, 5, 0, 1822.31, 0.0, 'Valid', 0, 'Valid', 0, 'Valid', 0, -0.4569173052645675, 'Medium Value', 0, 'Active', 1);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1042, 'Sina', 'F', 43, 'Ahvaz', 'Khuzestan', '2021-12-25', 'Gold', 12, 48.06, 576.72, 350, 'Online Wallet', 'Android', 1, 5, 5, 0, 576.72, 0.0, 'Valid', 0, 'Valid', 0, 'Valid', 0, -0.782403450050146, 'Low Value', 1, 'Churn Risk', 2);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1043, 'Kimia', 'M', 60, 'Ahvaz', 'Khuzestan', '2021-07-27', 'VIP', 23, 45.0, 1035.0, 54, 'Cash', 'iPhone', 0, 2, 4, 0, 1035.0, 0.0, 'Valid', 0, 'Valid', 0, 'Valid', 0, -0.4053683985179527, 'Medium Value', 0, 'Active', 2);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1044, 'Mina', 'M', 64, 'Shiraz', 'Fars', '2024-07-27', 'Gold', 33, 434.98, 14354.34, 165, 'Card', 'Android', 0, 7, 2, 0, 14354.34, 0.0, 'Valid', 0, 'Valid', 0, 'Valid', 0, 2.061702709879549, 'High Value', 0, 'Active', 0);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1045, 'Maryam', 'M', 54, 'Rasht', 'Gilan', '2022-08-07', 'Gold', 24, 161.33, 3871.92, 132, 'Cash', 'iPhone', 0, 8, 1, 0, 3871.92, 0.0, 'Valid', 0, 'Valid', 0, 'Valid', 0, 0.1378308045589727, 'Medium Value', 0, 'Active', 2);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1046, 'Maryam', 'F', 23, 'Tabriz', 'East Azerbaijan', '2024-11-23', 'VIP', 15, 328.23, 4923.45, 229, 'Card', 'Android', 0, 3, 4, 0, 4923.450000000001, 9.094947017729282e-13, 'Valid', 0, 'Valid', 0, 'Valid', 0, 0.2511559820196555, 'High Value', 1, 'Churn Risk', 1);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1047, 'Arash', 'M', 37, 'Tabriz', 'East Azerbaijan', '2024-12-18', 'Gold', 23, 220.87, 5080.01, 180, 'Online Wallet', 'iPhone', 0, 4, 3, 0, 5080.01, 0.0, 'Valid', 0, 'Valid', 0, 'Valid', 0, 0.3421064008932486, 'High Value', 0, 'Active', 2);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1048, 'Sina', 'F', 25, 'Tabriz', 'East Azerbaijan', '2022-04-24', 'VIP', 12, 152.26, 1827.12, 141, 'Online Wallet', 'Web', 0, 1, 2, 0, 1827.12, 0.0, 'Valid', 0, 'Valid', 0, 'Valid', 0, -0.4743290201637922, 'Low Value', 0, 'Active', 2);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1049, 'Ali', 'F', 32, 'Mashhad', 'Khorasan', '2023-01-02', 'Gold', 23, 93.06, 2140.38, 357, 'Card', 'Web', 0, 1, 1, 0, 2140.38, 0.0, 'Valid', 0, 'Valid', 0, 'Valid', 0, -0.201105938407062, 'Medium Value', 1, 'Churn Risk', 2);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1050, 'Reza', 'F', 48, 'Mashhad', 'Khorasan', '2023-08-04', 'Bronze', 30, 206.6, 6198.0, 205, 'Cash', 'Android', 1, 2, 2, 0, 6198.0, 0.0, 'Valid', 0, 'Valid', 0, 'Valid', 0, 0.660173089876275, 'High Value', 1, 'Churn Risk', 2);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1051, 'Parsa', 'F', 23, 'Mashhad', 'Khorasan', '2025-07-15', 'VIP', 15, 66.53, 997.95, 152, 'Online Wallet', 'iPhone', 0, 0, 5, 0, 997.95, 0.0, 'Valid', 0, 'Valid', 0, 'Valid', 0, -0.6149047926814419, 'Low Value', 0, 'Active', 2);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1052, 'Sara', 'F', 31, 'Karaj', 'Alborz', '2022-03-18', 'Bronze', 13, 130.12, 1691.56, 80, 'Card', 'iPhone', 0, 7, 3, 0, 1691.56, 0.0, 'Valid', 0, 'Valid', 0, 'Valid', 0, -0.4946790578823975, 'Low Value', 0, 'Active', 2);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1053, 'Sina', 'M', 32, 'Tehran', 'Tehran', '2021-11-08', 'Gold', 18, 322.53, 5805.54, 320, 'Online Wallet', 'Web', 1, 6, 1, 0, 5805.539999999999, 9.094947017729282e-13, 'Valid', 0, 'Valid', 0, 'Valid', 0, 0.4354993194712021, 'High Value', 1, 'Churn Risk', 1);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1054, 'Reza', 'F', 59, 'Tabriz', 'East Azerbaijan', '2021-03-26', 'Gold', 9, 410.16, 3691.44, 304, 'Online Wallet', 'Web', 0, 7, 1, 0, 3691.44, 0.0, 'Valid', 0, 'Valid', 0, 'Valid', 0, 0.05404771116265034, 'Medium Value', 1, 'Churn Risk', 1);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1055, 'Mina', 'M', 62, 'Rasht', 'Gilan', '2024-02-20', 'Bronze', 19, 319.38, 6068.22, 221, 'Online Wallet', 'iPhone', 0, 0, 1, 0, 6068.22, 0.0, 'Valid', 0, 'Valid', 0, 'Valid', 0, 0.4913286477105515, 'High Value', 1, 'Churn Risk', 1);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1056, 'Kimia', 'M', 61, 'Tabriz', 'East Azerbaijan', '2025-01-25', 'Silver', 1, 449.81, 449.81, 240, 'Online Wallet', 'Web', 0, 4, 2, 0, 449.81, 0.0, 'Valid', 1, 'Needs Review', 0, 'Needs Review', 0, -0.5043411086946715, 'Low Value', 1, 'Churn Risk', 1);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1057, 'Maryam', 'M', 58, 'Ahvaz', 'Khuzestan', '2024-06-11', 'Bronze', 31, 436.54, 13532.74, 82, 'Cash', 'iPhone', 0, 4, 4, 0, 13532.74, 0.0, 'Valid', 0, 'Valid', 0, 'Valid', 0, 1.907881470299753, 'High Value', 0, 'Active', 0);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1058, 'Amir', 'F', 47, 'Tehran', 'Tehran', '2024-09-27', 'Bronze', 5, 151.81, 759.05, 336, 'Online Wallet', 'iPhone', 0, 0, 2, 0, 759.05, 0.0, 'Valid', 0, 'Valid', 0, 'Valid', 0, -0.8092732122363957, 'Low Value', 1, 'Churn Risk', 1);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1059, 'Ali', 'F', 57, 'Isfahan', 'Isfahan', '2023-09-05', 'Gold', 31, 287.05, 8898.55, 224, 'Online Wallet', 'iPhone', 1, 0, 5, 0, 8898.550000000001, 1.818989403545856e-12, 'Valid', 0, 'Valid', 0, 'Valid', 0, 1.131887008833935, 'High Value', 1, 'Churn Risk', 0);
INSERT INTO customers (`customer_id`, `first_name`, `gender`, `age`, `city`, `province`, `signup_date`, `membership_tier`, `purchase_count`, `avg_order_value`, `total_spending`, `last_purchase_days`, `payment_method`, `device`, `discount_used`, `returned_items`, `satisfaction_score`, `total_spending_flag`, `expected_total`, `difference`, `total_spending_status`, `return_flag`, `return_status`, `future_signup_flag`, `overall_data_status`, `last_purchase_days_imputed`, `customer_value_score`, `customer_value_segment`, `churn_risk`, `churn_risk_label`, `cluster`) VALUES (1060, 'Ali', 'M', 63, 'Tabriz', 'East Azerbaijan', '2021-04-27', 'Bronze', 10, 150.18, 1501.8, 236, 'Card', 'Web', 1, 7, 3, 0, 1501.8, 2.273736754432321e-13, 'Valid', 0, 'Valid', 0, 'Valid', 0, -0.5754135207659385, 'Low Value', 1, 'Churn Risk', 1);

-- ================================================================
-- BASIC DATA QUALITY CHECKS
-- ================================================================

-- Q01. Total number of customers
SELECT COUNT(*) AS total_customers FROM customers;

-- Q02. Duplicate customer IDs
SELECT customer_id, COUNT(*) AS duplicate_count
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- Q03. Missing values by important field
SELECT
    SUM(customer_id IS NULL) AS missing_customer_id,
    SUM(first_name IS NULL OR first_name = '') AS missing_name,
    SUM(age IS NULL) AS missing_age,
    SUM(city IS NULL OR city = '') AS missing_city,
    SUM(signup_date IS NULL) AS missing_signup_date,
    SUM(purchase_count IS NULL) AS missing_purchase_count,
    SUM(avg_order_value IS NULL) AS missing_aov,
    SUM(total_spending IS NULL) AS missing_total_spending,
    SUM(last_purchase_days IS NULL) AS missing_recency
FROM customers;

-- Q04. Customers with suspicious data-quality status
SELECT * FROM customers
WHERE overall_data_status <> 'Valid' OR overall_data_status IS NULL;

-- Q05. Business-rule check: total spending versus purchase_count * AOV
SELECT customer_id, first_name, purchase_count, avg_order_value,
       total_spending, expected_total, difference, total_spending_status
FROM customers
ORDER BY ABS(COALESCE(difference,0)) DESC;

-- Q06. Customers with returned items
SELECT customer_id, first_name, returned_items, return_status, return_flag
FROM customers
WHERE COALESCE(returned_items,0) > 0
ORDER BY returned_items DESC;

-- Q07. Future signup dates
SELECT customer_id, first_name, signup_date, future_signup_flag
FROM customers
WHERE future_signup_flag = 1;

-- ================================================================
-- CUSTOMER VALUE ANALYSIS
-- ================================================================

-- Q08. Top 10 customers by total spending
SELECT customer_id, first_name, city, membership_tier,
       purchase_count, avg_order_value, total_spending, customer_value_segment
FROM customers
ORDER BY total_spending DESC
LIMIT 10;

-- Q09. Top customers by purchase frequency
SELECT customer_id, first_name, purchase_count, total_spending, avg_order_value
FROM customers
ORDER BY purchase_count DESC, total_spending DESC
LIMIT 10;

-- Q10. Top customers by average order value
SELECT customer_id, first_name, avg_order_value, purchase_count, total_spending
FROM customers
ORDER BY avg_order_value DESC
LIMIT 10;

-- Q11. Customer value segment summary
SELECT customer_value_segment,
       COUNT(*) AS customers,
       ROUND(AVG(total_spending),2) AS avg_spending,
       ROUND(SUM(total_spending),2) AS segment_revenue,
       ROUND(AVG(purchase_count),2) AS avg_purchases,
       ROUND(AVG(satisfaction_score),2) AS avg_satisfaction
FROM customers
GROUP BY customer_value_segment
ORDER BY segment_revenue DESC;

-- Q12. High-value customers
SELECT * FROM customers
WHERE customer_value_segment IN ('High Value','VIP','Gold','High')
ORDER BY total_spending DESC;

-- Q13. Revenue concentration by customer
SELECT customer_id, first_name, total_spending,
       ROUND(100 * total_spending / NULLIF((SELECT SUM(total_spending) FROM customers),0),2) AS revenue_share_pct
FROM customers
ORDER BY revenue_share_pct DESC;

-- ================================================================
-- CHURN / RETENTION ANALYSIS
-- ================================================================

-- Q14. Customers with the longest time since last purchase
SELECT customer_id, first_name, city, total_spending, purchase_count,
       last_purchase_days, churn_risk, churn_risk_label
FROM customers
ORDER BY last_purchase_days DESC
LIMIT 15;

-- Q15. Churn-risk distribution
SELECT churn_risk_label, COUNT(*) AS customers,
       ROUND(AVG(total_spending),2) AS avg_spending
FROM customers
GROUP BY churn_risk_label
ORDER BY customers DESC;

-- Q16. High-value customers at risk of churn
SELECT customer_id, first_name, city, membership_tier,
       total_spending, purchase_count, last_purchase_days,
       customer_value_segment, churn_risk, churn_risk_label
FROM customers
WHERE churn_risk_label IN ('High Risk','At Risk','High')
  AND customer_value_segment IN ('High Value','VIP','Gold','High')
ORDER BY total_spending DESC;

-- Q17. Retention priority score (high value + high recency risk)
SELECT customer_id, first_name, total_spending, last_purchase_days,
       customer_value_score, customer_value_segment, churn_risk,
       ROUND(COALESCE(customer_value_score,0) + COALESCE(churn_risk,0),2) AS priority_score
FROM customers
ORDER BY priority_score DESC, total_spending DESC;

-- Q18. Average spending by churn-risk label
SELECT churn_risk_label,
       COUNT(*) AS customers,
       ROUND(AVG(total_spending),2) AS avg_total_spending,
       ROUND(AVG(purchase_count),2) AS avg_purchase_count,
       ROUND(AVG(last_purchase_days),2) AS avg_days_since_purchase
FROM customers
GROUP BY churn_risk_label
ORDER BY avg_days_since_purchase DESC;

-- ================================================================
-- CITY / MARKETING ANALYSIS
-- ================================================================

-- Q19. City performance
SELECT city, province,
       COUNT(*) AS customers,
       ROUND(SUM(total_spending),2) AS total_revenue,
       ROUND(AVG(total_spending),2) AS avg_customer_spending,
       ROUND(AVG(purchase_count),2) AS avg_purchases,
       ROUND(AVG(satisfaction_score),2) AS avg_satisfaction
FROM customers
GROUP BY city, province
ORDER BY total_revenue DESC;

-- Q20. Best cities for advertising
SELECT city,
       COUNT(*) AS customer_count,
       ROUND(SUM(total_spending),2) AS total_revenue,
       ROUND(AVG(total_spending),2) AS avg_customer_value,
       ROUND(AVG(satisfaction_score),2) AS avg_satisfaction,
       ROUND(100 * AVG(CASE WHEN discount_used = 1 THEN 1 ELSE 0 END),2) AS discount_usage_pct
FROM customers
GROUP BY city
HAVING COUNT(*) >= 2
ORDER BY total_revenue DESC, avg_customer_value DESC;

-- Q21. Province performance
SELECT province, COUNT(*) AS customers,
       ROUND(SUM(total_spending),2) AS total_revenue,
       ROUND(AVG(total_spending),2) AS avg_customer_value
FROM customers
GROUP BY province
ORDER BY total_revenue DESC;

-- ================================================================
-- DISCOUNT EFFECTIVENESS
-- ================================================================

-- Q22. Overall comparison: discount vs no discount
SELECT CASE WHEN discount_used = 1 THEN 'Discount Used' ELSE 'No Discount' END AS discount_group,
       COUNT(*) AS customers,
       ROUND(AVG(purchase_count),2) AS avg_purchases,
       ROUND(AVG(avg_order_value),2) AS avg_order_value,
       ROUND(AVG(total_spending),2) AS avg_total_spending,
       ROUND(AVG(satisfaction_score),2) AS avg_satisfaction,
       ROUND(AVG(returned_items),2) AS avg_returned_items
FROM customers
GROUP BY discount_used;

-- Q23. Total revenue by discount group
SELECT CASE WHEN discount_used = 1 THEN 'Discount Used' ELSE 'No Discount' END AS discount_group,
       ROUND(SUM(total_spending),2) AS total_revenue,
       ROUND(100 * SUM(total_spending) / NULLIF((SELECT SUM(total_spending) FROM customers),0),2) AS revenue_share_pct
FROM customers
GROUP BY discount_used
ORDER BY total_revenue DESC;

-- Q24. Discount usage by membership tier
SELECT membership_tier,
       COUNT(*) AS customers,
       SUM(discount_used = 1) AS discount_users,
       ROUND(100 * AVG(CASE WHEN discount_used = 1 THEN 1 ELSE 0 END),2) AS discount_usage_pct,
       ROUND(AVG(total_spending),2) AS avg_spending
FROM customers
GROUP BY membership_tier
ORDER BY avg_spending DESC;

-- Q25. Customers who used discounts and still generated high value
SELECT customer_id, first_name, city, membership_tier,
       total_spending, purchase_count, avg_order_value, satisfaction_score
FROM customers
WHERE discount_used = 1
ORDER BY total_spending DESC
LIMIT 15;

-- ================================================================
-- CUSTOMER BEHAVIOR ANALYSIS
-- ================================================================

-- Q26. Membership tier performance
SELECT membership_tier, COUNT(*) AS customers,
       ROUND(SUM(total_spending),2) AS total_revenue,
       ROUND(AVG(total_spending),2) AS avg_spending,
       ROUND(AVG(purchase_count),2) AS avg_purchases,
       ROUND(AVG(satisfaction_score),2) AS avg_satisfaction
FROM customers
GROUP BY membership_tier
ORDER BY total_revenue DESC;

-- Q27. Payment method performance
SELECT payment_method, COUNT(*) AS customers,
       ROUND(SUM(total_spending),2) AS total_revenue,
       ROUND(AVG(avg_order_value),2) AS avg_order_value
FROM customers
GROUP BY payment_method
ORDER BY total_revenue DESC;

-- Q28. Device performance
SELECT device, COUNT(*) AS customers,
       ROUND(SUM(total_spending),2) AS total_revenue,
       ROUND(AVG(total_spending),2) AS avg_spending,
       ROUND(AVG(purchase_count),2) AS avg_purchases
FROM customers
GROUP BY device
ORDER BY total_revenue DESC;

-- Q29. Age-group analysis
SELECT CASE
         WHEN age < 25 THEN 'Under 25'
         WHEN age BETWEEN 25 AND 34 THEN '25-34'
         WHEN age BETWEEN 35 AND 44 THEN '35-44'
         WHEN age BETWEEN 45 AND 54 THEN '45-54'
         ELSE '55+'
       END AS age_group,
       COUNT(*) AS customers,
       ROUND(AVG(total_spending),2) AS avg_spending,
       ROUND(AVG(purchase_count),2) AS avg_purchases,
       ROUND(AVG(satisfaction_score),2) AS avg_satisfaction
FROM customers
GROUP BY age_group
ORDER BY avg_spending DESC;

-- Q30. Satisfaction analysis
SELECT satisfaction_score, COUNT(*) AS customers,
       ROUND(AVG(total_spending),2) AS avg_spending,
       ROUND(AVG(purchase_count),2) AS avg_purchases
FROM customers
GROUP BY satisfaction_score
ORDER BY satisfaction_score DESC;

-- Q31. Return behavior and customer value
SELECT return_status, COUNT(*) AS customers,
       ROUND(AVG(total_spending),2) AS avg_spending,
       ROUND(AVG(satisfaction_score),2) AS avg_satisfaction
FROM customers
GROUP BY return_status
ORDER BY avg_spending DESC;

-- ================================================================
-- CLUSTER / SEGMENT ANALYSIS
-- ================================================================

-- Q32. Cluster summary
SELECT cluster, COUNT(*) AS customers,
       ROUND(AVG(age),2) AS avg_age,
       ROUND(AVG(purchase_count),2) AS avg_purchases,
       ROUND(AVG(avg_order_value),2) AS avg_order_value,
       ROUND(AVG(total_spending),2) AS avg_spending,
       ROUND(AVG(last_purchase_days),2) AS avg_recency,
       ROUND(AVG(satisfaction_score),2) AS avg_satisfaction
FROM customers
GROUP BY cluster
ORDER BY avg_spending DESC;

-- Q33. Cluster revenue contribution
SELECT cluster,
       COUNT(*) AS customers,
       ROUND(SUM(total_spending),2) AS cluster_revenue,
       ROUND(100 * SUM(total_spending) / NULLIF((SELECT SUM(total_spending) FROM customers),0),2) AS revenue_share_pct
FROM customers
GROUP BY cluster
ORDER BY cluster_revenue DESC;

-- Q34. Customer segment by city
SELECT city, customer_value_segment, COUNT(*) AS customers,
       ROUND(AVG(total_spending),2) AS avg_spending
FROM customers
GROUP BY city, customer_value_segment
ORDER BY city, avg_spending DESC;

-- ================================================================
-- EXECUTIVE KPIs
-- ================================================================

-- Q35. Executive KPI summary
SELECT
    COUNT(*) AS total_customers,
    ROUND(SUM(total_spending),2) AS total_revenue,
    ROUND(AVG(total_spending),2) AS avg_customer_value,
    ROUND(AVG(avg_order_value),2) AS avg_order_value,
    ROUND(AVG(purchase_count),2) AS avg_purchase_count,
    SUM(CASE WHEN customer_value_segment IN ('High Value','VIP','Gold','High') THEN 1 ELSE 0 END) AS high_value_customers,
    SUM(CASE WHEN churn_risk_label IN ('High Risk','At Risk','High') THEN 1 ELSE 0 END) AS at_risk_customers,
    SUM(CASE WHEN discount_used = 1 THEN 1 ELSE 0 END) AS discount_users,
    ROUND(AVG(satisfaction_score),2) AS avg_satisfaction
FROM customers;

-- Q36. Top 10 retention targets
SELECT customer_id, first_name, city, total_spending,
       last_purchase_days, customer_value_segment, churn_risk_label
FROM customers
WHERE customer_value_segment IN ('High Value','VIP','Gold','High')
  AND churn_risk_label IN ('High Risk','At Risk','High')
ORDER BY total_spending DESC, last_purchase_days DESC
LIMIT 10;

-- Q37. Top 10 customers for upselling
SELECT customer_id, first_name, city, membership_tier,
       purchase_count, avg_order_value, total_spending, satisfaction_score
FROM customers
WHERE satisfaction_score >= 4
ORDER BY avg_order_value DESC, total_spending DESC
LIMIT 10;

-- Q38. Customers suitable for win-back campaigns
SELECT customer_id, first_name, city,
       total_spending, purchase_count, last_purchase_days,
       churn_risk_label, discount_used
FROM customers
WHERE last_purchase_days >= 60
ORDER BY total_spending DESC;

-- ================================================================
-- END OF SCRIPT
-- ================================================================