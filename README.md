# Data Cleaning Project

## Overview
This project involved cleaning and preprocessing a raw Excel dataset to make it ready for analysis. The dataset contained missing values, duplicate records, inconsistencies in text capitalization, and mixed date formats.

## Cleaning Steps Taken

1. Converted all column headers and text values to lowercase to maintain consistency.
2. Inspected and filtered the dataset to identify missing values in various columns.
3. Replaced all blank or missing values with the placeholder "unknown" to clearly mark missing information.
4. Removed duplicate rows using Excel’s Remove Duplicates feature to ensure uniqueness of records.
5. Standardized date columns by converting them to proper date format.

## Outcome
The cleaned dataset is now consistent, free of duplicates, and ready for further data analysis or modeling. Missing data have been clearly tagged and dates standardized for ease of use.

## Tools Used
- Microsoft Excel


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


# Sales Data Analysis with PostgreSQL

This project demonstrates various SQL queries and analyses on a sales dataset using PostgreSQL. The dataset consists of detailed sales records, including order details, product information, customer data, geographic locations, and time-related fields.

## Dataset Overview

The dataset contains the following key fields:
- `order_number`: Unique identifier for each order.
- `quantity_ordered`: Number of units ordered.
- `price_each`: Actual selling price per unit.
- `msrp`: Manufacturer's Suggested Retail Price (list price).
- `sales`: Total sales value for the order line.
- `order_date`: Date when the order was placed.
- `status`: Status of the order (e.g., shipped, canceled).
- `qtr_id`, `month_id`, `year_id`: Quarter, month, and year identifiers.
- `product_line`: Category of the product.
- `product_code`: Unique product identifier.
- `customer_name`: Name of the customer.
- `city`, `state`, `country`: Geographic location details.
- `deal_size`: Size category of the deal (e.g., Small, Medium, Large).

## SQL Queries and Insights

### 1. Total and AVG sales
SELECT
	SUM(sales) AS total_sales,
	AVG(sales) AS avg_sales
FROM sales_data;

### 2. Total Sales Overall and Time Period
SELECT
	order_date,
	SUM(sales) AS total_sales
FROM sales_data
GROUP BY order_date;

### 3. AVG Sales per Order
SELECT
	order_number,
	AVG(sales) AS avg_sales
FROM sales_data
GROUP BY order_number;

### 4. Highest and Lowest Sales Order
SELECT
	quantity_ordered,
	MAX(sales) AS max_sales,
	MIN(sales) AS min_sales
FROM sales_data
GROUP BY quantity_ordered
ORDER BY max_sales, min_sales DESC;

### 5. Total Quantity Ordered Overall and by Product Line
SELECT
	product_line,
	SUM(quantity_ordered) AS total_quantity_ordered
FROM sales_data
GROUP BY product_line
ORDER BY total_quantity_ordered DESC;

### 6. Count of distinct order
SELECT
	COUNT(DISTINCT(order_number)) AS dist_count_ordered
FROM sales_data;

### 7.  AVG Qunatity per Order
SELECT
	order_number,
	AVG(quantity_ordered) AS avg_quanity_ordered
FROM sales_data
GROUP BY order_number;

### 8. Sales by Product Line
SELECT
	product_line,
	SUM(sales) AS total_sales
FROM sales_data
GROUP BY product_line;

### 9. Comparision of MSRP (Manufacturer's Suggested Retail Price) vs Actual Price
SELECT
	product_line,
	AVG(msrp) AS avg_msrp,
	AVG(price_each) AS avg_price_each
FROM sales_data
GROUP BY product_line;

### 10. Most Popular Product Code by Quantity Sold
SELECT
	product_code,
	SUM(quantity_ordered) AS total_sold
FROM sales_data
GROUP BY product_code
ORDER BY total_sold DESC
LIMIT 10;

### 11. Sales and Orders by Customers
SELECT
	customer_name,
	quantity_ordered,
	SUM(sales) AS total_ordered
FROM sales_data
GROUP BY customer_name, quantity_ordered
ORDER BY total_ordered DESC;

### 12. Geographic Sales Distribution by City, State, Country
SELECT
	city,
	state,
	country,
	SUM(sales) AS total_sales
FROM sales_data
GROUP BY city, state, country
ORDER BY total_sales DESC;

### 13. Deal Size Categories and Their Sales Contributions
SELECT
	deal_size,
	SUM(sales) AS total_sales,
	COUNT(*) AS total_count
FROM sales_data
GROUP BY deal_size
ORDER BY total_sales;

### 14. Sales by Order Status
SELECT
	status,
	SUM(sales) AS total_sales
FROM sales_data
GROUP BY status
ORDER BY total_sales DESC;

### 15. Trends Over Time Using Order_Date, Month_ID, Year_ID
SELECT
	order_date,
	month_id,
	year_id,
	SUM(sales) AS total_sales
FROM sales_data
GROUP BY order_date, month_id, year_id
ORDER BY total_sales DESC;


## Tools Used
- PoatgreSQL

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

This README serves as a comprehensive guide for sales data analysis using PostgreSQL SQL queries. It can be used for project documentation, portfolio presentations, or reference in professional work.
