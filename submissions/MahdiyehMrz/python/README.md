# Project 2 — Customer Analytics

## اجرای پروژه در VS Code

1. این پوشه را در VS Code باز کنید.
2. از منوی Terminal → New Terminal ترمینال را باز کنید.
3. یکی از این دو روش را اجرا کنید.

### روش 1 — ساده در Windows

روی فایل زیر دوبار کلیک کنید:

`run_project.bat`

### روش 2 — از داخل Terminal

```bash
python -m pip install -r requirements.txt
python project2.py
```

اگر `python` شناخته نشد:

```bash
py -m pip install -r requirements.txt
py project2.py
```

## ساختار

```text
Project_2_Customer_Analytics/
│
├── customers_final_clean(1).xlsx
├── project2.py
├── requirements.txt
├── run_project.bat
├── README.md
└── outputs/
    ├── figures/
    ├── tables/
    └── models/
```

## تحلیل‌های پروژه

- Data Quality Audit
- Missing Values
- Duplicate Check
- Descriptive Statistics
- Median / Skewness / Kurtosis
- Shapiro-Wilk Normality Test
- IQR Outlier Detection
- Spearman Correlation
- Customer Value Score
- Customer Value Segmentation
- Churn Risk Analysis
- K-Means Clustering
- Elbow Method
- Silhouette Score
- Kruskal-Wallis Test
- Discount Effectiveness
- Mann-Whitney U Test
- Bootstrap 95% Confidence Interval
- City Marketing Opportunity Score
- Logistic Regression
- Random Forest
- Stratified Cross-Validation
- ROC-AUC
- Feature Importance
- Business Recommendations

## نکته مهم درباره Churn

در فایل فعلی، برچسب واقعی «مشتری در آینده خرید نکرد» وجود ندارد.
بنابراین برای پروژه آموزشی، `last_purchase_days > 180` به‌عنوان Proxy برای
Churn Risk استفاده شده است.

این Target واقعی Future Churn نیست. برای مدل تولیدی باید تاریخچه تراکنش‌ها،
پنجره زمانی آینده و برچسب واقعی churn در اختیار باشد.

همچنین `last_purchase_days` به‌عنوان Feature مدل وارد نشده است تا Target
Leakage ایجاد نشود.

## خروجی

بعد از اجرا، فایل‌های زیر ایجاد می‌شوند:

- `outputs/customer_analysis_output.xlsx`
- `outputs/business_recommendations.txt`
- جداول CSV در `outputs/tables/`
- نمودارهای PNG با کیفیت 300dpi در `outputs/figures/`
- مدل‌های ML در `outputs/models/`

این دیتاست فقط 60 مشتری دارد؛ بنابراین نتایج ML باید اکتشافی و Proof-of-Concept
تفسیر شوند، نه به‌عنوان مدل عملیاتی شرکت.
