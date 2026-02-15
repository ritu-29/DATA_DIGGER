CREATE DATABASE DATA_DIGGER;
USE DATA_DIGGER;

-- -------CREATE CUSTOMERS TABLE---------- 
CREATE TABLE CUSTOMERS (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(25),
    Email VARCHAR(50),
    Address VARCHAR(50)
);

INSERT INTO CUSTOMERS (CustomerID, Name, Email, Address) VALUES
(1, 'Alice', 'alice@gmail.com', 'Ahmedabad'),
(2, 'RITU', 'rit@gmail.com', 'Surat'),
(3, 'BHARTI', 'bhar@gmail.com', 'Vadodara'),
(4, 'MONI', 'moni@gmail.com', 'Rajkot'),
(5, 'PRIYA', 'pri@gmail.com', 'Delhi');

-- Retrieve all customers..
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

-- -------CREATE ORDERS TABLE---------- 
CREATE TABLE ORDERS (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO ORDERS VALUES
(101, 1, '2026-01-10', 2500),
(102, 2, '2026-01-15', 1800),
(103, 1, '2026-02-01', 3200),
(104, 3, '2026-02-05', 1500),
(105, 4, '2026-02-10', 4500);

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

-- ---------CREATE PRODUCTS TABLE------------ 
CREATE TABLE PRODUCTS (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10,2),
    Stock INT
);

INSERT INTO PRODUCTS VALUES
(1, 'Mobile', 15000, 10),
(2, 'Headphones', 2000, 0),
(3, 'Keyboard', 1200, 15),
(4, 'Mouse', 700, 20),
(5, 'Monitor', 8000, 5);

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
SELECT MAX(Price) AS MaxPrice, MIN(Price) AS MinPrice FROM PRODUCTS;


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

INSERT INTO ORDERDETAILS VALUES
(1, 101, 1, 1, 15000),
(2, 101, 4, 2, 1400),
(3, 102, 3, 1, 1200),
(4, 103, 5, 1, 8000),
(5, 105, 1, 2, 30000);

-- Order details for a specific order
SELECT * FROM ORDERDETAILS
WHERE OrderID = 101;

-- Total revenue from all orders
SELECT SUM(SubTotal) AS TotalRevenue
FROM ORDERDETAILS;

-- Top 3 most ordered products
SELECT ProductID, SUM(Quantity) AS TotalQuantity
FROM ORDERDETAILS
GROUP BY ProductID
ORDER BY TotalQuantity DESC
LIMIT 3;

-- Count how many times a specific product was sold
SELECT COUNT(*) AS T_Sold
FROM ORDERDETAILS
WHERE ProductID = 3;







