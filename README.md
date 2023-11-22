# gittest]
Overview
The EasyShop database is designed to manage and organize data for an ecommerce platform. 
It serves as the backbone for storing information about products, customers, orders, and more. 
This readme provides an overview of the database structure, how to interact with it, perform queries, and update data.

Database Structure
The Ecommerce Database consists of several key tables:

Products: Contains information about the products available for sale, including product ID, name, description, price, and category.

Customer: Stores customer details, such as customer ID, name, phone number, and address.

Orders: Tracks information about individual orders, including order ID, customer ID, order date, and order_quantityt.

Sales: Tracks sales details about sales volume, unit prices, shipping cost and profit.

How to Use

Querying Data
To retrieve information from the database, you can use SQL queries. Here are some example queries:

--Retrieve all products:
sql
SELECT * FROM Products;

--Find a specific product by name:
sql
SELECT * FROM Products WHERE Name = 'Product Name';


--Get all orders for a specific customer:
sql
SELECT * FROM Orders WHERE CustomerID = 'customer_id';


--View order details for a specific order:
sql
SELECT * FROM OrderDetails WHERE OrderID = 'order_id';


Updating Data

To update data in the database, use SQL's UPDATE statement. Here are some examples:

--Update product quantity:
sql
UPDATE Products SET Quantity = 20 WHERE ProductID = 'product_id';


--Change customer address:
sql
UPDATE Customers SET Address = 'New Address' WHERE CustomerID = 'customer_id';


--Mark an order as shipped:
sql
UPDATE Orders SET Shipped = 1 WHERE OrderID = 'order_id';

Adding Data

To add new data to the database, use SQL's INSERT INTO statement:

--Add a new product:
sql
INSERT INTO Products (Name, Description, Price, Quantity) VALUES ('New Product', 'Description', 29.99, 50);

--Create a new customer:
sql
INSERT INTO Customers (Name, Email, Address) VALUES ('John Doe', 'john@example.com', '123 Main St');


--Place a new order:
sql
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES ('customer_id', '2023-01-01', 150.00);








