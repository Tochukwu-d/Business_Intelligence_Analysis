-- data creation script
USE bi_db;

CREATE TABLE customers(         
	customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    region VARCHAR(50),
    email VARCHAR(100),
    age INT
);

CREATE TABLE orders(
order_id INT PRIMARY KEY,
customer_id INT,
order_date DATE,
order_amount DECIMAL(10,2),
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE sales_data(
order_id INT PRIMARY KEY,
customer_id INT,
region VARCHAR(50),
sales_amount DECIMAL(10,2),
order_date DATE,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);