# DATA_DIGGER
# 📊 Data Digger -- SQL Mini Project

## 📌 Project Overview

Data Digger is a beginner-friendly SQL mini project based on a
real-world E-commerce database scenario.\
This project helps in understanding core SQL concepts such as CRUD
operations, filtering, aggregation, and date-based analysis using MySQL.

This project is ideal for: - SQL Beginners - Data Analysis Students -
Internship & Interview Preparation

------------------------------------------------------------------------

## 🛠️ Tools & Technologies

-   Database: MySQL
-   Language: SQL

------------------------------------------------------------------------

## 🗂️ Database Tables

### 1️⃣ Customers Table

Stores customer information.

Columns: 
- CustomerID (Primary Key) 
- Name - Email - Address

------------------------------------------------------------------------

### 2️⃣ Orders Table

Stores order details placed by customers.

Columns: 
- OrderID (Primary Key)
- CustomerID (Foreign Key)
- OrderDate - TotalAmount

------------------------------------------------------------------------

### 3️⃣ Products Table

Stores product information.

Columns:
- ProductID (Primary Key)
- ProductName - Price - Stock

------------------------------------------------------------------------

### 4️⃣ OrderDetails Table

Stores detailed information of each order.

Columns: 
- OrderDetailID (Primary Key)
- OrderID (Foreign Key) 
- ProductID (Foreign Key)
- Quantity
- SubTotal

------------------------------------------------------------------------

## 🔑 SQL Concepts Covered

### ✅ CRUD Operations

-   INSERT -- add new records
-   SELECT -- retrieve data
-   UPDATE -- modify existing data
-   DELETE -- remove records

------------------------------------------------------------------------

### ✅ Aggregate Functions

-   COUNT() -- number of records
-   SUM() -- total quantity / revenue
-   AVG() -- average values
-   MAX() / MIN() -- highest & lowest values

Example: SELECT SUM(Quantity) AS TotalUnitsSold FROM OrderDetails WHERE
ProductID = 1;

------------------------------------------------------------------------

### ✅ Date-Based Queries

-- Today's Orders SELECT \* FROM Orders WHERE OrderDate = CURDATE();

-- Yesterday's Orders SELECT \* FROM Orders WHERE OrderDate =
CURDATE() - INTERVAL 1 DAY;

-- Last 7 Days Orders SELECT \* FROM Orders WHERE OrderDate \>=
CURDATE() - INTERVAL 7 DAY;

-- Last 30 Days Orders SELECT \* FROM Orders WHERE OrderDate \>=
CURDATE() - INTERVAL 30 DAY;

------------------------------------------------------------------------

## 📈 Business Questions Solved

-   How many times a product was sold
-   Total units sold per product
-   Highest and lowest order amount
-   Orders placed in recent days
-   Out-of-stock product detection
-   Top-selling products

------------------------------------------------------------------------

## 🎯 Learning Outcomes

After completing this project, you will be able to: - Write structured
SQL queries - Analyze sales data using SQL - Use date functions
confidently - Understand table relationships - Prepare SQL for
interviews

------------------------------------------------------------------------

## 👩‍💻 Author

Rituu Poonjani\
Aspiring Data Analyst \| SQL \| Python \| Power BI
