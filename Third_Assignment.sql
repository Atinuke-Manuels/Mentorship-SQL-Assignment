Select * from products;

--1a. Max price and item
Select product_name, unit_price
from products
where unit_price = (select max(unit_price) from products);

--1b. Min price and item
Select product_name, unit_price
from products
where unit_price = (select min(unit_price) from products);

select * from orders;
--2. Count of orders in 2022 by month
SELECT DATE_TRUNC('month', DATE(order_date)) AS Order_month,
       COUNT(order_id) AS count
       FROM orders
       WHERE order_date >= '2022-01-01' AND order_date <= '2022-12-31'
       GROUP BY DATE_TRUNC('month', DATE(order_date));


Select * from products;
--3. AVG unit_price and Unit_cost for each product category
SELECT product_category,
       ROUND(AVG(unit_price), 2) as AVG_UNIT_PRICE,
	   ROUND(AVG(Unit_cost), 2)  as AVG_UNIT_COST
	   FROM products
	   GROUP BY product_category;


Select * from orders;
--4.All orders placed on or after August 1, 2022
SELECT *
       FROM orders
       WHERE order_date >= '2022-08-01'
       ORDER BY order_date;


Select * from payments;
-- 5. All payments made on April 14, 2023
SELECT *
       FROM payments
	   WHERE payment_date = '2023-04-14';
	   
	   
Select * from orders;
-- 6. Customer_id with the highest order on the orders table
SELECT customer_id, COUNT(*) as total
       FROM orders
	   GROUP BY customer_id
	   ORDER BY total DESC
	   Limit 1;
	   
	   
-- 7. Total number of orders by each customer_id
SELECT customer_id, COUNT(*) as total
       FROM orders
	   GROUP BY customer_id
	   ORDER BY total DESC;
	  
--8. Total orders between Jan and Feb 2023
SELECT COUNT(*)
	   FROM orders
	   WHERE order_date BETWEEN '2023-01-01' AND '2023-02-28'
	   AND delivery_status = 'Delivered';