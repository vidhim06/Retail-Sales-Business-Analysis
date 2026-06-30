-- Database Setup

CREATE DATABASE superstore_analysis;
USE superstore_analysis;

-- View Dataset

SELECT *
FROM superstore
LIMIT 5;

-- Check Table Structure

DESCRIBE superstore;

-- Total Sales

SELECT ROUND(SUM(Sales),2) AS Total_Sales
FROM superstore;

-- Total Orders

SELECT COUNT(DISTINCT `Order ID`) AS Total_Orders
FROM superstore;

-- Total Customers

SELECT COUNT(DISTINCT `Customer ID`) AS Total_Customers
FROM superstore;

-- Sales by Category

SELECT Category,
       ROUND(SUM(Sales),2) AS Revenue
FROM superstore
GROUP BY Category
ORDER BY Revenue DESC;

-- Sales by Region

SELECT Region,
       ROUND(SUM(Sales),2) AS Revenue
FROM superstore
GROUP BY Region
ORDER BY Revenue DESC;

-- Top 10 Customers

SELECT `Customer Name`,
       ROUND(SUM(Sales),2) AS Revenue
FROM superstore
GROUP BY `Customer Name`
ORDER BY Revenue DESC
LIMIT 10;

-- Top 10 States by Sales

SELECT State,
       ROUND(SUM(Sales),2) AS Revenue
FROM superstore
GROUP BY State
ORDER BY Revenue DESC
LIMIT 10;

-- Sales by Segment

SELECT Segment,
       ROUND(SUM(Sales),2) AS Revenue
FROM superstore
GROUP BY Segment
ORDER BY Revenue DESC;

-- Check Date Format

SELECT `Order Date`
FROM superstore
LIMIT 5;

-- Monthly Sales Trend

SELECT
    YEAR(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS Year,
    MONTH(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS Month,
    ROUND(SUM(Sales),2) AS Revenue
FROM superstore
GROUP BY Year, Month
ORDER BY Year, Month;

-- Total Profit

SELECT ROUND(SUM(Profit),2) AS Total_Profit
FROM superstore;

-- Profit by Category

SELECT Category,
       ROUND(SUM(Profit),2) AS Profit
FROM superstore
GROUP BY Category
ORDER BY Profit DESC;

-- Top 10 States by Profit

SELECT State,
       ROUND(SUM(Profit),2) AS Profit
FROM superstore
GROUP BY State
ORDER BY Profit DESC
LIMIT 10;

-- Profit by Sub-Category

SELECT `Sub-Category`,
       ROUND(SUM(Profit),2) AS Profit
FROM superstore
GROUP BY `Sub-Category`
ORDER BY Profit ASC;

-- Average Discount by Category

SELECT Category,
       ROUND(AVG(Discount)*100,2) AS Avg_Discount_Percentage
FROM superstore
GROUP BY Category;

-- Sales by Discount

SELECT Discount,
       ROUND(SUM(Sales),2) AS Revenue
FROM superstore
GROUP BY Discount
ORDER BY Discount;

-- Top 10 Products by Units Sold

SELECT `Product Name`,
       SUM(Quantity) AS Total_Units_Sold
FROM superstore
GROUP BY `Product Name`
ORDER BY Total_Units_Sold DESC
LIMIT 10;