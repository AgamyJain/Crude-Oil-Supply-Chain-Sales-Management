USE crudesales;
-- ============================================================
-- Project: Crude Oil Supply Chain & Sales Analysis
-- Database: crudeSales
-- Tool: MySQL
-- ============================================================
-- Q01. BUYER & SUPPLIER PERFORMANCE
-- ============================================================
-- Business Question:
-- Identify the buyers and suppliers contributing the most in terms of traded quantity (MT) and calculated revenue (USD).
-- Output: Q01_Buyer_Supplier_Performance.csv
-- ============================================================

SELECT
    'Buyer' AS Entity_Type,
    b.company_name AS Entity,
    COUNT(*) AS Total_Transactions,
    SUM(t.quantity_mt) AS Total_Quantity_MT,
    AVG(t.price_per_barrel) AS Average_Price_Per_Barrel,
    SUM((t.quantity_mt * t.price_per_barrel) / 7.33) AS Total_Revenue_USD
FROM transactions t
JOIN buyers b
    ON t.buyer_id = b.buyer_id
GROUP BY b.company_name
UNION ALL
SELECT
    'Supplier' AS Entity_Type,
    s.company_name AS Entity,
    COUNT(*) AS Total_Transactions,
    SUM(t.quantity_mt) AS Total_Quantity_MT,
    AVG(t.price_per_barrel) AS Average_Price_Per_Barrel,
    SUM((t.quantity_mt * t.price_per_barrel) / 7.33) AS Total_Revenue_USD
FROM transactions t
JOIN suppliers s
    ON t.supplier_id = s.supplier_id
GROUP BY s.company_name
ORDER BY Entity_Type, Total_Revenue_USD DESC;

-- ============================================================
-- Q02. CRUDE TYPE PERFORMANCE
-- ============================================================
-- Business Question:
-- Which crude oil types have the greatest commercial contribution, and how do pricing levels differ?
-- Output: Q02_Crude_Type_Performance.csv
-- ============================================================

SELECT
    t.crude_type AS Crude_Type,
    COUNT(*) AS Total_Transactions,
    SUM(t.quantity_mt) AS Total_Quantity_MT,
    AVG(t.price_per_barrel) AS Average_Price_Per_Barrel,
    SUM((t.quantity_mt * t.price_per_barrel) / 7.33) AS Total_Revenue_USD
FROM transactions t
GROUP BY t.crude_type
ORDER BY Total_Revenue_USD DESC;

-- ============================================================
-- Q03. REGIONAL PERFORMANCE
-- ============================================================
-- Business Question:
-- Which buyer and supplier regions account for the largest share of trading activity?
-- Output: Q03_Regional_Performance.csv
-- ============================================================

SELECT
    'Buyer Region' AS Region_Type,
    b.region AS Region,
    COUNT(*) AS Total_Transactions,
    SUM(t.quantity_mt) AS Total_Quantity_MT,
    AVG(t.price_per_barrel) AS Average_Price_Per_Barrel,
    SUM((t.quantity_mt * t.price_per_barrel) / 7.33) AS Total_Revenue_USD
FROM transactions t
JOIN buyers b
    ON t.buyer_id = b.buyer_id
GROUP BY b.region
UNION ALL
SELECT
    'Supplier Region' AS Region_Type,
    s.region AS Region,
    COUNT(*) AS Total_Transactions,
    SUM(t.quantity_mt) AS Total_Quantity_MT,
    AVG(t.price_per_barrel) AS Average_Price_Per_Barrel,
    SUM((t.quantity_mt * t.price_per_barrel) / 7.33) AS Total_Revenue_USD
FROM transactions t
JOIN suppliers s
    ON t.supplier_id = s.supplier_id
GROUP BY s.region
ORDER BY Region_Type, Total_Revenue_USD DESC;

-- ============================================================
-- Q04. MONTHLY TRADING TREND
-- ============================================================
-- Business Question:
-- How does crude oil trading activity change over time, and which periods show notable changes in transaction volume, quantity, revenue and pricing?
-- Output: Q04_Monthly_Trading_Trend.csv
-- ============================================================

SELECT
    DATE_FORMAT(t.transaction_date, '%Y-%m') AS Month,
    COUNT(*) AS Total_Transactions,
    SUM(t.quantity_mt) AS Total_Quantity_MT,
    AVG(t.price_per_barrel) AS Average_Price_Per_Barrel,
    SUM((t.quantity_mt * t.price_per_barrel) / 7.33) AS Total_Revenue_USD
FROM transactions t
GROUP BY DATE_FORMAT(t.transaction_date, '%Y-%m')
ORDER BY Month;

-- ============================================================
-- Q05. OVERALL TRANSACTION PERFORMANCE
-- ============================================================
-- Business Question:
-- What is the overall trading performance in terms of transactions, quantity, average price and calculated revenue?
-- Output: Q05_Overall_Transaction_Performance.csv
-- ============================================================

SELECT
    COUNT(*) AS Total_Transactions,
    SUM(t.quantity_mt) AS Total_Quantity_MT,
    AVG(t.price_per_barrel) AS Average_Price_Per_Barrel,
    SUM((t.quantity_mt * t.price_per_barrel) / 7.33) AS Total_Revenue_USD
FROM transactions t;