CREATE TABLE departments(
department_id int primary key,
department text Not Null);

CREATE TABLE aisles (
aisle_id int primary key,
aisle text Not Null);

CREATE TABLE products (
product_id int primary key,
product_name varchar (255) Not Null,
department_id int references departments (department_id) on delete CASCADE,
aisle_id int references aisles (aisle_id) on delete CASCADE);

CREATE TABLE orders (
order_id int primary key,
user_id int Not Null,
order_dow int Not Null,
order_hour_of_day int Not Null,
days_since_prior_order int,
product_id int references products (product_id) on delete CASCADE,
aisle_id int references aisles (aisle_id) on delete CASCADE,
department_id int references departments (department_id) on delete CASCADE);

select * from products

--on which day/s of the week are Condoms mostly sold?
select p.product_name,count(o.order_dow) as count_of_days,o.order_dow,
CASE
when o.order_dow = 0 then 'Sunday'
when o.order_dow = 1 then 'Monday'
when o.order_dow = 2 then 'Tuesday'
when o.order_dow = 3 then 'Wednesday'
when o.order_dow = 4 then 'Thursday'
when o.order_dow = 5 then 'Friday'
else 'Saturday' end as day_of_week
from products p
left join orders o 
ON o.product_id = p.product_id
where product_name like '%Condom%'
group by p.product_name,o.order_dow
order by count_of_days DESC
limit 3

--At what time of the day is it most sold?
select p.product_name,o.order_hour_of_day,count(o.order_hour_of_day) as count_of_hour 
from products p
left join orders o 
ON o.product_id = p.product_id
where product_name like '%Condom%'
group by p.product_name,o.order_hour_of_day
order by count_of_hour DESC
limit 3

--what type of condom do the customers prefer?
select p.product_name,count(o.product_id) as type_preferred_count
from products p
left join orders o
ON o.product_id = p.product_id
where product_name like '%Condom%'
group by product_name
order by type_preferred_count desc 
limit 1

--which aisle contains most of the organic products?
select a.aisle,count(p.product_name) organic_product_count
from aisles a
left join products p 
ON a.aisle_id = p.aisle_id
where product_name like'%Organic%'
group by a.aisle
order by organic_product_count desc
limit 1

--which aisle/s can i find all the non alcoholic drink
select a.aisle,count(p.product_name) non_alcoholic_count
from aisles a
left join products p 
ON a.aisle_id = p.aisle_id
where product_name like'%Non Alcoholic%'
group by a.aisle
order by non_alcoholic_count desc
limit 3
