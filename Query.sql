SELECT * FROM sales_data;


SELECT COUNT(*) FROM sales_data;


-- ----------------------------------1. Total and AVG Sales-----------------------------
SELECT
	SUM(sales) AS total_sales,
	AVG(sales) AS avg_sales
FROM sales_data;


-- ---------------------------2. Total Sales Overall and Time Period----------------------
SELECT
	order_date,
	SUM(sales) AS total_sales
FROM sales_data
GROUP BY order_date;


-- ------------------------------3. AVG Sales per Order----------------------------------
SELECT
	order_number,
	AVG(sales) AS avg_sales
FROM sales_data
GROUP BY order_number;


-- -----------------------4. Highest and Lowest Sales Order-----------------------------
SELECT
	quantity_ordered,
	MAX(sales) AS max_sales,
	MIN(sales) AS min_sales
FROM sales_data
GROUP BY quantity_ordered
ORDER BY max_sales, min_sales DESC;


-- ---------------5. Total Quantity Ordered Overall and by Product Line--------------------
SELECT
	product_line,
	SUM(quantity_ordered) AS total_quantity_ordered
FROM sales_data
GROUP BY product_line
ORDER BY total_quantity_ordered DESC;


-- ---------------------------6. Count of distinct order--------------------------------
SELECT
	COUNT(DISTINCT(order_number)) AS dist_count_ordered
FROM sales_data;


-- ---------------------------7. AVG Qunatity per Order---------------------------------
SELECT
	order_number,
	AVG(quantity_ordered) AS avg_quanity_ordered
FROM sales_data
GROUP BY order_number;


-- ---------------------------8. Sales by Product Line--------------------------------
SELECT
	product_line,
	SUM(sales) AS total_sales
FROM sales_data
GROUP BY product_line;


-- --9. Comparision of MSRP (Manufacturer's Suggested Retail Price) vs Actual Price------
SELECT
	product_line,
	AVG(msrp) AS avg_msrp,
	AVG(price_each) AS avg_price_each
FROM sales_data
GROUP BY product_line;


-- ----------------10. Most Popular Product Code by Quantity Sold-------------------------
SELECT
	product_code,
	SUM(quantity_ordered) AS total_sold
FROM sales_data
GROUP BY product_code
ORDER BY total_sold DESC
LIMIT 10;


-- -----------------------11. Sales and Orders by Customers------------------------------
SELECT
	customer_name,
	quantity_ordered,
	SUM(sales) AS total_ordered
FROM sales_data
GROUP BY customer_name, quantity_ordered
ORDER BY total_ordered DESC;


-- ---------------12. Geographic Sales Distribution by City, State, Country---------------
SELECT
	city,
	state,
	country,
	SUM(sales) AS total_sales
FROM sales_data
GROUP BY city, state, country
ORDER BY total_sales DESC;


-- -----------------13. Deal Size Categories and Their Sales Contributions---------------
SELECT
	deal_size,
	SUM(sales) AS total_sales,
	COUNT(*) AS total_count
FROM sales_data
GROUP BY deal_size
ORDER BY total_sales;


-- --------------------------14. Sales by Order Status--------------------------------
SELECT
	status,
	SUM(sales) AS total_sales
FROM sales_data
GROUP BY status
ORDER BY total_sales DESC;


-- --------------15. Trends Over Time Using Order_Date, Month_ID, Year_ID----------------
SELECT
	order_date,
	month_id,
	year_id,
	SUM(sales) AS total_sales
FROM sales_data
GROUP BY order_date, month_id, year_id
ORDER BY total_sales DESC;