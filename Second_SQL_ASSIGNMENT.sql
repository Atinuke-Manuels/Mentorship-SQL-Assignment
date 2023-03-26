CREATE TABLE states(
State_id int Primary key,
Restaurant_state Text NOT NULL);

Select * from states;

CREATE TABLE restaurants(
Restaurant_id int Primary key,
Restaurant_name Text NOT NULL,
Restaurant_address_line1 VARCHAR NOT NULL,
State_id int NOT NULL,
Restaurant_zip_code int NOT NULL,
FOREIGN KEY (State_id) references states(State_id));

Select * from restaurants;
	
CREATE TABLE customers(
Customer_id int Primary key,
Customer_name VARCHAR (50) NOT NULL,
Customer_address VARCHAR(50) NOT NULL,
Customer_email VARCHAR(50) NOT NULL,
Restaurant_id int NOT NULL,
FOREIGN KEY (Restaurant_id) references restaurants(Restaurant_id));

Select * from customers;

CREATE TABLE items(
Item_id int Primary key,
Restaurant_id int NOT NULL,
Item_type Text NOT NULL,
Item_description Text NOT NULL,
Price numeric (5,2) NOT NULL,
FOREIGN KEY (Restaurant_id) references restaurants(Restaurant_id));

Select * from items;
	
CREATE TABLE orders(
Order_id VARCHAR (10) Primary key,
Customer_id int NOT NULL,
Order_date DATE NOT NULL,
Order_quantity int NOT NULL,
FOREIGN KEY (Customer_id) references customers(Customer_id));

Select * from orders;

CREATE TABLE credit_card(
Card_number int Primary key,
Customer_id int NOT NULL,
card_expiry_date DATE NOT NULL,
bank_name VARCHAR (20) NOT NULL,
FOREIGN KEY (Customer_id) references customers(Customer_id));

Select * from credit_card;

SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
ORDER BY table_name;