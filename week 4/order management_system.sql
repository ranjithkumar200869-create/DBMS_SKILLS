CREATE DATABASE order_management;
USE order_management;

CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY AUTO_INCREMENT,
    Customer_Name VARCHAR(100) NOT NULL
);
CREATE TABLE Product (
    Product_ID INT PRIMARY KEY AUTO_INCREMENT,
    Product_Name VARCHAR(100) NOT NULL,
    Price DECIMAL(10,2) NOT NULL CHECK (Price >= 0),
    Stock INT NOT NULL CHECK (Stock >= 0)
);
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT NOT NULL,
    Order_Date DATE NOT NULL,
    Total_Amount DECIMAL(10,2) NOT NULL CHECK (Total_Amount >= 0),
    Order_Status VARCHAR(20) NOT NULL
        CHECK (Order_Status IN ('Pending','Shipped','Delivered')),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);
CREATE TABLE Order_Details (
    Order_Detail_ID INT PRIMARY KEY AUTO_INCREMENT,
    Order_ID INT NOT NULL,
    Product_ID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    Price DECIMAL(10,2) NOT NULL CHECK (Price >= 0),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);
INSERT INTO Customer (Customer_Name) VALUES
('Rahul'),
('Arun'),
('Priya');

INSERT INTO Product (Product_Name, Price, Stock) VALUES
('Laptop', 50000.00, 10),
('Mouse', 800.00, 25),
('Mobile Phone', 25000.00, 15),
('Keyboard', 1500.00, 20);

INSERT INTO Orders
(Order_ID, Customer_ID, Order_Date, Total_Amount, Order_Status)
VALUES
(5001, 1, '2026-09-28', 51600.00, 'Pending'),
(5002, 2, '2026-09-28', 25000.00, 'Shipped'),
(5003, 3, '2026-09-28', 1500.00, 'Delivered');

INSERT INTO Order_Details
(Order_ID, Product_ID, Quantity, Price)
VALUES
(5001, 1, 1, 50000.00),
(5001, 2, 2, 800.00),
(5002, 3, 1, 25000.00),
(5003, 4, 1, 1500.00);
-- Change order status
UPDATE Orders
SET Order_Status = 'Delivered'
WHERE Order_ID = 5001;

-- Update product quantity
UPDATE Order_Details
SET Quantity = 3
WHERE Order_Detail_ID = 2;

-- Delete an order detail
DELETE FROM Order_Details
WHERE Order_Detail_ID = 4;
USE order_management;

SELECT
    c.Customer_Name,
    o.Order_ID,
    o.Order_Date,
    o.Total_Amount,
    o.Order_Status
FROM Customer c
JOIN Orders o
ON c.Customer_ID = o.Customer_ID;

SELECT
    p.Product_Name,
    COUNT(od.Order_ID) AS Number_of_Times_Ordered,
    SUM(od.Quantity) AS Total_Quantity_Sold
FROM Product p
JOIN Order_Details od
ON p.Product_ID = od.Product_ID
GROUP BY p.Product_ID, p.Product_Name;

SELECT
    c.Customer_Name,
    COUNT(o.Order_ID) AS Total_Orders,
    SUM(o.Total_Amount) AS Total_Spending,
    AVG(o.Total_Amount) AS Average_Order_Value
FROM Customer c
JOIN Orders o
ON c.Customer_ID = o.Customer_ID
GROUP BY c.Customer_ID, c.Customer_Name;

SELECT
    c.Customer_Name,
    COUNT(o.Order_ID) AS Total_Orders
FROM Customer c
JOIN Orders o
ON c.Customer_ID = o.Customer_ID
GROUP BY c.Customer_ID, c.Customer_Name
ORDER BY Total_Orders DESC
LIMIT 1;

SELECT
    SUM(Total_Amount) AS Total_Sales
FROM Orders;