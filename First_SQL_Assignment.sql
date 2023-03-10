create table Customer (customer_id int primary key,
					  customer_name varchar(100), email varchar (50), 
					  phone varchar(25));
					  
select * from customer;

create type pcategory as enum ('high', 'medium', 'low');

create table Product (product_id int primary key, 
					  product_name varchar(50), description varchar (50),
					  product_category pcategory, 
					  unit_price decimal(10,2));
					  
select * from product;

create type dstatus as enum ('delivered', 'not delivered');
create table Orders (order_id int primary key, 
					customer_id int, 
					order_date date, 
					product_id int,
					quantity int , delivery_status dstatus,
					foreign key(customer_id) references customer(customer_id),
					foreign key(product_id) references product(product_id));
					
select * from orders;
					
create table Payment (payment_id int primary key, 
					  order_id int, payment_date date,
					 foreign key (order_id) references Orders(order_id));
					 
select * from payment;