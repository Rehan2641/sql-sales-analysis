#Creating the Database
create database sales_analysis;

#use database
use sales_analysis;

#Creating the Table customers
create TABLE customers (
customer_id int primary key,
name varchar (100),
city varchar(50)

#Creating the Table products
);
CREATE TABLE products (
product_id int PRIMARY key,
product_name VARCHAR(100),
category varchar(50),
price decimal (10,2)
);
#Creating the Table orders
CREATE TABLE orders (
order_id INT PRIMARY KEY,
customer_id INT,
product_id INT,
quantity INT,
order_date DATE,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
FOREIGN KEY (product_id) REFERENCES products(product_id)
);

#To see all tables in the database
show tables;

#Dispaly the all table
SELECT * from customers;
SELECT * from orders;
SELECT * from products;

#To count total customers, orders, and products
SELECT count(*) as Total_customer from customers;
SELECT count(*) as Total_order from orders;
SELECT count(*) as Total_product from products;

#Q1: What is the total revenue generated?
-- Logic: Revenue = quantity * price for each order, then SUM of all orders
SELECT SUM(o.quantity * p.price) AS total_revenue
FROM orders as o
JOIN products as p 
ON o.product_id = p.product_id;

#Q2: Which category generates the most revenue?
-- Logic: JOIN orders with products, group by category, SUM of quantity * price
SELECT  p.category, SUM(o.quantity * p.price) AS revenue
FROM orders as o
JOIN products as p 
ON o.product_id = p.product_id
GROUP BY p.category
ORDER BY revenue DESC;

#Q3: Which are the top 5 best-selling products?
-- Logic: Group by product, SUM of quantity, show top 5
select p.product_name,sum(o.quantity) as Total
FROM orders AS o
JOIN products AS p
on o.product_id = p.product_id
GROUP BY p.product_name
order by Total DESC
limit 5;

#Q4: Which city generates the most revenue?
-- Logic: JOIN orders, customers and products, group by city
select c.city,sum(o.quantity * p.price) as Revenue
from orders as o
join customers as c
on o.customer_id = c.customer_id
join products as p
on o.product_id = p.product_id
GROUP BY c.city ORDER BY Revenue DESC;

#Q5: Who are the top 5 customers by spending?
-- Logic: JOIN orders, customers and products, group by customer, show top 5
SELECT c.customer_id, c.name, SUM(o.quantity * p.price) AS total_spent
FROM orders AS o
JOIN customers AS c
ON o.customer_id = c.customer_id
JOIN products AS p
ON o.product_id = p.product_id
GROUP BY c.customer_id, c.name
ORDER BY total_spent DESC LIMIT 5;

#Q6: How do sales change month by month?
-- Logic: Extract month from order_date, group by month, SUM of revenue
SELECT month(o.order_date) AS month, SUM(o.quantity * p.price) AS revenue
FROM orders AS o
JOIN products AS p
ON o.product_id = p.product_id
GROUP BY month(o.order_date)
order BY month;

#Q7: What is the average order value?
-- Logic: AVG of quantity * price across all orders
SELECT AVG(o.quantity * p.price) AS avg_order_value
FROM orders AS o
JOIN products AS p
ON o.product_id = p.product_id;

#Q8: Which customers have never placed an order?
-- Logic: LEFT JOIN customers with orders, keep rows with no matching order
SELECT c.customer_id, c.name
from customers AS c
LEFT join orders AS o
ON c.customer_id = o.customer_id
where o.order_id IS NULL;












