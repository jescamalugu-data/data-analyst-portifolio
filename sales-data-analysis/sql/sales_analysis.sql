-- ==========================================
-- PROJECT: SUPERSTORE SALES ANALYSIS
-- ANALYST: JESCA MAGESE
-- DATABASE: MySQL
-- ==========================================

-- 1. Total Number of Records
SELECT
    COUNT(*) AS total_records
FROM superstore_sales;


-- 2. Overall Sales and Profit Performance
SELECT
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    SUM(Quantity) AS total_quantity,
    ROUND(AVG(Discount), 2) AS average_discount,
    COUNT(DISTINCT `Order ID`) AS total_orders
FROM superstore_sales;


-- 3. Sales and Profit by Year
SELECT
    Order_Year,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM superstore_sales
GROUP BY Order_Year
ORDER BY Order_Year;


-- 4. Sales Performance by Region
SELECT
    Region,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM superstore_sales
GROUP BY Region
ORDER BY total_sales DESC;


-- 5. Sales by Product Category
SELECT
    Category,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    SUM(Quantity) AS total_quantity
FROM superstore_sales
GROUP BY Category
ORDER BY total_sales DESC;


-- 6. Top 10 Best-Selling Products
SELECT
    `Product Name`,
    ROUND(SUM(Sales), 2) AS total_sales,
    SUM(Quantity) AS total_quantity
FROM superstore_sales
GROUP BY `Product Name`
ORDER BY total_sales DESC
LIMIT 10;


-- 7. Sales by Customer Segment
SELECT
    Segment,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM superstore_sales
GROUP BY Segment
ORDER BY total_sales DESC;


-- 8. Profitability by Sub-Category
SELECT
    `Sub-Category`,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM superstore_sales
GROUP BY `Sub-Category`
ORDER BY total_profit DESC;


-- 9. Monthly Sales Trends
SELECT
    YEAR(`Order Date`) AS order_year,
    MONTH(`Order Date`) AS order_month,
    ROUND(SUM(Sales), 2) AS monthly_sales,
    ROUND(SUM(Profit), 2) AS monthly_profit
FROM superstore_sales
GROUP BY
    YEAR(`Order Date`),
    MONTH(`Order Date`)
ORDER BY order_year, order_month;


-- 10. Top 10 Customers by Sales
SELECT
    `Customer ID`,
    `Customer Name`,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM superstore_sales
GROUP BY `Customer ID`, `Customer Name`
ORDER BY total_sales DESC
LIMIT 10;
