--Select all records
Select * from customers;

-- customers with id > 20
SELECT count(*)
FROM customers
WHERE customer_id > 20;

-- customers with names starting with C
SELECT count(*) 
FROM customers
WHERE customer_name like 'C%';

--All records from the products table
Select *
From products;

--count of product_name by category
Select product_category, Count(product_name)
from products
group by product_category;

--Sum unit price for all family and economy
Select product_category, sum(unit_price)
from products
where product_category in ('Family', 'Economy')
group by product_category;

SELECT product_category, SUM(unit_price) as total,
MIN(unit_price), floor(AVG(unit_price))
FROM products
GROUP BY product_category;

SELECT product_category, SUM(unit_price) as total,
MIN(unit_price), Ceiling(AVG(unit_price))
FROM products
GROUP BY product_category;

SELECT product_category, SUM(unit_price) as total,
MIN(unit_price), Round(AVG(unit_price),2)
FROM products
GROUP BY product_category;