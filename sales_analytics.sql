-- Active: 1791484809052@@127.0.0.1@3306@mysql
-- Customers
CREATE DATABASE sales_analytics;
use sales_analytics;
CREATE TABLE customers (
    customer_id   INT PRIMARY KEY,
    first_name    VARCHAR(50),
    last_name     VARCHAR(50),
    email         VARCHAR(100),
    city          VARCHAR(50),
    country       VARCHAR(50)
);

-- Products
CREATE TABLE products (
    product_id    INT PRIMARY KEY,
    product_name  VARCHAR(100),
    category      VARCHAR(50),
    unit_price    DECIMAL(10,2)
);

-- Orders
CREATE TABLE orders (
    order_id      INT PRIMARY KEY,
    customer_id   INT,
    order_date    DATE,
    total_amount  DECIMAL(12,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Order Items
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id      INT,
    product_id    INT,
    quantity      INT,
    unit_price    DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
-- Customers
INSERT INTO customers VALUES
(1, 'Ali', 'Khan', 'ali@email.com', 'Karachi', 'Pakistan'),
(2, 'Sara', 'Ahmed', 'sara@email.com', 'Lahore', 'Pakistan'),
(3, 'John', 'Smith', 'john@email.com', 'London', 'UK'),
(4, 'Emma', 'Wilson', 'emma@email.com', 'New York', 'USA'),
(5, 'Ahmed', 'Raza', 'ahmed@email.com', 'Islamabad', 'Pakistan');

-- Products
INSERT INTO products VALUES
(101, 'Laptop', 'Electronics', 850.00),
(102, 'Mouse', 'Electronics', 25.00),
(103, 'Keyboard', 'Electronics', 45.00),
(104, 'Notebook', 'Stationery', 5.50),
(105, 'Pen Set', 'Stationery', 8.00),
(106, 'Headphones', 'Electronics', 65.00);

-- Orders
INSERT INTO orders VALUES
(1001, 1, '2025-01-15', 920.00),
(1002, 2, '2025-01-20', 70.50),
(1003, 3, '2025-02-05', 895.00),
(1004, 1, '2025-02-12', 130.00),
(1005, 4, '2025-02-18', 58.00),
(1006, 5, '2025-03-03', 850.00),
(1007, 2, '2025-03-10', 113.00),
(1008, 3, '2025-03-22', 45.00);

-- Order Items
INSERT INTO order_items VALUES
(1, 1001, 101, 1, 850.00),
(2, 1001, 102, 2, 25.00),
(3, 1001, 103, 1, 45.00),
(4, 1002, 104, 5, 5.50),
(5, 1002, 105, 4, 8.00),
(6, 1003, 101, 1, 850.00),
(7, 1003, 106, 1, 65.00),
(8, 1004, 102, 2, 25.00),
(9, 1004, 106, 1, 65.00),
(10, 1005, 104, 4, 5.50),
(11, 1005, 105, 4, 8.00),
(12, 1006, 101, 1, 850.00),
(13, 1007, 103, 1, 45.00),
(14, 1007, 106, 1, 65.00),
(15, 1008, 103, 1, 45.00);
SELECT SUM(total_amount) AS total_revenue
FROM orders;
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(total_amount) AS revenue
FROM orders
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY month;
SELECT 
    p.product_name,
    SUM(oi.quantity) AS total_sold,
    SUM(oi.quantity * oi.unit_price) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC;
SELECT 
    c.first_name,
    c.last_name,
    c.city,
    SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name, c.city
ORDER BY total_spent DESC;
SELECT 
    c.country,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.country
ORDER BY revenue DESC;
SELECT 
    ROUND(AVG(total_amount), 2) AS average_order_value
FROM orders;
SELECT 
    p.category,
    SUM(oi.quantity) AS units_sold,
    SUM(oi.quantity * oi.unit_price) AS category_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY category_revenue DESC;
