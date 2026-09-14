-- E-Commerce Sales Analytics
-- Table: sales
-- Compatible with SQLite

-- 1. Preview data
SELECT *
FROM sales
LIMIT 10;

-- 2. Overall KPIs
SELECT
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    COUNT(DISTINCT "Order ID") AS Total_Orders,
    COUNT(DISTINCT "Customer Name") AS Total_Customers,
    ROUND(SUM(Sales) / COUNT(DISTINCT "Order ID"), 2) AS Average_Order_Value,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Profit_Margin_Percent
FROM sales;

-- 3. Category performance
SELECT
    Category,
    COUNT(DISTINCT "Order ID") AS Orders,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Profit_Margin_Percent
FROM sales
GROUP BY Category
ORDER BY Total_Sales DESC;

-- 4. Region performance
SELECT
    Region,
    COUNT(DISTINCT "Order ID") AS Orders,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM sales
GROUP BY Region
ORDER BY Total_Sales DESC;

-- 5. Top 10 products by sales
SELECT
    "Product Name",
    SUM(Quantity) AS Units_Sold,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM sales
GROUP BY "Product Name"
ORDER BY Total_Sales DESC
LIMIT 10;

-- 6. Bottom 10 products by profit
SELECT
    "Product Name",
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM sales
GROUP BY "Product Name"
ORDER BY Total_Profit ASC
LIMIT 10;

-- 7. Top 10 customers
SELECT
    "Customer Name",
    COUNT(DISTINCT "Order ID") AS Orders,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM sales
GROUP BY "Customer Name"
ORDER BY Total_Sales DESC
LIMIT 10;

-- 8. Top 10 cities
SELECT
    City,
    COUNT(DISTINCT "Order ID") AS Orders,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM sales
GROUP BY City
ORDER BY Total_Sales DESC
LIMIT 10;

-- 9. Payment method performance
SELECT
    "Payment Mode",
    COUNT(DISTINCT "Order ID") AS Orders,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM sales
GROUP BY "Payment Mode"
ORDER BY Total_Sales DESC;

-- 10. Discount analysis
SELECT
    Discount,
    COUNT(DISTINCT "Order ID") AS Orders,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Profit_Margin_Percent
FROM sales
GROUP BY Discount
ORDER BY Discount;

-- 11. Monthly sales trend
SELECT
    "Year-Month",
    COUNT(DISTINCT "Order ID") AS Orders,
    ROUND(SUM(Sales), 2) AS Monthly_Sales,
    ROUND(SUM(Profit), 2) AS Monthly_Profit
FROM sales
GROUP BY "Year-Month"
ORDER BY "Year-Month";

-- 12. Yearly performance
-- Note: 2023 and 2025 are partial years in this dataset.
SELECT
    Year,
    COUNT(DISTINCT "Order ID") AS Orders,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM sales
GROUP BY Year
ORDER BY Year;

-- 13. Rank categories by sales using a CTE + window function
WITH CategorySales AS (
    SELECT
        Category,
        SUM(Sales) AS Total_Sales,
        SUM(Profit) AS Total_Profit
    FROM sales
    GROUP BY Category
)
SELECT
    Category,
    ROUND(Total_Sales, 2) AS Total_Sales,
    ROUND(Total_Profit, 2) AS Total_Profit,
    RANK() OVER (ORDER BY Total_Sales DESC) AS Sales_Rank
FROM CategorySales
ORDER BY Sales_Rank;

-- 14. Rank products inside each category
WITH ProductSales AS (
    SELECT
        Category,
        "Product Name",
        SUM(Sales) AS Total_Sales
    FROM sales
    GROUP BY Category, "Product Name"
),
RankedProducts AS (
    SELECT
        Category,
        "Product Name",
        Total_Sales,
        ROW_NUMBER() OVER (
            PARTITION BY Category
            ORDER BY Total_Sales DESC
        ) AS Product_Rank
    FROM ProductSales
)
SELECT
    Category,
    "Product Name",
    ROUND(Total_Sales, 2) AS Total_Sales,
    Product_Rank
FROM RankedProducts
WHERE Product_Rank <= 3
ORDER BY Category, Product_Rank;

-- 15. Customer segmentation with CASE WHEN
WITH CustomerSales AS (
    SELECT
        "Customer Name",
        SUM(Sales) AS Customer_Sales
    FROM sales
    GROUP BY "Customer Name"
)
SELECT
    "Customer Name",
    ROUND(Customer_Sales, 2) AS Customer_Sales,
    CASE
        WHEN Customer_Sales >= 300000 THEN 'High Value'
        WHEN Customer_Sales >= 150000 THEN 'Medium Value'
        ELSE 'Standard'
    END AS Customer_Segment
FROM CustomerSales
ORDER BY Customer_Sales DESC;
