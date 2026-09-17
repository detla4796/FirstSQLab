--create database TechStore;
--go
--use TechStore;

--create table Customers (
--	CustomerID int not null,
--	FirstName nvarchar(50) not null,
--	LastName nvarchar(50) not null,
--	Email nvarchar(100) null,
--	City nvarchar(100) not null
--);

--create table Products (
--	ProductID int not null,
--	ProductName nvarchar(100) not null,
--	Category nvarchar(100) not null,
--	Price decimal(12,2) not null
--);

--create table Orders (
--	OrderID int not null,
--	CustomerID int not null,
--	OrderDate date not null
--);

--create table OrderItems (
--	OrderItemID int not null,
--	OrderID int not null,
--	ProductID int not null,
--	Quantity int not null,
--	Price decimal(12,2) not null
--);
--go

--create database TechStore_DWH;
--go
--use TechStore_DWH;

--create table DimCustomer (
--	CustomerKey int identity(1,1) primary key,
--	CustomerID int not null unique,
--	FirstName nvarchar(50) not null,
--	LastName nvarchar(50) not null,
--	City nvarchar(100) not null
--);

--create table DimProduct (
--	ProductKey int identity(1,1) primary key,
--	ProductID int not null unique,
--	ProductName nvarchar(100) not null,
--	Category nvarchar(100) not null
--);

--create table DimDate (
--	DateKey int primary key, -- Здесь идет назначtние ключем YYYYMMDD, а identity(1,1) этому противоречит
--	FullDate date not null unique,
--	Day int not null,
--	Month int not null,
--	MonthName nvarchar(20) not null,
--	Quarter int not null,
--	Year int not null
--);

--create table FactSales (
--	SalesKey int identity(1,1) primary key,
--	OrderID int not null,
--	DateKey int foreign key references DimDate(DateKey),
--	CustomerKey int foreign key references DimCustomer(CustomerKey),
--	ProductKey int foreign key references DimProduct(ProductKey),
--	Quantity int not null,
--	Price decimal(12,2) not null,
--	Amount decimal(12,2) not null
--);

--USE TechStore;
--GO

--INSERT INTO dbo.Customers (CustomerID, FirstName, LastName, Email, City) VALUES
--(1, N'Иван', N'Иванов', 'ivan@example.com', N'Москва'),
--(2, N'Пётр', N'Петров', 'petr@example.com', N'Санкт-Петербург'),
--(3, N'Анна', N'Смирнова', 'anna@example.com', N'Казань'),
--(4, N'Мария', N'Кузнецова', 'maria@example.com', N'Москва'),
--(5, N'Алексей', N'Попов', 'alexey@example.com', N'Екатеринбург'),
--(6, N'Елена', N'Васильева', 'elena@example.com', N'Новосибирск'),
--(7, N'Дмитрий', N'Соколов', 'dmitry@example.com', N'Москва'),
--(8, N'Ольга', N'Морозова', 'olga@example.com', N'Казань'),
--(9, N'Сергей', N'Волков', 'sergey@example.com', N'Екатеринбург'),
--(10, N'Наталья', N'Фёдорова', 'natalia@example.com', N'Санкт-Петербург');

--INSERT INTO dbo.Products (ProductID, ProductName, Category, Price) VALUES
--(1, N'Ноутбук Pro 14', N'Ноутбуки', 120000),
--(2, N'Ноутбук Air 13', N'Ноутбуки', 90000),
--(3, N'Монитор 27', N'Мониторы', 35000),
--(4, N'Монитор 24', N'Мониторы', 22000),
--(5, N'Клавиатура Механическая', N'Периферия', 8000),
--(6, N'Мышь Gaming', N'Периферия', 5000),
--(7, N'Наушники Pro', N'Аудио', 15000),
--(8, N'Веб-камера HD', N'Периферия', 7000),
--(9, N'SSD 1TB', N'Накопители', 10000),
--(10, N'SSD 2TB', N'Накопители', 18000),
--(11, N'HDD 2TB', N'Накопители', 9000),
--(12, N'Планшет 10', N'Планшеты', 30000),
--(13, N'Смартфон Pro', N'Смартфоны', 70000),
--(14, N'Смартфон Lite', N'Смартфоны', 40000),
--(15, N'Док-станция USB-C', N'Периферия', 12000);

--INSERT INTO dbo.Orders (OrderID, CustomerID, OrderDate) VALUES
--(1001, 1, '2026-01-10'),
--(1002, 2, '2026-01-15'),
--(1003, 3, '2026-01-20'),
--(1004, 1, '2026-02-05'),
--(1005, 4, '2026-02-12'),
--(1006, 5, '2026-02-20'),
--(1007, 6, '2026-03-03'),
--(1008, 7, '2026-03-10'),
--(1009, 8, '2026-03-15'),
--(1010, 9, '2026-03-25'),
--(1011, 10, '2026-04-02'),
--(1012, 2, '2026-04-12'),
--(1013, 3, '2026-04-20'),
--(1014, 4, '2026-05-05'),
--(1015, 5, '2026-05-18'),
--(1016, 1, '2026-06-01'),
--(1017, 6, '2026-06-15'),
--(1018, 7, '2026-07-10'),
--(1019, 8, '2026-08-05'),
--(1020, 10, '2026-09-01');

--INSERT INTO dbo.OrderItems (OrderItemID, OrderID, ProductID, Quantity, Price) VALUES
--(1, 1001, 1, 1, 120000),
--(2, 1001, 5, 1, 8000),
--(3, 1001, 6, 1, 5000),
--(4, 1002, 2, 1, 90000),
--(5, 1002, 7, 1, 15000),
--(6, 1003, 3, 2, 35000),
--(7, 1003, 5, 1, 8000),
--(8, 1004, 13, 1, 70000),
--(9, 1004, 9, 1, 10000),
--(10, 1005, 4, 1, 22000),
--(11, 1005, 8, 1, 7000),
--(12, 1005, 6, 2, 5000),
--(13, 1006, 12, 1, 30000),
--(14, 1006, 10, 1, 18000),
--(15, 1007, 1, 1, 120000),
--(16, 1007, 7, 1, 15000),
--(17, 1008, 2, 2, 90000),
--(18, 1008, 6, 1, 5000),
--(19, 1009, 13, 1, 70000),
--(20, 1009, 14, 1, 40000),
--(21, 1010, 3, 1, 35000),
--(22, 1010, 4, 1, 22000),
--(23, 1010, 5, 1, 8000),
--(24, 1011, 11, 1, 9000),
--(25, 1011, 9, 2, 10000),
--(26, 1012, 1, 1, 120000),
--(27, 1012, 15, 1, 12000),
--(28, 1013, 12, 2, 30000),
--(29, 1013, 8, 1, 7000),
--(30, 1014, 13, 1, 70000),
--(31, 1014, 7, 1, 15000),
--(32, 1015, 2, 1, 90000),
--(33, 1015, 10, 1, 18000),
--(34, 1016, 1, 1, 120000),
--(35, 1016, 3, 1, 35000),
--(36, 1017, 14, 1, 40000),
--(37, 1017, 6, 2, 5000),
--(38, 1018, 2, 1, 90000),
--(39, 1018, 5, 1, 8000),
--(40, 1019, 13, 1, 70000),
--(41, 1019, 9, 1, 10000),
--(42, 1020, 1, 1, 120000),
--(43, 1020, 15, 1, 12000);
--GO

--use TechStore;

--alter table dbo.Customers add constraint PK_Customer primary key (CustomerID);
--alter table dbo.Products add constraint PK_Products primary key (ProductID);
--alter table dbo.Orders add constraint PK_Orders primary key (OrderID);
--alter table dbo.OrderItems add constraint PK_OrderItems primary key (OrderItemID);
--go

--alter table dbo.Orders add constraint FK_Orders_Customers foreign key (CustomerID) references dbo.Customers(CustomerID);
--alter table dbo.OrderItems add constraint FK_OrderItems_Orders foreign key (OrderID) references dbo.Orders(OrderID);
--alter table dbo.OrderItems add constraint FK_OrderItems_Products foreign key (ProductID) references dbo.Products(ProductID);
--go

--alter table dbo.Products add constraint CK_Products_Price check (Price >= 0);
--alter table dbo.OrderItems add constraint CK_OrderItems_Quantity check (Quantity > 0);
--alter table dbo.OrderItems add constraint CK_OrderItems_Price check (Price >= 0);
--go

--use TechStore;
--SELECT 'Customers' AS TableName, COUNT(*) AS [RowCount] FROM dbo.Customers
--UNION ALL SELECT 'Products', COUNT(*) FROM dbo.Products
--UNION ALL SELECT 'Orders', COUNT(*) FROM dbo.Orders
--UNION ALL SELECT 'OrderItems', COUNT(*) FROM dbo.OrderItems;

--SELECT
--    SUM(Quantity) AS TotalUnits,
--    SUM(CAST(Quantity AS DECIMAL(18,2)) * Price) AS TotalRevenue
--FROM dbo.OrderItems;

use TechStore_DWH;
go

--insert into dbo.DimCustomer (CustomerID, FirstName, LastName, City)
--select CustomerID, FirstName, LastName, City
--from TechStore.dbo.Customers;
--go

--insert into dbo.DimProduct (ProductID, ProductName, Category)
--select ProductID, ProductName, Category
--from TechStore.dbo.Products;

--insert into dbo.DimDate (DateKey, FullDate, Day, Month, MonthName, Quarter, Year)
--select distinct convert(int, convert(char(8), OrderDate, 112)) AS DateKey,
--	OrderDate as FullDate,
--	day(OrderDate) AS [Day],
--	month(OrderDate) as [Month],
--	datename(month, OrderDate) as MonthName,
--	datepart(quarter, OrderDate) as Quarter,
--	year(OrderDate) as [Year]
--from TechStore.dbo.Orders;
--go

--select oi.OrderItemID, o.OrderID, dd.DateKey, dc.CustomerKey, dp.ProductKey, oi.Quantity, oi.Price, oi.Quantity * oi.Price as amount
--from TechStore.dbo.OrderItems oi
--join TechStore.dbo.Orders o on o.OrderID = oi.OrderID
--join dbo.DimCustomer dc on dc.CustomerID = o.CustomerID
--join dbo.DimProduct dp on dp.ProductID = oi.ProductID
--join dbo.DimDate dd on dd.FullDate = o.OrderDate;
--go

--insert into dbo.FactSales (OrderID, DateKey, CustomerKey, ProductKey, Quantity, Price, Amount)
--select 
--    o.OrderID,
--    dd.DateKey,
--    dc.CustomerKey,
--    dp.ProductKey,
--    oi.Quantity,
--    oi.Price,
--    cast(oi.Quantity as decimal(18,2)) * oi.Price as Amount
--from TechStore.dbo.OrderItems oi
--join TechStore.dbo.Orders o on o.OrderID = oi.OrderID
--join dbo.DimCustomer dc on dc.CustomerID = o.CustomerID
--join dbo.DimProduct dp on dp.ProductID = oi.ProductID
--join dbo.DimDate dd on dd.FullDate = o.OrderDate;
--go

--select 'DimCustomer' as TableName, COUNT(*) as [RowCount] from dbo.DimCustomer
--union all select 'DimProduct', COUNT(*) from dbo.DimProduct
--union all select 'DimDate', COUNT(*) from dbo.DimDate
--union all select 'FactSales', COUNT(*) from dbo.FactSales;
--go

--select
--    SUM(Quantity) as TotalUnits,
--    SUM(Amount) as TotalRevenue
--from dbo.FactSales;
--go

--1. эффективность товаров
select 
    p.ProductName,
    SUM(f.Quantity) as TotalUnitsSold,
    SUM(f.Amount) as TotalRevenue
from dbo.FactSales f
join dbo.DimProduct p on p.ProductKey = f.ProductKey
group by p.ProductName
order by TotalRevenue desc;
go

--2. выручка по категориям
select 
    p.Category,
    SUM(f.Amount) as TotalRevenue
from dbo.FactSales f
join dbo.DimProduct p on p.ProductKey = f.ProductKey
group by p.Category
order by TotalRevenue desc;
go

--3. анализ клиентской базы
select 
    c.FirstName,
    c.LastName,
    SUM(f.Amount) as TotalSpent
from dbo.FactSales f
join dbo.DimCustomer c on c.CustomerKey = f.CustomerKey
group by c.FirstName, c.LastName
order by TotalSpent desc;

--4. временная сегментация
select 
    d.Year,
    d.Month,
    d.MonthName,
    SUM(f.Amount) as TotalRevenue
from dbo.FactSales f
join dbo.DimDate d on d.DateKey = f.DateKey
group by d.Year, d.Month, d.MonthName
order by d.Year, d.Month;