USE taskJoin
--CREATE TABLE customer(
--Id int Primary key Identity (3001,1),
--[Name] nvarchar (50) not null,
--city nvarchar (50) not null,
--grade int not null,
--salesmanId int FOREIGN KEY REFERENCES salesman(Id) 	 
--);

--INSERT INTO customer([Name], city, grade, salesmanId)
--VALUES('Brad Guzan', 'London', '', 5005),
--('Nick Rimando', 'New York', 100, 5001),
--('Jozy Altidor', 'Moscow', 200, 5007),
--('Fabian Jhonson', 'Paris', 300, 5006),
--('Graham Zusi', 'California', 200, 5002),
--('Almardan', 'London', 111, 5005),
--('Brad Davids', 'New York', 200, 5001),
--('Julian Green', 'London', 300, 5002),
--('Geoff Cameron', 'Berlin', 100, 5003)


--CREATE TABLE salesman(
--Id int Primary key Identity (5001,1),
--[Name] nvarchar (50) not null,
--city nvarchar (50) not null,
--commission decimal (3,2)
--);

--INSERT INTO salesman([Name], city, commission)
--VALUES('James Hong', 'New York', 0.15),
--('Nail Knite', 'Paris', 0.13),
--('Lauson Hen', 'San Jose', 0.12),
--('Ali', 'Jose', 0.25),
--('Pit Alex', 'London', 0.11),
--('Mc Lyon', 'Paris', 0.14),
--('Paul Adam', 'Rome', 0.13)

--CREATE TABLE orders(
--Id int Primary key Identity (70001,1),
--amt numeric (7,2),
--[date] date not null,
--customerId int FOREIGN KEY REFERENCES customer(Id),
--salesmanId int FOREIGN KEY REFERENCES salesman(Id) 	 
--);


--INSERT INTO orders (amt, date, customerId, salesmanId)
--VALUES(150.5, '2012-10-05', 3005, 5002),
--(65.26, '2012-10-05', 3002, 5001),
--(2480.4, '2012-10-10', 3009, 5003),
--(110.5, '2012-08-17', 3009, 5003),
--(2400.6, '2012-07-27', 3002, 5001),
--(150.5, '2012-10-05', 3005, 5002),
--(948.5, '2012-09-10', 3005, 5002),
--(5760, '2012-09-10', 3002, 5001),
--(270.65, '2012-09-10', 3001, 5005),
--(1983.43, '2012-10-10', 3004, 5006),
--(75.29, '2012-08-17', 3003, 5007),
--(250.45, '2012-06-27', 3008, 5002),
--(3045.6, '2012-04-25', 3002, 5001);

----------------task1------------------------
SELECT a.[Name] AS 'Customer Name',
a.city, b.[Name] AS 'Salesman', b.commission
FROM customer a 
INNER JOIN salesman b 
ON a.salesmanId=b.Id;

----------------task2------------------------

SELECT a.[Name] AS 'Customer Name',
a.city, b.name AS 'Salesman', b.city 
FROM customer a 
INNER JOIN salesman b 
ON a.salesmanId=b.Id 
WHERE b.commission>.12;

----------------task3------------------------

SELECT a.[Name] AS "Customer Name", 
a.city, b.[Name] AS "Salesman", b.city,b.commission  
FROM customer a  
INNER JOIN salesman b  
ON a.salesmanId=b.Id 
WHERE b.commission>.12 
AND a.city<>b.city;

----------------task4------------------------

SELECT * FROM orders AS ord 
INNER JOIN salesman AS sale ON ord.salesmanId = sale.Id
INNER JOIN customer AS cus ON ord.customerId = cus.Id
