-- -------CREATE DATABASE------------  
CREATE DATABASE DATA_DIGGER_DB;

--  --------USE DATABASE-----------
USE DATA_DIGGER_DB;

-- -------CREATE CUSTOMERS TABLE---------- 
CREATE TABLE CUSTOMERS (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(25),
    Email VARCHAR(50) UNIQUE,
    Address VARCHAR(50)
);

-- INSERT VALUES
INSERT INTO CUSTOMERS (CustomerID, Name, Email, Address) VALUES
(1, 'Alice', 'alice@gmail.com', 'Ahmedabad'),
(2, 'Ritu', 'ritu@gmail.com', 'Surat'),
(3, 'Pooja', 'pooja@gmail.com', 'Vadodara'),
(4, 'Moni', 'moni@gmail.com', 'Rajkot'),
(5, 'Priya', 'pri@gmail.com', 'Delhi');


-- -------CREATE ORDERS TABLE---------- 
CREATE TABLE ORDERS (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- INSERT VALUES
INSERT INTO ORDERS (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(101, 1, '2026-01-10', 2500),
(102, 2, '2026-01-15', 1800),
(103, 1, '2026-02-01', 3200),
(104, 3, '2026-02-05', 1500),
(105, 4, '2026-02-10', 4500);

-- ---------CREATE PRODUCTS TABLE------------ 
CREATE TABLE PRODUCTS (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10,2),
    Stock INT
);

-- INSERT VALUES
INSERT INTO PRODUCTS (ProductID, ProductName, Price, Stock) VALUES
(1, 'Mobile', 15000, 10),
(2, 'Headphones', 2000, 0),
(3, 'Keyboard', 1200, 15),
(4, 'Mouse', 700, 20),
(5, 'Monitor', 8000, 5);

-- --------- CREATE ORDERDETAILS TABLE------------
CREATE TABLE ORDERDETAILS (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    SubTotal DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES ORDERS(OrderID),
    FOREIGN KEY (ProductID) REFERENCES PRODUCTS(ProductID)
);

-- INSERT VALUES
INSERT INTO ORDERDETAILS (OrderDetailID, OrderID, ProductID, Quantity, SubTotal) VALUES
(1, 101, 1, 1, 15000),
(2, 101, 4, 2, 1400),
(3, 102, 3, 1, 1200),
(4, 103, 5, 1, 8000),
(5, 105, 1, 2, 30000);

-- Retrieve all customers details..
SELECT * FROM CUSTOMERS;

-- Update customer address..
UPDATE CUSTOMERS
SET Address = 'Navsari'
WHERE CustomerID = 3;

-- Delete a customer..
DELETE FROM CUSTOMERS
WHERE CustomerID = 5;

-- Display customers named 'Alice'
SELECT * FROM CUSTOMERS
WHERE Name = 'Alice';

-- Orders by specific customer
SELECT * FROM Orders
WHERE CustomerID = 1;

-- Update order amount
UPDATE Orders
SET TotalAmount = 3500
WHERE OrderID = 103;

-- Delete order
DELETE FROM Orders
WHERE OrderID = 104;

-- Orders placed in last 30 days
SELECT * FROM Orders
WHERE OrderDate >= CURDATE() - INTERVAL 30 DAY;

-- Highest, lowest, average order amount
SELECT MAX(TotalAmount) AS Highest, MIN(TotalAmount) AS Lowest, AVG(TotalAmount) AS Average FROM Orders;

-- Products sorted by price (descending)
SELECT * FROM PRODUCTS
ORDER BY Price DESC;

-- Update product price
UPDATE PRODUCTS
SET Price = 1800
WHERE ProductID = 2;

-- Delete product out of stock
DELETE FROM PRODUCTS
WHERE Stock = 0 AND ProductID > 0;

-- Products priced between ₹500 and ₹2000
SELECT * FROM PRODUCTS
WHERE Price BETWEEN 500 AND 2000;

-- Most expensive and cheapest product
SELECT MAX(Price) AS Expensive_price, MIN(Price) AS cheapest_price FROM PRODUCTS;

-- Order details for a specific order
SELECT * FROM ORDERDETAILS
WHERE OrderID = 101;

-- Total revenue from all orders
SELECT SUM(SubTotal) AS TotalRevenue
FROM ORDERDETAILS;

-- Retrieve Top 3 most ordered products
SELECT ProductID, SUM(Quantity) AS TotalQuantity
FROM ORDERDETAILS
GROUP BY ProductID
ORDER BY TotalQuantity DESC
LIMIT 3;

-- Count how many times a specific product was sold
SELECT ProductID, COUNT(*) AS SoldTime
FROM ORDERDETAILS
WHERE ProductID = 3
GROUP BY ProductID;


