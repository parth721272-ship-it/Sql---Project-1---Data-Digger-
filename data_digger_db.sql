DROP DATABASE IF EXISTS data_digger_db;

CREATE DATABASE data_digger_db;

USE data_digger_db;

-- Creating Customers Table
CREATE TABLE
    Customers (
        CustomerID INT PRIMARY KEY AUTO_INCREMENT,
        Name VARCHAR(100) NOT NULL,
        Email VARCHAR(100) UNIQUE,
        Address TEXT
    );

-- Inserting 5 sample customers
INSERT INTO
    Customers (Name, Email, Address)
VALUES
    ('Alice Smith', 'alice@email.com', '123 Maple St'),
    ('Bob Johnson', 'bob@email.com', '456 Oak Ave'),
    (
        'Charlie Brown',
        'charlie@email.com',
        '789 Pine Rd'
    ),
    ('Dana White', 'dana@email.com', '101 Cedar Ln'),
    ('Eve Davis', 'eve@email.com', '202 Birch Blvd');

-- Retrieving all customer details
SELECT
    *
FROM
    Customers;

-- Updating a customer's address (e.g., Bob's address)
UPDATE Customers
SET
    Address = '457 Oak Ave'
WHERE
    CustomerID = 2;

-- Deleting a customer whose name is 'Alice'
DELETE FROM Customers
WHERE
    Name = 'Alice Smith';

-- Displaying all customers whose name is 'Alice' (should be none after delete)
SELECT
    *
FROM
    Customers
WHERE
    Name = 'Alice';

-- Creating Orders Table
CREATE TABLE
    Orders (
        OrderID INT PRIMARY KEY AUTO_INCREMENT,
        CustomerID INT,
        OrderDate DATE,
        TotalAmount DECIMAL(10, 2),
        FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID)
    );

-- Inserting 5 sample orders
INSERT INTO
    Orders (CustomerID, OrderDate, TotalAmount)
VALUES
    (2, '2025-09-01', 150.00),
    (3, '2025-09-10', 300.50),
    (4, '2025-09-15', 450.75),
    (5, '2025-09-20', 200.25),
    (2, '2025-09-22', 175.00);

-- Retrieving all orders made by a specific customer (e.g., CustomerID 2)
SELECT
    *
FROM
    Orders
WHERE
    CustomerID = 2;

-- Updating an order's total amount (e.g., OrderID 1)
UPDATE Orders
SET
    TotalAmount = 175.00
WHERE
    OrderID = 1;

-- Deleting an order using its OrderID (e.g., OrderID 2)
DELETE FROM Orders
WHERE
    OrderID = 2;

-- Retrieving orders placed in the last 30 days
SELECT
    *
FROM
    Orders
WHERE
    OrderDate >= DATE_SUB (CURDATE (), INTERVAL 30 DAY);

-- Retrieving the highest, lowest, and average order amount
SELECT
    MAX(TotalAmount) as Highest,
    MIN(TotalAmount) as Lowest,
    AVG(TotalAmount) as Average
FROM
    Orders;

-- Creating Products Table
CREATE TABLE
    Products (
        ProductID INT PRIMARY KEY AUTO_INCREMENT,
        ProductName VARCHAR(100) NOT NULL,
        Price DECIMAL(10, 2),
        Stock INT
    );

-- Inserting 5 sample products
INSERT INTO
    Products (ProductName, Price, Stock)
VALUES
    ('Laptop', 1200.00, 10),
    ('Mouse', 25.00, 50),
    ('Keyboard', 80.00, 30),
    ('Monitor', 300.00, 15),
    ('Headphones', 90.00, 20);

-- Retrieving all products sorted by price in descending order
SELECT
    *
FROM
    Products
ORDER BY
    Price DESC;

-- Updating the price of a specific product (e.g., Mouse)
UPDATE Products
SET
    Price = 30.00
WHERE
    ProductID = 2;

-- Retrieving products whose price is between ₹500 and ₹2000
SELECT
    *
FROM
    Products
WHERE
    Price BETWEEN 500 AND 2000;

-- Retrieving the most expensive and cheapest product
SELECT
    MAX(Price) as MostExpensive,
    MIN(Price) as Cheapest
FROM
    Products;

-- Creating OrderDetails Table
CREATE TABLE
    OrderDetails (
        OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
        OrderID INT,
        ProductID INT,
        Quantity INT,
        SubTotal DECIMAL(10, 2),
        FOREIGN KEY (OrderID) REFERENCES Orders (OrderID),
        FOREIGN KEY (ProductID) REFERENCES Products (ProductID)
    );

-- Inserting 5 sample records into OrderDetails
INSERT INTO
    OrderDetails (OrderID, ProductID, Quantity, SubTotal)
VALUES
    (1, 1, 1, 175.00),
    (3, 2, 2, 60.00),
    (4, 3, 1, 80.00),
    (5, 4, 1, 300.00),
    (1, 5, 1, 90.00);

-- Retrieving all order details for a specific order (e.g., OrderID 1)
SELECT
    *
FROM
    OrderDetails
WHERE
    OrderID = 1;

-- Calculating total revenue generated from all orders
SELECT
    SUM(SubTotal) as TotalRevenue
FROM
    OrderDetails;

-- Retrieving the top 3 most ordered products
SELECT
    ProductID,
    SUM(Quantity) as TotalQuantity
FROM
    OrderDetails
GROUP BY
    ProductID
ORDER BY
    TotalQuantity DESC
LIMIT
    3;

-- Counting how many times a specific product has been sold (e.g., ProductID 1)
SELECT
    COUNT(*) as SalesCount
FROM
    OrderDetails
WHERE
    ProductID = 1;