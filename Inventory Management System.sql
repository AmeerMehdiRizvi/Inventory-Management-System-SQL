Create Database Inventory_Management_System;
Use Inventory_Management_System;
Create Table Items(
Item_ID Int Primary Key Auto_increment,
Item_Name Varchar(100),
Category Varchar(100),
Purchase_Price Decimal(10,2),
Selling_Price Decimal (10,2),
Stock_Quantity Int
);

Create Table Suppliers(
Supplier_ID Int Primary Key Auto_Increment,
Supplier_Name Varchar(100),
Phone Varchar(100),
City Varchar(100)
);

Create Table Purchases(
Purchase_ID Int Primary Key Auto_Increment,
Item_ID Int,
Supplier_ID Int,
Quantity Int,
Purchase_Date Date,
Foreign Key (Item_ID) References Items(Item_ID),
Foreign Key (Supplier_ID) References Suppliers(Supplier_ID)
);

Create Table Sales(
Sale_ID Int Primary Key Auto_Increment,
Item_ID Int,
Quantity Int,
Sale_Date Date,
Foreign Key (Item_ID) References Items(Item_ID)
);

Insert Into Items (Item_Name, Category, Purchase_Price, Selling_Price, Stock_Quantity) Values
('Notebook', 'Stationery', 20.00, 30.00, 100),
('Pen', 'Stationery', 5.00, 10.00, 200),
('Pencil', 'Stationery', 3.00, 7.00, 150),
('Eraser', 'Stationery', 2.00, 5.00, 120),
('Sharpener', 'Stationery', 4.00, 8.00, 90),
('Laptop', 'Electronics', 30000.00, 35000.00, 10),
('Mouse', 'Electronics', 300.00, 500.00, 50),
('Keyboard', 'Electronics', 700.00, 1200.00, 40),
('Monitor', 'Electronics', 5000.00, 6500.00, 20),
('USB Cable', 'Electronics', 100.00, 200.00, 80),
('Chair', 'Furniture', 1500.00, 2200.00, 25),
('Table', 'Furniture', 2500.00, 3500.00, 15),
('Sofa', 'Furniture', 8000.00, 10000.00, 8),
('Bed', 'Furniture', 10000.00, 13000.00, 5),
('Water Bottle', 'Household', 50.00, 100.00, 60),
('Plate Set', 'Household', 500.00, 800.00, 30),
('Fan', 'Electronics', 1200.00, 1800.00, 18),
('Bulb', 'Electronics', 40.00, 80.00, 100),
('Bag', 'Accessories', 300.00, 600.00, 70),
('Shoes', 'Accessories', 800.00, 1200.00, 45);

Insert Into Suppliers (Supplier_Name, Phone, City) Values
('ABC Traders', '9876543210', 'Delhi'),
('XYZ Supplies', '9876501234', 'Mumbai'),
('Global Exports', '9123456780', 'Kolkata'),
('Royal Distributors', '9988776655', 'Chennai'),
('Fresh Stock Co.', '9012345678', 'Bangalore'),
('Prime Traders', '9090909090', 'Hyderabad'),
('City Mart', '8888888888', 'Pune'),
('Super Supply', '7777777777', 'Ahmedabad'),
('Elite Goods', '6666666666', 'Jaipur'),
('Quick Supply', '9555512345', 'Lucknow'),
('North Traders', '9456123789', 'Chandigarh'),
('South Exports', '9345612789', 'Coimbatore'),
('Metro Supplies', '9234567890', 'Delhi'),
('Royal Goods', '9123987654', 'Mumbai'),
('Prime Exporters', '9011223344', 'Kolkata'),
('Smart Traders', '9000112233', 'Bangalore'),
('Mega Supply Co.', '9112233445', 'Hyderabad'),
('Urban Supplies', '9223344556', 'Pune'),
('Best Traders', '9334455667', 'Jaipur'),
('Quality Goods', '9445566778', 'Lucknow');

Insert Into Purchases (Item_ID, Supplier_ID, Quantity, Purchase_Date) Values
(1, 1, 50, '2026-06-01'),
(2, 2, 100, '2026-06-02'),
(3, 3, 80, '2026-06-03'),
(4, 4, 60, '2026-06-04'),
(5, 5, 40, '2026-06-05'),
(6, 6, 2, '2026-06-06'),
(7, 7, 20, '2026-06-07'),
(8, 8, 15, '2026-06-08'),
(9, 9, 10, '2026-06-09'),
(10, 10, 30, '2026-06-10'),
(11, 11, 10, '2026-06-11'),
(12, 12, 5, '2026-06-12'),
(13, 13, 3, '2026-06-13'),
(14, 14, 2, '2026-06-14'),
(15, 15, 25, '2026-06-15'),
(16, 16, 12, '2026-06-16'),
(17, 17, 8, '2026-06-17'),
(18, 18, 50, '2026-06-18'),
(19, 19, 35, '2026-06-19'),
(20, 20, 20, '2026-06-20');

Insert Into Sales (Item_ID, Quantity, Sale_Date) Values
(1, 10, '2026-06-01'),
(2, 20, '2026-06-02'),
(3, 15, '2026-06-03'),
(4, 10, '2026-06-04'),
(5, 8, '2026-06-05'),
(6, 1, '2026-06-06'),
(7, 5, '2026-06-07'),
(8, 4, '2026-06-08'),
(9, 2, '2026-06-09'),
(10, 10, '2026-06-10'),
(11, 3, '2026-06-11'),
(12, 1, '2026-06-12'),
(13, 1, '2026-06-13'),
(14, 1, '2026-06-14'),
(15, 12, '2026-06-15'),
(16, 5, '2026-06-16'),
(17, 3, '2026-06-17'),
(18, 20, '2026-06-18'),
(19, 10, '2026-06-19'),
(20, 6, '2026-06-20');

-- Current Stock Report
Select Item_Name,Stock_Quantity From Items;

-- Total Sales Per Item
Select i.Item_Name, Sum(S.Quantity) As Total_Sold From Sales S Join Items i on S.Item_ID = i.Item_ID Group By i.Item_Name;

-- Total Revenue
Select Sum(S.Quantity * i.Selling_Price) As Total_Revenue From Sales s Join Items i on s.Item_ID = i.Item_ID;

-- Low Stock Alert 
Select Item_Name, Stock_Quantity From Items 
Where Stock_Quantity < 10;

-- Profit Tracking View
SELECT i.Item_Name,
SUM(s.Quantity) AS Total_Sold,
SUM(s.Quantity * i.Selling_Price) AS Revenue,
SUM(s.Quantity * i.Purchase_Price) AS Cost,
SUM(s.Quantity * (i.Selling_Price - i.Purchase_Price)) AS Profit
FROM Items i JOIN Sales s ON i.Item_ID = s.Item_ID GROUP BY i.Item_Name;

-- Update Stock After Sale
Update Items Set Stock_Quantity = 100 Where Item_ID = 1;
