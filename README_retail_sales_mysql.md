# Retail Sales Analysis Using MySQL

## Project Overview
This beginner portfolio project analyzes a small, fictional retail sales dataset using MySQL. The goal is to practice querying data and answering basic business questions.

## Business Questions
1. Which products generate the most revenue?
2. Which product categories generate the most revenue?
3. How does revenue compare between January and February 2026?
4. How many orders and units are represented in the dataset?

## Dataset
The table `retail_sales` contains 20 fictional sales records with these columns:
- `order_id`: unique order identifier
- `order_date`: date of the order
- `product`: product name
- `category`: product category
- `quantity`: number of units in the order
- `unit_price`: price per unit

Revenue is calculated as `quantity * unit_price`. The data is fictional and intended for learning.

## Tools
- MySQL 8.0+
- MySQL Workbench
- GitHub

## SQL Skills Practiced
- `SELECT`, `WHERE`, and `ORDER BY`
- `GROUP BY`
- `COUNT()` and `SUM()`
- `DISTINCT`
- Calculated columns
- Date formatting with `DATE_FORMAT()`

## Files
- `retail_sales_analysis_mysql.sql`: creates the database and table, inserts the sample data, and contains the analysis queries.
- `retail_sales.csv`: optional CSV copy of the practice dataset.

## Key Findings
After running the queries in MySQL Workbench, here are some of the key findings I came across:

- Total revenue: The fictional store generated $571 in revenue across 20 sales records, selling 53 units.

- Top product by revenue: Water Bottles generated $165, the highest revenue among the five products.

- Top product by units sold: Notebooks led in sales volume with 20 units sold, generating $90 in revenue.

- Category performance: Home Office generated $228, Stationery generated $178, and Accessories generated $165.

- Monthly performance: Revenue increased from $258 in January 2026 to $313 in February 2026, an increase of $55 (approximately 21.3%).

## Recommendations
1. Investigate product performance by both revenue and volume. Notebooks sold the most units, while Water Bottles generated the most revenue. The store could use this information to guide future inventory and promotional decisions.

2. Monitor monthly revenue over a longer period. February revenue exceeded January revenue, but two months of fictional data are not enough to establish a lasting trend.

## Data Quality
The dataset passed the checks performed: 20 records were present, no missing values were detected in the six checked columns, and no rows had zero or negative quantities or negative prices.

## Limitations
This project uses a small fictional dataset covering January and February 2026. It does not include product costs, discounts, returns, or customer details. Revenue should not be interpreted as profit, and the results should not be generalized to real retail businesses.
