# Power BI Dashboard Build Guide

Import:

`data/cleaned/ecommerce_sales_cleaned.csv`

## Page 1 — Executive Overview

### KPI cards
- Total Sales
- Total Profit
- Total Orders
- Total Customers
- Average Order Value
- Profit Margin %

### Visuals
1. Line chart — Axis: `Year-Month`, Value: `Total Sales`
2. Bar chart — Axis: `Region`, Value: `Total Sales`
3. Bar chart — Axis: `Category`, Value: `Total Sales`
4. Donut or bar chart — `Payment Mode` by `Total Sales`

### Slicers
- Year
- Region
- Category

## Page 2 — Product Analysis

1. Top 10 Product Name by Total Sales
2. Top 10 Product Name by Total Profit
3. Category by Total Profit
4. Category by Profit Margin %
5. Discount by Total Sales
6. Discount by Profit Margin %

### Slicers
- Year
- Category
- Sub-Category
- Product Name

## Page 3 — Customer & Regional Analysis

1. Top 10 Customer Name by Total Sales
2. Top 10 City by Total Sales
3. Region by Total Profit
4. Payment Mode by Orders

### Slicers
- Year
- Region
- City
- Customer Name

## Important data note

The dataset runs from 2023-10-04 to 2025-10-03.
2023 and 2025 are partial years. Do not compare full-year performance without noting this limitation.

## Expected headline KPIs

- Total Sales: $533,666,024.35
- Total Profit: $79,708,734.91
- Orders: 5,000
- Customers: 4,844
- Average Order Value: $106,733.20
- Profit Margin: 14.94%
