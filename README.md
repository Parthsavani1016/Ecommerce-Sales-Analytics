# E-Commerce Sales Analytics

A portfolio-ready end-to-end Data Analyst project using **Python, Pandas, SQL, and Power BI**.

## Project objective

Analyze 5,000 e-commerce transactions to understand revenue, profitability, product performance, customer behavior, regional performance, discounts, and payment methods.

## Dataset

- Rows: **5,000**
- Original columns: **14**
- Date range: **2023-10-04 to 2025-10-03**
- Missing values in source data: **0**
- Duplicate rows in source data: **0**

> **Data limitation:** 2023 and 2025 are partial years, so full-year comparisons must be interpreted carefully.

## Tools

- Python
- Pandas
- NumPy
- Matplotlib
- SQLite / SQL
- Power BI
- DAX
- Git / GitHub

## Headline KPIs

| KPI | Result |
|---|---:|
| Total Sales | $533,666,024.35 |
| Total Profit | $79,708,734.91 |
| Profit Margin | 14.94% |
| Total Orders | 5,000 |
| Total Customers | 4,844 |
| Average Order Value | $106,733.20 |

## Key findings

- **Home Decor** generated the highest category sales: **$57,233,222.35**.
- **Furniture** generated the highest category profit: **$8,693,087.03**.
- **North** was the strongest region by sales: **$143,578,246.10**.
- **Net Banking** was the highest-sales payment method: **$111,465,516.05**.
- **Bangalore** was the highest-sales city: **$29,989,840.85**.
- **Aaryahi Madan** was the highest-sales customer: **$650,151.90**.
- Higher discount groups did not show higher aggregate sales in this dataset; this is an association, not proof of causation.

## Repository structure

```text
Ecommerce-Sales-Analytics/
├── README.md
├── requirements.txt
├── python/
│   └── ecommerce_analysis.ipynb
├── sql/
│   └── ecommerce_analysis.sql
└── powerbi/
    └── PowerBI_Dashboard_Guide.md
```

## Analysis workflow

1. Validate source data.
2. Convert order dates to datetime.
3. Create Year, Month, Year-Month, and Profit Margin fields.
4. Calculate overall KPIs.
5. Analyze categories, products, customers, cities, regions, discounts, and payment methods.
6. Analyze monthly and yearly trends.
7. Load cleaned data into SQLite.
8. Run SQL aggregations, CTEs, `CASE WHEN`, and window functions.
9. Prepare DAX measures and a three-page Power BI dashboard design.
10. Translate findings into business recommendations.

## Dashboard plan

### Page 1 — Executive Overview
KPI cards, monthly sales trend, region performance, category performance, payment method performance.

### Page 2 — Product Analysis
Top products, product profitability, category profitability, discount analysis.

### Page 3 — Customer & Regional Analysis
Top customers, top cities, regional profit, payment behavior.

## Run the project

Clone the repository and install dependencies:

```bash
git clone https://github.com/Parthsavani1016/Ecommerce-Sales-Analytics.git
cd Ecommerce-Sales-Analytics
pip install -r requirements.txt
```

Place the source CSV at:

```text
data/raw/Ecommerce_Sales_Data_2024_2025.csv
```

The source dataset is not stored in this repository. This avoids republishing data without a confirmed redistribution licence.

Open:

```text
python/ecommerce_analysis.ipynb
```

Running the notebook creates the SQLite database locally as:

```text
ecommerce_project.db
```

The complete SQL script is:

```text
sql/ecommerce_analysis.sql
```

Running the notebook also generates the cleaned Power BI input at:

```text
data/cleaned/ecommerce_sales_cleaned.csv
```

Then follow:

```text
powerbi/PowerBI_Dashboard_Guide.md
```

## Resume-ready description

**E-Commerce Sales Analytics | Python, SQL, Power BI**

Analyzed 5,000 e-commerce transactions using Python, Pandas, and SQL to evaluate $533M+ in sales across products, customers, regions, discounts, and payment methods. Built reusable KPI analysis, SQL queries using CTEs and window functions, and a Power BI-ready dashboard model for business performance reporting.
