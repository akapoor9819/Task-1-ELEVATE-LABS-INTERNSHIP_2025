DROP TABLE IF EXISTS sales_data;

CREATE TABLE sales_data(
order_number INT,
quantity_ordered INT,
price_each FLOAT,
order_line_number INT,
sales FLOAT,
order_date DATE,
status VARCHAR(20),
qtr_id INT,
month_id INT,
year_id INT,
product_line VARCHAR(50),
msrp INT,
product_code TEXT,
customer_name TEXT,
phone TEXT,
address_line_1 TEXT,
address_line_2 TEXT,
city VARCHAR(50),
state VARCHAR(30),
postal_code TEXT,
country VARCHAR(30),
territory VARCHAR(30),
contact_last_name VARCHAR(50),
contact_first_name VARCHAR(50),
deal_size VARCHAR(10)
);