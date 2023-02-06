--###################  DDL Commands  ###############################
-- ##############    To create a database of name student1
CREATE DATABASE students1
USE students1
-- #################    To create a table
CREATE TABLE studentsInfo
(
studentID int,
studentName varchar(255),
studentRollNumber int
)

--#############  To add column in table
ALTER TABLE studentsInfo ADD BloodGroup varchar(255)
--############## to drop the column
ALTER TABLE studentsInfo DROP COLUMN BloodGroup

ALTER TABLE studentsInfo ADD DOB DATE
-- ############# to change the datatype of column
ALTER TABLE studentsInfo ALTER COLUMN DOB datetime
-- #############   To insert the data in table
INSERT INTO studentsInfo VALUES ('1234','Trunal' ,'2135',17/03/1998)
-- ############# to truncate the table
TRUNCATE TABLE studentsInfo
-- ##############  to rename the table
sp_rename 'studentsInfo','Infostudents'
-- ##############  To Drop tha table 
DROP TABLE Infostudents
-- #########################################
-- ####################  SQL constraints   ###################################
-- #####  1) NOT NULL
CREATE TABLE studentsInfo
(
sname varchar(255) NOT NULL,
smobile_no int NOT NULL,
saddress varchar(255)
)
-- #############  to insert data in table
INSERT INTO studentsInfo VALUES ('Gaurav','854123657','Pauni')
SELECT * FROM StudentsInfo
DROP TABLE studentsInfo
-- ############  2) UNIQUE Primary key
CREATE TABLE studentsInfo
(
StudentID int UNIQUE NOT NULL,
sname varchar NOT NULL,
PRIMARY KEY (StudentID)
)
DROP TABLE studentsInfo
-- ##  crete new table 
-- ##########  add unique constraint in multiple column
CREATE TABLE students1Info
(
Sname varchar(255) NOT NULL,
Sphone_no int NOT NULL,
Semail varchar(255) NOT NULL,
CONSTRAINT UC_students1Info UNIQUE(Sphone_no,Semail)
)

INSERT INTO students1Info VALUES ('Gaurav','854123657','gaurav@gmail.com')
INSERT INTO students1Info VALUES ('Suraj','854123657','suraj@gmail.com')
INSERT INTO students1Info VALUES ('Abhishek','854123432','abhishek@gmail.com')
INSERT INTO students1Info VALUES ('Yougesh','854123432','yougesh@gmail.com')
INSERT INTO students1Info VALUES ('Manoj','954123432','manoj@gmail.com') --- it gives error,becz duplicate entry
--- ############################################  read the table
SELECT * FROM students1Info
-- ############  How to drop unique constraint 
ALTER TABLE students1Info DROP CONSTRAINT UC_students1Info
-- #####  to add unique constraint in table
ALTER TABLE students1Info ADD UNIQUE (Sname)
-- ###########################################
DROP TABLE students1Info
-- #############   3) Check Constraint is used for condition
CREATE TABLE StudentsInfo
(
Sname varchar(255) NOT NULL,
Scity varchar(255) CHECK (Scity='India'),
Sphone_no int NOT NULL
)
INSERT INTO StudentsInfo VALUES ('Trunal','India',651235897)
-- How to add check constraint in table
ALTER TABLE StudentsInfo ADD BloodGroup varchar(255)
ALTER TABLE StudentsInfo ADD CHECK (BloodGroup='A')
INSERT INTO StudentsInfo VALUES ('Trunal','India',651235897,'A')
-- #####################   Default Constraint
CREATE TABLE Student1_Table
(
Sname varchar(255),
City varchar(255) DEFAULT 'hyd',
phone_no int NOT NULL,
)
--INSERT INTO Students_Table VALUES ('Rajesh','',5412336698)
ALTER TABLE student1_Table ADD CONSTRAINT default_country DEFAULT 'Pune' FOR Sname
-- ####  to drop the constraint
ALTER TABLE student1_Table DROP CONSTRAINT default_country

-- ############   4) Index constraint
CREATE INDEX index_studentname
ON student1_Table (Sname)
--####  to drop the index
DROP INDEX student1_Table.index_studentname
-- #######################################
CREATE TABLE Customer1
(
customername varchar(255),
customerID int NOT NULL,
Ordertime date,
OrderItem varchar(255)
PRIMARY KEY (customerId)
)
-- ##########  Insert the data
INSERT INTO Customer1 VALUES ('Rajesh',10,'7:00 PM','Pizza')
INSERT INTO Customer1 VALUES ('Mukesh',11,'8:00 PM','Aloo parath')
INSERT INTO Customer1 VALUES ('Rahul',12,'9:00 PM','Noodle')
INSERT INTO Customer1 VALUES ('Yougesh',13,'10:00 PM','Chapati')
INSERT INTO Customer1 VALUES ('Trunal',14,'11:00 PM','Subji')
SELECT * FROM Customer1
-- ###   Retrive the data
SELECT customername FROM Customer1
-- ## find who is customerID 13 ??
SELECT customername FROM Customer1 WHERE customerID = 13
-- ###  to give the space in word
SELECT customername as [customer name] FROM Customer1
-- ####   select top 2 record
SELECT top(2) * FROM Customer1
-- ## who has order pizza??
SELECT customername FROM Customer1 WHERE OrderItem = 'pizza'
-- ## NOT EQUAL TO
SELECT customername,customerID FROM Customer1 WHERE OrderItem <> 'pizza'
--## OR statement
SELECT customername,customerID FROM Customer1 WHERE OrderItem = 'pizza' OR OrderItem = 'Aloo parath'
-- ## Another way 
SELECT customername FROM Customer1 WHERE OrderItem IN('pizza','Aloo parath','chapati')
SELECT customername FROM Customer1 WHERE OrderItem NOT IN('pizza','Aloo parath','chapati')
-- ## AND statement
SELECT customerID FROM Customer1 WHERE OrderItem='Pizza' AND customername='Rajesh'
-- ## Access all the customer begin with R
SELECT customername FROM Customer1 WHERE customername like 'R%'
SELECT * FROM Customer1 WHERE customername NOT like 'R%'
-- ##################################################### 
-- #######################   How to join two table ??
CREATE TABLE Orders
(
OrderID int,
OrderDate date,
CustomerID int ,
OrderTotal int,
PRIMARY KEY (OrderID)
)
-- #########  INSER DATA INTO TABLE
INSERT INTO  Orders VALUES (1,'01-01-2023',3,3500)
INSERT INTO  Orders VALUES (2,'02-01-2023',10,3000)
INSERT INTO  Orders VALUES (3,'03-01-2023',12,4000)
INSERT INTO  Orders VALUES (4,'04-01-2023',15,6500)
INSERT INTO  Orders VALUES (5,'05-01-2023',14,2000)
-- #########  To see the data from table
SELECT * FROM Orders
-- ########  Make another table
CREATE TABLE Customers_Data
(
CustomerID int,
CustomerName varchar(255),
Customer_Phone int ,
Customer_City varchar(255),
PRIMARY KEY (CustomerID)
)
-- #####  Inser the data in table
INSERT INTO Customers_Data VALUES (1,'Rahul',925478632,'Pune')
INSERT INTO Customers_Data VALUES (2,'Trunal',925476892,'Nagpur')
INSERT INTO Customers_Data VALUES (3,'Rupesh',915354786,'Kolkata')
INSERT INTO Customers_Data VALUES (4,'Sourabha',974289863,'Mumbai')
INSERT INTO Customers_Data VALUES (5,'Mukesh',942847862,'Hydrabad')
SELECT * FROM Customers_Data
--###############   join table
SELECT OrderID,OrderDate,OrderTotal,Customer_phone,Customers_Data.CustomerID FROM Orders
JOIN Customers_Data ON Orders.OrderID = Customers_Data.CustomerID
-- ##################################### Order by....default asending order

SELECT OrderID,OrderDate,OrderTotal,Customer_phone,Customers_Data.CustomerID FROM Orders
JOIN Customers_Data ON Orders.OrderID = Customers_Data.CustomerID
ORDER BY OrderTotal
-- #######    Desending order
SELECT OrderID,OrderDate,OrderTotal,Customer_phone,Customers_Data.CustomerID FROM Orders
JOIN Customers_Data ON Orders.OrderID = Customers_Data.CustomerID
ORDER BY OrderTotal desc
-- ###############################################
SELECT * FROM Orders WHERE Orderdate>'03-01-2023'
-- #####  Count all the rows
SELECT count(*) FROM Orders WHERE Orderdate>'03-01-2023' -- ##  It gives no of row
-- ############################# Find sum of order Total
SELECT sum(OrderTotal) FROM Orders
-- ################ Group By
-- ########################### To find the sum of order total of customerID
SELECT sum(OrderTotal),CustomerID FROM Orders WHERE Orderdate>'03-01-2023'
GROUP BY CustomerID
-- #############################################################################################
SELECT * FROM Customers_Data
--##### Find all the customer name where total character is 5
SELECT CustomerName FROM Customers_Data WHERE CustomerName LIKE '_____'
-- ############################### UPDATE
SELECT * FROM Customers_Data
UPDATE Customers_Data set Customer_City='Pune'
UPDATE Customers_Data set Customer_City='nag' WHERE CustomerName='Trunal'
-- ## change the customer name and city if customer phone number start from 94
UPDATE Customers_Data set CustomerName='Ankit',Customer_City='Hyd'WHERE Customer_Phone LIKE '94%'
-- ####################### DELETE QUERY
DELETE FROM Customers_Data WHERE CustomerID=1
SELECT* FROM Customers_Data
DELETE FROM Customers_Data WHERE CustomerID BETWEEN 3 AND 5
-- ## To delete the all rows in table
SELECT * FROM Orders
--  DELETE FROM Orders WHERE 1
TRUNCATE TABLE Orders
-- ########### Function of SQL
CREATE TABLE Product
(
ProdID int NOT NULL,
Actual_Price int NOT NULL,
Selling_Price int NOT NULL,
PRIMARY KEY (ProdID)
)
INSERT INTO Product VALUES (1,1000,1500)
INSERT INTO Product VALUES (2,500,300)
INSERT INTO Product VALUES (3,12000,15000)
INSERT INTO Product VALUES (4,8000,7900)
INSERT INTO Product VALUES (5,2000,2500)
SELECT * FROM Product 
-- ##### Absolute value
SELECT ProdID ,(Selling_Price-Actual_Price) AS Profit FROM Product 
SELECT ProdID ,ABS((Selling_Price-Actual_Price)) AS Profit FROM Product
-- ############ ROUND 
SELECT * FROM Product
SELECT ProdID,ROUND((Actual_Price/3),1) As Other FROM Product
-- ############ CEIL AND FLOOR FUNCTION
-- ############## UPPER AND LOWER FUNCTION
SELECT UPPER(CustomerName) FROM Customer1
-- ### LOWER CASE
SELECT LOWER(CustomerName) FROM Customer1 
-- #################### CONCAT .. to concat the multiple column
SELECT * FROM Customer1
SELECT CustomerID,CONCAT(customername,' ' ,OrderItem) AS crew FROM Customer1
-- ############## LENGTH 
SELECT * FROM Customer1
SELECT customername, LEN(customername) AS Lengths FROM Customer1  
--############################## FIND HOW MANY DISTICT CUSTOMER NAME
SELECT COUNT(DISTINCT(customername)) FROM Customer1
-- Using group by
SELECT customername,COUNT(DISTINCT(customername)) AS distict_customer FROM Customer1 GROUP BY customername
-- ######################### Sorting the data
SELECT * FROM Product
-- ### sort the data based on profit
SELECT ProdID,(Actual_Price-Selling_Price) AS Profit FROM Product ORDER BY Profit DESC 
-- #############
SELECT * FROM Customer1 ORDER BY customername DESC , OrderItem ASC 
-- ###### which product ID has maximun selling price ??
SELECT ProdID,Selling_Price FROM Product ORDER BY Selling_Price DESC

-- ##################################### Type of join #######################
-- ############## 1) Inner Join
CREATE TABLE Student
(
Roll_No int,
Name varchar(255),
Age int,
)
INSERT INTO Student VALUES (1,'Harsh',18)
INSERT INTO Student VALUES (2,'Pratik',19)
INSERT INTO Student VALUES (3,'Riyanka',20)
INSERT INTO Student VALUES (4,'Deep',18)
INSERT INTO Student VALUES (7,'Rohit',18)
INSERT INTO Student VALUES (8,'Niraj',19)
-- ##############
SELECT * FROM Student
-- ########### create another table
CREATE TABLE Student_Course
(
Course_ID int,
Roll_No int
)
-- ######## To insert the dta in table
INSERT INTO Student_Course VALUES (1,1)
INSERT INTO Student_Course VALUES (2,2)
INSERT INTO Student_Course VALUES (2,3)
INSERT INTO Student_Course VALUES (3,4)
INSERT INTO Student_Course VALUES (5,10)
INSERT INTO Student_Course VALUES (4,11)

SELECT * FROM Student_Course
-- ##################### INNER JOIN
SELECT Student.Name,Student.Age,Student_Course.Course_ID
FROM Student
INNER JOIN Student_Course
ON Student_Course.Roll_No=Student.Roll_No
-- ################### LEFT OUTER JOIN
SELECT Student.Name,Student.Age,Student_Course.Course_ID
FROM Student
LEFT OUTER JOIN Student_Course
ON Student_Course.Roll_No=Student.Roll_No
-- ############ RIGHT OUTER JOIN
SELECT Student.Name,Student.Age,Student_Course.Course_ID
FROM Student
RIGHT OUTER JOIN Student_Course
ON Student_Course.Roll_No=Student.Roll_No
-- ###################### FULL JOIN
SELECT Student.Name,Student.Age,Student_Course.Course_ID
FROM Student
FULL JOIN Student_Course
ON Student_Course.Roll_No=Student.Roll_No
-- ##############################################################################




