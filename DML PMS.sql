/*

					SQL Project Name : Property Management System (PMS)
							    Trainee Name : Md Tawhid   
						    	  Trainee ID : 1285314      
							Batch ID : CS/PNTL-A/62/01 

 --------------------------------------------------------------------------------
Table of Contents: DML
			     : INSERT DATA USING INSERT INTO KEYWORD
			     : INSERT DATA THROUGH STORED PROCEDURE
				 : INSERT DATA THROUGH STORED PROCEDURE WITH AN OUTPUT PARAMETER 
				 : INSERT DATA USING SEQUENCE VALUE
			     : UPDATE DELETE DATA THROUGH STORED PROCEDURE
			     : UPDATE DATA THROUGH STORED PROCEDURE
			     : DELETE DATA THROUGH STORED PROCEDURE
			     : STORED PROCEDURE WITH TRY CATCH AND RAISE ERROR
			     : INSERT UPDATE DELETE DATA THROUGH VIEW
				 : INSERT DATA through view
				 : UPDATE DATA through view
			     : DELETE DATA through view
			     : RETREIVE DATA USING FUNCTION(SCALAR, SIMPLE TABLE VALUED, MULTISTATEMENT TABLE VALUED)
			     : TEST TRIGGER (FOR/AFTER TRIGGER ON TABLE, INSTEAD OF TRIGGER ON TABLE & VIEW)
			     : QUERY
				 : SELECT FROM TABLE
				 : SELECT FROM VIEW
				 : SELECT INTO
				 : IMPLICIT JOIN WITH WHERE BY CLAUSE, ORDER BY CLAUSE
				 : INNER JOIN WITH GROUP BY CLAUSE
				 : OUTER JOIN
				 : CROSS JOIN
				 : TOP CLAUSE WITH TIES
				 : DISTINCT
				 : COMPARISON, LOGICAL(AND OR NOT) & BETWEEN OPERATOR
				 : LIKE, IN, NOT IN, OPERATOR & IS NULL CLAUSE
				 : OFFSET FETCH
				 : UNION
				 : EXCEPT INTERSECT
				 : AGGREGATE FUNCTIONS
				 : SUB-QUERIES (INNER, CORRELATED)
				 : EXISTS
				 : CTE
				 : MERGE
				 : BUILT IN FUNCTION
				 : CASE
				 : IIF
				 : WHILE
				 : GROPING FUNCTION
				 : RANKING FUNCTION
				 : IF ELSE & PRINT
				 : TRY CATCH
				 : GOTO
			     : WAITFOR
				 : sp_helptext
				 : TRANSACTION WITH SAVE POINT
*/

/*

					/INSERT DATA USING INSERT INTO TABLE\
==========================================================================
*/

USE PMS
GO
INSERT INTO company VALUES(1,'Empowerment World Business Ltd','Signboard','+8801714277622','emwbl@gmail.com'),
INSERT INTO company VALUES(2,'Zhomprass Limited',      'Mirpur',   '+880171427763',  'zhmpl@gmail.com'),
INSERT INTO company VALUES(3,'Akij Limited Company',     'Vasantech','+8801714277624','Akij@gmail.com'),
INSERT INTO company VALUES(4,'Meghna company Ltd',   'Kanchpur',   '+8801714277625','Meghna@gmail.com'),
INSERT INTO company VALUES(5,'Gazi Ltd','Narayangonj','+8801714277626','Gazi@gmail.com')

GO
SELECT * FROM company
GO
INSERT INTO projects VALUES (100,'House Development','30-12-2024', '20-06-2026','East Dhaka Division'),
INSERT INTO projects VALUES (101,'Industry Development','20-11-2024','21-07-2026','West Dhaka Division'),
INSERT INTO projects VALUES (102,'Float Development','15-10-2024', '11-08-2026','North Dhaka Division'),
INSERT INTO projects VALUES (103,'House Development','25-08-2024', '23-09-2026','South Dhaka Division'),
INSERT INTO projects VALUES (104,'Industry Development','05-09-2024', '16-10-2026','EastWest Dhaka Division')

GO
SELECT * FROM projects
GO
INSERT INTO designation VALUES (1000,'Manager'),
INSERT INTO designation VALUES (1001,'Director'),
INSERT INTO designation VALUES (1002,'It operator',),
INSERT INTO designation VALUES (1003,'Account',)
GO
select * from designation
GO
INSERT INTO employeess VALUES (10,'Md Ridwane','72635768','Dogair Sarulia Demra','15-07-1984','10-08-2021','Male','Married','A+','Ridwane@gmail.com','8801714277645',50,150,'8250','26-10-2027','emwbl.com',1000),
INSERT INTO employeess VALUES (11,'Hasan','72635767',' Sarulia Demra','15-07-1980','10-03-2022','Male','Married','AB+','Hasan@gmail.com','8801814277645',51,151,'8251','26-08-2027','Zhmpl.com',1001),
INSERT INTO employeess VALUES (12,'Md Ashik','72635734','Jatrabari','14-07-1984','10-06-2020','Male','Married','O+','Ashik@gmail.com','8801714277634',52,152,'8252','26-06-2027','bsrml.com',1002),
INSERT INTO employeess VALUES (13,'Murad','52635767','Gulistan','13-07-1984','10-07-2019','Male','Married','A-','Murad@gmail.com','88017142776412',53,153,'8253','26-09-2027','zseml.com',1003),
INSERT INTO employeess VALUES (14,'Tanvir','82635761','Santibag','12-07-1984','10-04-2023','Male','Unmarried','B+','Tanvir@gmail.com','8801714277621',50,154,'8254','26-03-2027','ibbll.com',1004)

GO
SELECT * FROM employee
GO
INSERT INTO customer VALUES (500,'Fajle Hasan Tanvir','Permanent','+8801876543562','admin@gmail.com','Konapara'),
INSERT INTO customer VALUES (501,'Ruhil Amin','Permanent','+8801576593562','RuhilAmin@gmail.com','Sanarpar'),
INSERT INTO customer VALUES (502,'Aminul Islam','Permanent','+8801976543562','AminulIslam@gmail.com','Jatrabari'),
INSERT INTO customer VALUES (503,'Hasibul Islam','Permanent','+8801676763562','HasibulIslam@gmail.com','Konapara Demra'),
INSERT INTO customer VALUES (504,'Mahdi','Permanent','+8807776543562','Mahdi@gmail.com','Demra'),

GO
SELECT * FROM Customer
GO
INSERT INTO sale (50,'17-11-2024'0.20)
GO
select * from sale
GO
INSERT INTO category VALUES (2,'First class')
GO
select * from category
GO
INSERT INTO orders VALUES (5000,'17-11-2024',2),
INSERT INTO orders VALUES (5001,'17-11-2024',2),
INSERT INTO orders VALUES (5002,'17-11-2024',2),
INSERT INTO orders VALUES (5003,'17-11-2024',2),
INSERT INTO orders VALUES (5004,'17-11-2024',2)
GO
select * from orderss
GO
INSERT INTO ordersdetails VALUES (5000,'17-11-2024',500),
INSERT INTO ordersdetails VALUES (5001,'17-11-2024',501),
INSERT INTO ordersdetails VALUES (5002,'17-11-2024',502),
INSERT INTO ordersdetails VALUES (5003,'17-11-2024',503),
INSERT INTO ordersdetails VALUES (5004,'17-11-2024',504)
GO
select * from ordersdetails
GO
INSERT INTO Comments VALUES (12,'Service is good enough to appretiate')
GO
select * from comments
GO
--============== INSERT DATA USING SEQUENCE VALUE ============--

INSERT INTO Comments VALUES((NEXT VALUE FOR seqNum), NULL)
GO
SELECT * FROM Comments
GO

/*
                A SELECT STATEMENT TO GET today sale information FROM A VIEW
*/
SELECT * FROM vCustomers
GO
/*
					/INSERT DATA THROUGH STORED PROCEDURE\
*/


EXEC spInsertcategory 'First Class',
EXEC spInsertcategory 'Second Class',
EXEC spInsertcategory 'First Class',
EXEC spInsertcategory 'First Class',
EXEC spInsertcategory 'Second Class',
GO
/*
                               UPDATE DATA THROUGH STORED PROCEDURE
*/

exec spUpdatecategory @categoryId=1
 
 /*
                                STORED PROCEDURE for DELETE Table data
*/

 exec spDeletecategory @categoryId =1

 /*
                    A SELECT STATEMENT TO GET RESULT SET FROM A TABLE 
*/
exec spRaisError


--==============  INNER JOIN WITH GROUP BY CLAUSE ============--

-- GET EMPLOYEEWISE customer LIST
SELECT Customer.customerId, COUNT(er.employeeId) AS company FROM customes
INNER JOIN project p ON er.employeeId = er.employeeId
INNER JOIN customer ON customer.customerId = pr.customerId
GROUP BY  customer.customername
GO

--==============  OUTER JOIN ============--

SELECT * FROM customers pr
LEFT JOIN employee er ON er.employeeId = er.employeeId
RIGHT JOIN customer ON customer.customerId = er.customerId
FULL JOIN employee e ON e.employee = er.employeeId
GO

--============== CROSS JOIN ============--

SELECT * FROM customes er
CROSS JOIN employee
GO

--==============  TOP CLAUSE WITH TIES ============--

SELECT TOP 5 WITH TIES employee.customerorders, customeId FROM customers
INNER JOIN custome ON custome.customeId = customer.employeeId
ORDER BY custome
GO

--==============  DISTINCT ============--

SELECT DISTINCT custome.customerorders, employeeId FROM customers
INNER JOIN customer ON customer.customerId = customers.customerId
ORDER BY customer.customerorders
GO

--==============  COMPARISON, LOGICAL(AND OR NOT) & BETWEEN OPERATOR ============--

SELECT * FROM customers
WHERE maritalStatus = married
AND dob BETWEEN '10-09-1990' AND '30-12-2024'
AND NOT cityId = 50
AND postalCode > 8250
OR cityId = 50
GO

--==============  LIKE, IN, NOT IN, OPERATOR & IS NULL CLAUSE ============--

SELECT * FROM customers
WHERE name LIKE '%n'
AND cityId NOT IN ('50','60')
AND reference IS NULL
GO

--============== OFFSET FETCH ============--

-- OFFSET 5 ROWS
SELECT * FROM customers
ORDER BY employeeId
OFFSET 5 ROWS
GO

-- OFFSET 10 ROWS AND GET NEXT 5 ROWS

SELECT * FROM customers
ORDER BY employeeId
OFFSET 10 ROWS
FETCH NEXT 5 ROWS ONLY
GO

--============== UNION ============--

SELECT * FROM employee
WHERE cityId IN ('1', '2', '3')

UNION

SELECT * FROM employee
WHERE cityId IN ('52','53','54')
GO

--============== EXCEPT INTERSECT ============--

-- EXCEPT
SELECT * FROM employee

EXCEPT

SELECT * FROM employee
WHERE gender = male
GO

--INTERSECT

SELECT * FROM sale
WHERE employeeId > 10


--============== AGGREGATE FUNCTION ============--

SELECT	COUNT(*) 'Total Sales Count',
		SUM(Sale) 'Total Sale',
		AVG(avgSale) 'Average Sale',
		MIN(customersale) 'MIN PROPERTY SALE',
		(MAX(discount))*100 'MAX Discount %'
FROM sale
GO

--==============  AGGREGATE FUNCTION WITH GROUP BY & HAVING CLAUSE ============--

SELECT customerId.customerorders, count(sale.customerId) Total, SUM(Sale) 'NET SALES' FROM sale
INNER JOIN customer ON customer.customerId = sale.customerId
GROUP BY customer.customerorders
HAVING SUM(Sale) > 5000000
GO
--==============  BUILT IN FUNCTION ============--

-- Get current date and time
SELECT GETDATE()
GO

-- GET STRING LENGTH
SELECT employeeId, LEN([name]) 'Name Length' FROM employee
GO

-- CONVERT DATA USING CAST()
SELECT CAST(1500 AS decimal(17,2)) AS DecimalNumber
GO

-- CONVERT DATA USING CONVERT()
DECLARE @currTime DATETIME = GETDATE()
SELECT CONVERT(VARCHAR, @currTime, 108) AS ConvertToTime
GO

-- CONVERT DATA USING TRY_CONVERT()
SELECT TRY_CONVERT(FLOAT, 'HELLO', 1) AS ReturnNull
GO

-- GET DIFFERENCE OF DATES
SELECT DATEDIFF(DAY, '01-01-2024', '01-01-2025') AS DAYinYear
GO

-- GET A MONTH NAME
SELECT DATENAME(MONTH, GETDATE()) AS 'Month'
GO
--============== EXISTS ============--

SELECT [name],[type],phone,email,[address] FROM customers
WHERE NOT EXISTS 
			(SELECT * FROM sale
				WHERE employeesale.customerId = employee.employeeId)
GO
--A subquery to findout trainees who have not enrolled yet

SELECT [name],[type],phone,email,[address] FROM customers
WHERE employeeId NOT IN (SELECT employeeId FROM sale)
ORDER BY [name]
GO
-==============SUB-QUERIES============--
--A correlated subquery

SELECT cs.customerid, SUM(cs.Sale) ' SALES' FROM sale  cs
GROUP BY  cs.customerid
HAVING SUM(cs.Sale) > (SELECT AVG(cs2.Sale) FROM sale cs2 WHERE cs.customerid = cs2.customerid)
GO
--============== MERGE ============--

SELECT * FROM Comments
GO


--============== CASE ============--

SELECT employee.[name], 
e.salary,
	CASE 
		WHEN (e.salary < 30000) THEN 'Lower Salary'
		WHEN (e.salary > 30000) THEN 'Good Salary'
		WHEN (e.salary > 40000) THEN 'Better Salary'
		WHEN (e.salary > 40000) THEN 'Great Salary'
END AS 'Status'
FROM employee
INNER JOIN employee ON e.employeeId = employee.employeeId
GO

--============== IIF ============--

SELECT employee.[name], 
e.salary,
IIF((e.salary > 50000), 'Great Salary', 'Lower Salary') AS 'Status'
FROM employee e
INNER JOIN employee ON e.employeeId = employee.employeeId
GO

--============== WHILE ============--

	DECLARE @counter int
	SET @counter = 0

	WHILE @counter < 20

	BEGIN
	  SET @counter = @counter + 1
	  INSERT INTO Comments(commentId, comment) VALUES((NEXT VALUE FOR [dbo].seqNum), NULL)
	END

	SELECT * FROM Comments
GO

--============== RANKING FUNCTION ============--

SELECT 
RANK() OVER(ORDER BY employeeid) AS 'Rank',
DENSE_RANK() OVER(ORDER BY customerId) AS 'Dense_Rank',
NTILE(3) OVER(ORDER BY Sale) AS 'NTILE',
employeeid,
customerId, 
Sale
FROM sales
GO

--============== IF ELSE & PRINT ============--

DECLARE @totalSales MONEY
SELECT @totalSales = SUM((Sale))
FROM sales
WHERE YEAR(customersale.saleDate) = YEAR(GETDATE())
IF @totalSales > 60000000
	BEGIN
		PRINT 'Great ! The sales is greater than target in this year !!'
	END
ELSE
	BEGIN
		PRINT 'Didn''t Reached the goal !'
	END
GO

--============== TRY CATCH ============--

BEGIN TRY
	DELETE FROM customer
	PRINT 'SUCCESSFULLY DELETED'
END TRY

BEGIN CATCH
		DECLARE @Error VARCHAR(200) = 'Error' + CONVERT(varchar, ERROR_NUMBER(), 1) + ' : ' + ERROR_MESSAGE()
		PRINT (@Error)
END CATCH
GO

--==============  GOTO ============--

DECLARE @value INT
SET @value = 0

WHILE @value <= 10
	BEGIN
	   IF @value = 2
		  GOTO printMsg
	   SET @value = @value + 1

	   	IF @value = 9
		  GOTO printMsg2
	   SET @value = @value + 1
	END
printMsg:
   PRINT 'Crossed Value 2'
printMsg2:
   PRINT 'Crossed Value 9'
GO

--==============  WAITFOR ============--

PRINT 'HELLO'
WAITFOR DELAY '00:00:03'
PRINT 'GOOD LUCK'
GO

--============== SYSTEM STORED PROCEDURE(sp_helptext) TO GET UNENCRYPTED STORED PROCEDURE SCRIPT  ============--

EXEC sp_helptext spUpdatecategory
GO


--============== TRANSACTION WITH SAVE POINT  ============--

SELECT * INTO #project
FROM trproject
GO
SELECT * FROM #project
GO

BEGIN TRANSACTION
	DELETE FROM #project WHERE projectId =1005
	SAVE TRANSACTION tran1
		DELETE FROM #project WHERE projectId = 1006
		SAVE TRANSACTION tran2
			DELETE FROM #project WHERE projectId = 1007
			SAVE TRANSACTION tran3

			SELECT * FROM #project

		ROLLBACK TRANSACTION tran2
		SELECT * FROM #project
	ROLLBACK TRANSACTION tran1
	SELECT * FROM #project
COMMIT TRANSACTION
GO


--==============  CTE ============--

-- A CTE TO GET MAXIMUM SALES project
WITH project AS
(
SELECT c.customerorders, count(cs.customerid) TotalSales FROM customers cs
INNER JOIN customerid c ON c.customerid = cs.customerid
GROUP BY c.customerorders
)
SELECT customerorders, TotalSales from customerCount
WHERE TotalSales = (SELECT MAX(TotalSales) FROM customerCount)
GO
--LAG :The LAG function provides access to a preceding row in the same result set.
SELECT 
employee_id,
salary,
LAG(salary) OVER (ORDER BY salary) AS previous_salary 
FROM employees;
GO
--LEAD :The LEAD function provides access to a subsequent row in the same result set without the use of a self-join.
SELECT 
    employee_id,
    salary,
    LEAD(salary) OVER (ORDER BY salary) AS next_salary
FROM 
    employees;
GO
--LAST_VALUE

SELECT 
    employee_id,
    department_id,
    salary,
    LAST_VALUE(salary) OVER (PARTITION BY department_id ORDER BY salary 
                              ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS last_salary
FROM 
    employees;
GO

--FIRST_VALUE
SELECT 
    employee_id,
    department_id,
    salary,
    FIRST_VALUE(salary) OVER (PARTITION BY department_id ORDER BY salary) AS first_salary
FROM 
    employees;
GO
--PERCENT_RANK :The PERCENT_RANK function calculates the relative rank of a row within a partition of a result set.
--row position/totalnumberofRow
SELECT 
    employee_id,
    salary,
    PERCENT_RANK() OVER (ORDER BY salary) AS percent_rank 
	FROM employees;
GO

--CUME_DIST :The CUME_DIST function calculates the cumulative distribution of a value in a group of values.
--row position/totalNumberOfRows
SELECT 
    employee_id,
    salary,
    CUME_DIST() OVER (ORDER BY salary) AS cumulative_distribution
FROM 
    employees;
GO
-- PERCENTILE_CONT :The PERCENTILE_CONT function computes a percentile based on a continuous distribution of the column values.
SELECT 
    department_id,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY salary) OVER (PARTITION BY department_id) AS median_salary
FROM 
    employees;
GO


              --------------------------------------END----------------------------------------------















