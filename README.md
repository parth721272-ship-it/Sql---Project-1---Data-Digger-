# 🛒 E-Commerce SQL Database Project

## 📌 Project Overview

This project is a beginner-friendly **E-Commerce Database Management System** created using **MySQL**.

The project demonstrates how to create and manage a relational database for an online store. It includes customers, orders, products, and order details.

The project focuses on fundamental SQL concepts such as:

* Database and table creation
* Inserting data
* Updating records
* Deleting records
* Filtering data
* Sorting data
* Aggregate functions
* GROUP BY
* ORDER BY
* LIMIT
* JOINs
* Foreign keys
* Primary keys

---

## 🗂️ Database Structure

The database is named:

```sql
data_digger_db
```

### 📋 Tables

#### 1. Customers

Stores customer information.

| Column     | Data Type    | Description          |
| ---------- | ------------ | -------------------- |
| CustomerID | INT          | Primary Key          |
| Name       | VARCHAR(100) | Customer name        |
| Email      | VARCHAR(100) | Unique email address |
| Address    | TEXT         | Customer address     |

---

#### 2. Orders

Stores customer order information.

| Column      | Data Type     | Description        |
| ----------- | ------------- | ------------------ |
| OrderID     | INT           | Primary Key        |
| CustomerID  | INT           | Foreign Key        |
| OrderDate   | DATE          | Date of order      |
| TotalAmount | DECIMAL(10,2) | Total order amount |

---

#### 3. Products

Stores product information.

| Column      | Data Type     | Description     |
| ----------- | ------------- | --------------- |
| ProductID   | INT           | Primary Key     |
| ProductName | VARCHAR(100)  | Product name    |
| Price       | DECIMAL(10,2) | Product price   |
| Stock       | INT           | Available stock |

---

#### 4. OrderDetails

Stores the products included in each order.

| Column        | Data Type     | Description      |
| ------------- | ------------- | ---------------- |
| OrderDetailID | INT           | Primary Key      |
| OrderID       | INT           | Foreign Key      |
| ProductID     | INT           | Foreign Key      |
| Quantity      | INT           | Quantity ordered |
| SubTotal      | DECIMAL(10,2) | Product subtotal |

---

## 🔗 Database Relationships

```text
Customers
    │
    │ 1
    │
    │ Many
  Orders
    │
    │ 1
    │
    │ Many
OrderDetails
    │
    │ Many
    │
    │ 1
 Products
```

### Relationships

* One customer can place many orders.
* One order can contain many products.
* One product can appear in many order details.
* `CustomerID` connects `Customers` and `Orders`.
* `OrderID` connects `Orders` and `OrderDetails`.
* `ProductID` connects `Products` and `OrderDetails`.

---

## 🛠️ SQL Concepts Used

### ✅ Database Management

```sql
DROP DATABASE IF EXISTS data_digger_db;
CREATE DATABASE data_digger_db;
USE data_digger_db;
```

### ✅ Table Creation

Created tables using:

```sql
CREATE TABLE
```

### ✅ Insert Data

Inserted sample customers, orders, products, and order details using:

```sql
INSERT INTO
```

### ✅ Update Data

Updated customer addresses, order amounts, and product prices using:

```sql
UPDATE
```

### ✅ Delete Data

Deleted customers and orders using:

```sql
DELETE
```

### ✅ Filtering Data

Used:

```sql
WHERE
BETWEEN
```

### ✅ Sorting Data

Used:

```sql
ORDER BY
```

### ✅ Aggregate Functions

Used:

```sql
MAX()
MIN()
AVG()
SUM()
COUNT()
```

### ✅ Grouping Data

Used:

```sql
GROUP BY
```

### ✅ Limiting Results

Used:

```sql
LIMIT
```

### ✅ Relationships

Used:

```sql
PRIMARY KEY
FOREIGN KEY
```

---

## 📊 Business Questions Answered

This project answers important business questions such as:

### 1. What are all the customers?

```sql
SELECT *
FROM Customers;
```

### 2. What orders were placed by a specific customer?

```sql
SELECT *
FROM Orders
WHERE CustomerID = 2;
```

### 3. What is the highest, lowest, and average order amount?

```sql
SELECT
    MAX(TotalAmount) AS Highest,
    MIN(TotalAmount) AS Lowest,
    AVG(TotalAmount) AS Average
FROM Orders;
```

### 4. What are the most expensive and cheapest products?

```sql
SELECT
    MAX(Price) AS MostExpensive,
    MIN(Price) AS Cheapest
FROM Products;
```

### 5. What is the total revenue generated?

```sql
SELECT
    SUM(SubTotal) AS TotalRevenue
FROM OrderDetails;
```

### 6. What are the top 3 most ordered products?

```sql
SELECT
    ProductID,
    SUM(Quantity) AS TotalQuantity
FROM OrderDetails
GROUP BY ProductID
ORDER BY TotalQuantity DESC
LIMIT 3;
```

### 7. How many times was a specific product sold?

```sql
SELECT
    COUNT(*) AS SalesCount
FROM OrderDetails
WHERE ProductID = 1;
```

---

## 🚀 How to Run This Project

### Step 1: Install MySQL

Install MySQL Server and MySQL Workbench.

### Step 2: Open MySQL Workbench

Connect to your MySQL server.

### Step 3: Open the SQL File

Open the project `.sql` file.

### Step 4: Execute the Script

Run the complete SQL script.

The script will:

1. Create the database.
2. Create all tables.
3. Insert sample data.
4. Update records.
5. Delete records.
6. Run analytical queries.

---

## 📁 Project Structure

```text
E-Commerce-SQL-Database/
│
├── ecommerce_database.sql
│
└── README.md
```

---

## 🎯 Project Objectives

The main objectives of this project are:

* To understand relational databases.
* To practice SQL queries.
* To understand primary keys and foreign keys.
* To perform CRUD operations.
* To analyse customer and order data.
* To calculate revenue and sales metrics.
* To practise database relationships.

---

## 🔮 Future Improvements

The project can be improved by adding:

* Customer-wise revenue analysis.
* Monthly sales analysis.
* Best-selling products.
* Customers with no orders.
* Product stock analysis.
* Views.
* Stored procedures.
* Triggers.
* Indexes.
* Advanced JOIN queries.
* SQL dashboards using Tableau or Power BI.

---

## 👨‍💻 Author

**Partth Patel**

Aspiring Data Analyst | SQL | Python | Tableau

---

## ⭐ Conclusion

This project demonstrates the basic implementation of an e-commerce database using MySQL.

It provides practical experience with database design, data manipulation, relationships, and SQL-based data analysis.

This project is suitable for beginners who are learning **SQL and Data Analytics**.
