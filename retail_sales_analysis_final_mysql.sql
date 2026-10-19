/*Tables
-- Retail Sales Analysis
-- Beginner portfolio project
-- Database: MySQL 8.0+

CREATE DATABASE IF NOT EXISTS retail_sales_portfolio;
USE retail_sales_portfolio;

DROP TABLE IF EXISTS retail_sales;

CREATE TABLE retail_sales (
    order_id INT PRIMARY KEY,
    order_date DATE NOT NULL,
    product VARCHAR(100) NOT NULL,
    category VARCHAR(100) NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL
);

INSERT INTO retail_sales
    (order_id, order_date, product, category, quantity, unit_price)
VALUES
(1001, '2026-01-03', 'Notebook', 'Stationery', 3, 4.50),
(1002, '2026-01-04', 'Pen Set', 'Stationery', 2, 8.00),
(1003, '2026-01-06', 'Desk Lamp', 'Home Office', 1, 24.00),
(1004, '2026-01-08', 'Notebook', 'Stationery', 5, 4.50),
(1005, '2026-01-10', 'Water Bottle', 'Accessories', 2, 15.00),
(1006, '2026-01-12', 'Desk Lamp', 'Home Office', 2, 24.00),
(1007, '2026-01-14', 'Pen Set', 'Stationery', 4, 8.00),
(1008, '2026-01-17', 'Water Bottle', 'Accessories', 3, 15.00),
(1009, '2026-01-19', 'Notebook', 'Stationery', 2, 4.50),
(1010, '2026-01-22', 'Desk Organizer', 'Home Office', 1, 18.00),
(1011, '2026-02-02', 'Notebook', 'Stationery', 4, 4.50),
(1012, '2026-02-04', 'Pen Set', 'Stationery', 3, 8.00),
(1013, '2026-02-07', 'Desk Lamp', 'Home Office', 1, 24.00),
(1014, '2026-02-09', 'Water Bottle', 'Accessories', 4, 15.00),
(1015, '2026-02-11', 'Desk Organizer', 'Home Office', 2, 18.00),
(1016, '2026-02-14', 'Notebook', 'Stationery', 6, 4.50),
(1017, '2026-02-18', 'Pen Set', 'Stationery', 2, 8.00),
(1018, '2026-02-21', 'Desk Lamp', 'Home Office', 1, 24.00),
(1019, '2026-02-23', 'Water Bottle', 'Accessories', 2, 15.00),
(1020, '2026-02-26', 'Desk Organizer', 'Home Office', 3, 18.00); */

-- QUESTION 1: Inspect all records.
SELECT *
FROM retail_sales;

-- QUESTION 2: Find orders containing at least 3 units.
SELECT *
FROM retail_sales
WHERE quantity >= 3
ORDER BY quantity DESC;

-- QUESTION 3: List each unique product.
SELECT DISTINCT product
FROM retail_sales
ORDER BY product;

-- QUESTION 4: How many orders are in the dataset?
SELECT COUNT(*) AS total_orders
FROM retail_sales;

-- QUESTION 5: How many units were sold in total?
SELECT SUM(quantity) AS total_units_sold
FROM retail_sales;

-- QUESTION 6: Which products generated the most revenue?
SELECT
    product,
    SUM(quantity * unit_price) AS total_revenue
FROM retail_sales
GROUP BY product
ORDER BY total_revenue DESC;

-- QUESTION 7: Which categories generated the most revenue?
SELECT
    category,
    SUM(quantity * unit_price) AS total_revenue
FROM retail_sales
GROUP BY category
ORDER BY total_revenue DESC;

-- QUESTION 8: How much revenue was generated each month?
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS sales_month,
    SUM(quantity * unit_price) AS total_revenue
FROM retail_sales
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY sales_month;

-- QUESTION 9: What is the overall revenue?
SELECT SUM(quantity * unit_price) AS overall_revenue
FROM retail_sales; 

-- QUESTION 10: How many units were sold in total?
 select sum(quantity) as total_units_sold
from retail_sales;

-- QUESTION 11: Which products sell the most units?
select product, sum(quantity) as total_quantity_sold
from retail_sales
group by product 
order by total_quantity_sold desc; 

-- QUESTION 12: What is the average selling price for each product?
select 
    product, 
    sum(quantity) as total_sold, 
    sum(unit_price * quantity) as total_revenue, 
    round(sum(unit_price * quantity)/sum(quantity), 2) as avg_price_per_unit
from retail_sales
group by product
order by avg_price_per_unit desc;

-- The following queries check for the quality of the data

-- Confirming the number of records. Expecting 20
select count(*) as total_sales
from retail_sales;

-- Checking for missing values. Expecting 0
select
    sum(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS missing_order_ids,
    sum(CASE WHEN order_date IS NULL THEN 1 ELSE 0 END) AS missing_dates,
    sum(CASE WHEN product IS NULL OR TRIM(product) = '' THEN 1 ELSE 0 END) AS missing_products,
    sum(CASE WHEN category IS NULL OR TRIM(category) = '' THEN 1 ELSE 0 END) AS missing_categories,
    sum(CASE WHEN quantity IS NULL THEN 1 ELSE 0 END) AS missing_quantities,
    sum(CASE WHEN unit_price IS NULL THEN 1 ELSE 0 END) AS missing_prices
from retail_sales;

-- Checking for suspicious QUANTITIES or PRICES. Expecting 0
select *
from retail_sales
where quantity <= 0
   or unit_price < 0;
