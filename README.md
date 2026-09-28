# Order Management System

## Project Description

This project is an **Order Management System** for an e-commerce company.

It manages:

* Customers
* Products
* Orders
* Order Details
* Customer order reports

## Database

**Database Name:** `order_management`

## Tables

### 1. Customer

Stores customer information.

* Customer_ID
* Customer_Name

### 2. Product

Stores product information.

* Product_ID
* Product_Name
* Price
* Stock

### 3. Orders

Stores overall order information.

* Order_ID
* Customer_ID
* Order_Date
* Total_Amount
* Order_Status

### 4. Order_Details

Stores products included in each order.

* Order_Detail_ID
* Order_ID
* Product_ID
* Quantity
* Price

## Relationships

* One Customer can have many Orders.
* One Order can contain many Products.
* Order_Details connects Orders and Products.

## Operations

The project performs:

1. Create tables
2. Insert customer and product data
3. Create orders
4. Add products to orders
5. Update order status
6. Update product quantity
7. Delete order details
8. Generate order reports

## Reports

The project generates:

* Customer Order History
* Product-wise Order Report
* Customer Purchase Analysis
* Customer with Maximum Orders
* Total Sales

## Tools Used

* MySQL
* MySQL Workbench
* SQL

## How to Run

1. Open **MySQL Workbench**.
2. Create a new SQL tab.
3. Run **Part 1** first.
4. Run **Part 2**.
5. Run **Part 3**.
6. Run **Part 4**.
7. Check the output of each report.

## Conclusion

The Order Management System helps manage customer orders, products, quantities, payments/amounts, order status, and customer purchase reports using SQL.
