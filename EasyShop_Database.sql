CREATE TABLE Customer (
Customer_id SERIAL PRIMARY KEY,
Customer_name varchar (100),
Phone_number int,
Address varchar (100)
);	
	
CREATE TABLE Orders (
Order_id SERIAL PRIMARY KEY,
Customer_id int REFERENCES Customer(Customer_id),
Order_date date,
Order_quantity int,
Ship_date date,
Region varchar (100)
);

CREATE TABLE Products (
Product_id SERIAL PRIMARY KEY,
Order_id int REFERENCES Orders(Order_id),
Product_name varchar (100),
Description text,
Unit_price decimal (12,2),
Category varchar (100),
Department varchar (100)
);

CREATE TABLE Sales (
Sales_id SERIAL PRIMARY KEY,
Product_id int REFERENCES Products(Product_id),
Unit_price decimal (12,2),
Shipping_cost decimal (12,2),
Sales_volume decimal (12,2),
Profit decimal (12,2)
	
)

