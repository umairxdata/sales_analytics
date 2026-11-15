# Sales Analytics (MySQL)
A SQL-based sales analytics project: database design, data population and business analysis queries, built in MySQL.

## Project Overview
This project models a sales business using a relational database. It stores customers, products, orders and sales data, so that business questions such as top products, best customers and sales trends can be answered with SQL.

## Database Tables
- `regions`
- `salespersons`
- `customers`
- `categories`
- `products`
- `orders`
- `order_items`

## Tech Stack
- MySQL
- SQL (DDL, DML, joins, aggregations)

## How to Run
1. Install MySQL and open MySQL Workbench or the terminal.
2. Download `sales_analytics.sql` from this repository.
3. Run the file:
   ```
   mysql -u root -p < sales_analytics.sql
   ```
4. The `sales_analytics` database will be created with all tables and data.

## What I Learned
- Designing a relational schema with primary and foreign keys
- Writing SQL for sales analysis

## Author
**umairxdata**
