create table customers(
customer_id SERIAL PRIMARY KEY, 
customer_name varchar(100) NOT NULL, 
customer_surname varchar(100) NOT NULL,
email varchar(150) NOT NULL UNIQUE,
city varchar(100) , 
country varchar(100) , 
registration_date date NOT NULL ); 

CREATE TABLE categories ( 
category_id SERIAL PRIMARY KEY, 
category_name varchar(100) NOT NULL );

create table products(
product_id SERIAL PRIMARY KEY, 
category_id int NOT NULL,
product_name varchar(100 ) NOT NULL,
purchase_price DECIMAL(10,2) NOT NULL,
sale_price DECIMAL(10,2) NOT NULL, 
stock int NOT NULL ); 

CREATE TABLE orders ( 
order_id SERIAL PRIMARY KEY,
customer_id int NOT NULL,
order_date date NOT NULL,
shipping_company varchar(100) NOT NULL,
status varchar(50) );

CREATE TABLE order_details ( 
order_detail_id SERIAL PRIMARY KEY, 
order_id int NOT NULL, 
product_id int NOT NULL, 
quantity int NOT NULL,
unit_price DECIMAL(10,2) NOT NULL, 
discount DECIMAL(10,2) DEFAULT 0 ); 

ALTER TABLE order_details 
ADD CONSTRAINT fk_order_detail_product
FOREIGN KEY (product_id) REFERENCES products(product_id);

ALTER TABLE order_details 
ADD CONSTRAINT fk_order_detail_order
FOREIGN KEY (order_id) REFERENCES orders(order_id);

ALTER TABLE orders
ADD CONSTRAINT fk_orders_customer
FOREIGN KEY (customer_id) 
REFERENCES customers(customer_id); 

ALTER TABLE products 
ADD CONSTRAINT fk_product_category 
FOREIGN KEY (category_id)
REFERENCES categories(category_id);