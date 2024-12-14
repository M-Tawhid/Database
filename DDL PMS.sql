
/*
					SQL Project Name : Property Management System (PMS)
							    Trainee Name : Md Tawhid   
						    	  Trainee ID : 1285314      
							Batch ID : CS/PNTL-A/62/01 

 -------------------------------------------------------------------------
 
Table of Contents: DDL
			     : Created a Database [PMS]
			     : Created Appropriate Tables with column definition related to the project
			     : ALTER, DROP AND MODIFY TABLES & COLUMNS
			     : CREATE CLUSTERED AND NONCLUSTERED INDEX
			     : CREATE SEQUENCE & ALTER SEQUENCE
		         : CREATE A VIEW & ALTER VIEW
		         : CREATE STORED PROCEDURE & ALTER STORED PROCEDURE
			     : CREATE FUNCTION(SCALAR, SIMPLE TABLE VALUED, MULTISTATEMENT TABLE VALUED) & ALTER FUNCTION
			     : CREATE TRIGGER (FOR/AFTER TRIGGER)
			     :CREATE TRIGGER (INSTEAD OF TRIGGER)
*/

/*
	   CHECK DATABASE EXISTANCE & CREATE DATABASE WITH ATTRIBUTES
==========================================================================
*/

CREATE DATABASE PMS
ON
(
	name = 'pms_data',
	filename = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\pms_data.mdf',
	size = 20MB,
	maxsize = 100MB,
	filegrowth = 10%
)
LOG ON
(
	name = 'pms_log',
	filename = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\pms_log.ldf',
	size = 10MB,
	maxsize = 50MB,
	filegrowth = 1MB
)
GO
USE PMS
GO

/*
		          CREATE TABLES WITH COLUMN DEFINITION 
==========================================================================
*/
--============== Table with IDENTITY, PRIMARY KEY & nullability CONSTRAINT... ============--

CREATE TABLE company
(
      companyId int identity primary key,
	  companyName varchar(50) not null,
	  companyAddress varchar(40) not null,
	  companyPhone char(20) unique,
	  companyEmail varchar(20) unique
)
GO
CREATE TABLE projects
(
      projectId int primary key,
	  projectName varchar(40) not null,
	  projectStartingDate date not null,
	  projectEndingDate date not null,
	  projectLocation varchar(50) not null
)
GO
CREATE TABLE designation
(
    designationId int primary key,
	title varchar(40),
)
GO
CREATE TABLE employeess
(
      Id int primary key,
	  [Name] varchar(40) not null,
	  Nid char(10) unique,
	  [Address] varchar(40) not null,
	  dob date not null,
	  eJoin date not null,
	  gender varchar(10),
	  maritalStatus varchar(30),
	  bloodGroup varchar(3),
	  email varchar(40) unique,
	  phone char(20) unique,
	  cityId int,
	  countryId int,
	  postalCode nchar(12) default NULL,
	  closingDate date NULL,
	  website varchar(30) NULL,
	  designationId INT REFERENCES designation(designationId)
)
GO
CREATE TABLE Sale
(
	salesId int identity(9001, 1) primary key,
	salesDate datetime default GETDATE(),
	discount MONEY default 0.00,
	CONSTRAINT discountCheck CHECK(discount >= 0.00)
)
GO
CREATE TABLE customer
(
     customerId int primary key,
	 customerName varchar(30) not null,
	 customerType varchar(40) not null,
	 customerPhone char(20) unique,
	 customerEmail varchar(20) unique,
	 customerAddress varchar(50) not null
)
GO

CREATE TABLE category
(
    categoryId int primary key,
	categoryName varchar(30)
)
GO
CREATE TABLE orders
(
	OrdersId int identity primary key,
	OrdersDate DATETIME default GETDATE(),
	categoryId INT REFERENCES category(categoryId)
)
GO
CREATE TABLE ordersdetails
(
    ordersId int primary key,
	customerId int references customer(customerId),
    categoryId int references category(categoryId)
)
GO


CREATE TABLE Comments
(
	commentId INT,
	comment NVARCHAR(100) NULL
)
GO

--============== Update column definition ============--

ALTER TABLE bloodGroup
ALTER COLUMN bloodGroupTitle CHAR(10) NOT NULL
GO
--============== ADD column with DEFAULT CONSTRAINT ============--

ALTER TABLE employee
ADD Sales MONEY default 0.00
GO
--============== ADD CHECK CONSTRAINT with defining name ============--

ALTER TABLE employee
ADD CONSTRAINT CK_nidValidate CHECK(nid LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
CONSTRAINT CK_phoneValidate CHECK(phone LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
CONSTRAINT CK_emailValidate CHECK(email LIKE '%@%' )
GO
--============== DROP COLUMN ============--

ALTER TABLE employeess
DROP COLUMN website
GO
--============== DROP TABLE ============--

IF OBJECT_ID('category') IS NOT NULL
DROP TABLE category
GO
--============== DROP SCHEMA ============--

DROP SCHEMA pms
GO
/*
		          CREATE CLUSTERED AND NONCLUSTERED INDEX
==========================================================================
*/

-- Clustered Index
CREATE CLUSTERED INDEX IX_Comments
ON Comments
(
	commentId
)
GO
-- Nonclustered Index
CREATE NONCLUSTERED INDEX ix_employee
ON employee
(
	employeeid
)
GO
/*
							 CREATE SEQUENCE
==========================================================================
*/
CREATE SEQUENCE seqSales
	AS INT
	START WITH 1
	INCREMENT BY 1
	MINVALUE 0
	MAXVALUE 50000
	CYCLE
	CACHE 10
GO
--============== ALTER SEQUENCE ============--

ALTER SEQUENCE seqsales
	MAXVALUE 50000
	CYCLE
	CACHE 9
GO


/*
							  CREATE A VIEW
==========================================================================
*/
CREATE VIEW vCustomers
AS
SELECT customerId, customerName, customerType, customerPhone,customerEmail,customerAddress FROM Customer
GO

-- VIEW WITH ENCRYPTION, SCHEMABINDING & WITH CHECK OPTION
-- A VIEW to get today customer information

CREATE VIEW vCustomers
WITH SCHEMABINDING, ENCRYPTION
AS
SELECT customerId, customerName, customerType, customerPhone, customerEmail, customerAddress FROM [dbo].vCustomer
WHERE CONVERT(DATE,customerId) = CONVERT(DATE, GETDATE())
WITH CHECK OPTION
GO
--============== ALTER VIEW ============--

ALTER VIEW vCustomers
AS
SELECT customerId, customerName, customerType, customerPhone,customerEmail,customerAddress FROM Customer
GO

/*
							 STORED PROCEDURE
==========================================================================
*/
--============== STORED PROCEDURE for insert data using parameter ============--

CREATE PROCEDURE spInsertcategory   @categoryName varchar(40)
	                                
AS
BEGIN
	INSERT INTO Categories VALUES (@categoryName)
	print 'category added successfully'
END


--============== STORED PROCEDURE for UPDATE data ============--
GO
CREATE PROCEDURE spUpdatecategory @categoryId int,
                                  @categoryName varchar(40)
								  
AS
BEGIN
	     if exists (select 1 from Categories where categoryId = @categoryId) 
BEGIN
     Update Categories set categoryName = @categoryName
	 where categoryId = @categoryId
	print 'category update successfully.'
END
begin
      print 'category does not exist.'
END
end
exec spUpdatecategory @categoryId=1



--============== STORED PROCEDURE for DELETE Table data ============--
GO
CREATE PROCEDURE spDeletecategory	@categoryId int
AS
BEGIN
     if exists (select 1 from Categories where categoryId = @categoryId) 
BEGIN
     delete from Categories where categoryId = @categoryId
	print 'category deleted successfully.'
END
else 
begin 
    print 'category does not exist.'
end
end
exec spDeletecategory @categoryId =1
go
--============== TRY CATCH IN A STORED PROCEDURE & RAISERROR WITH ERROR NUMBER AND ERROR MESSAGE ============--

CREATE PROCEDURE spRaisError
AS
BEGIN
	BEGIN TRY
		DELETE FROM Categories
	END TRY
	BEGIN CATCH
		DECLARE @Error VARCHAR(200) = 'Error' + CONVERT(varchar, ERROR_NUMBER(), 1) + ' : ' + ERROR_MESSAGE()
		RAISERROR(@Error, 1, 1)
	END CATCH
END
GO
exec spRaisError
--============== ALTER STORED PROCEDURE ============--

Alter PROCEDURE spUpdatecategory @categoryId int,
                                  @categoryName varchar(40)
									
AS
BEGIN
	     if exists (select 1 from Categories where categoryId = @categoryId) 
BEGIN
	BEGIN
     Update Categories set categoryName = @categoryName
	 where categoryId = @categoryId
	print 'category update successfully.'
END
begin
      print 'category does not exist.'
END
end
exec spUpdatecategory @categoryId =1
GO
/*
								 FUNCTION
==========================================================================
*/
--============== A SCALAR FUNCTION ============--
-- A Scalar Function to get Current Year Total Net Sales
CREATE FUNCTION fnCategoryName  (@CategoryId int)                                       
RETURNS int
AS
BEGIN
	DECLARE @CategoryName varchar(50)
	SELECT @CategoryName = CategoryName
	FROM Categories
	WHERE CategoryId = @CategoryId 
	RETURN @CategoryName
END
GO
select * from dbo.fnCategoryName 
go
--============== A SIMPLE TABLE VALUED FUNCTION ============--
-- A Inline Table Valued Function using two parameter @year & @month

CREATE FUNCTION fnCategoryDetails  (@CategoryId int)
RETURNS TABLE
AS
RETURN
(
	SELECT 
			CategoryId,
			CategoryName
	        FROM Categories
	        WHERE CategoryId = @CategoryId
)
GO
select * dbo.fnCategoryDetails
GO
--============== A MULTISTATEMENT TABLE VALUED FUNCTION ============--
CREATE FUNCTION fnCategoryDetails_multi @categoryId int,
                                        @categoryName varchar(30)
RETURNS @categoryId table 
(
    CategoryID INT,
    CategoryName VARCHAR(30)
)
AS
BEGIN
    INSERT INTO Categories
    SELECT CategoryID, CategoryName
    FROM Categories
    RETURN
END
select * from dbo.fnCategoryDetails_multi
go
--============== ALTER FUNCTION ============--

ALTER FUNCTION fnCategoryDetails_multi (@CategoryId int)
returns CategoryDetails table
(
    CategoryId int,
	Categoryname varchar(40)
)
AS
Begin
     insert into @CategoryDetails
	 select 
	 CategoryId,
	 Categoryname
	 from category 
	 where CategoryId = @CategoryId
return
end
go
 
--============== AN AFTER/FOR TRIGGER FOR INSERT, UPDATE, DELETE ============--

CREATE TRIGGER AfterInsertCategory
ON Categories
AFTER INSERT
AS
BEGIN
    
    INSERT INTO Categories (CategoryID, CategoryName)
    SELECT 
        i.CategoryID, 
        'Default Categories for ' + i.CategoryName, 
        0.00 -- Default price
    FROM 
        inserted i
END
GO
               ----------------------------UPDATE---------------------------------------------------------------
CREATE TRIGGER AfterUpdateCategory
ON Categories
AFTER UPDATE
AS
BEGIN
    -- Check if the CategoryID or CategoryName has changed
    IF UPDATE(CategoryID) 
	OR UPDATE(CategoryName)
    BEGIN

        INSERT INTO Categories(CategoryID, CategoryName)
        SELECT 
            i.CategoryID, 
            d.CategoryName AS OldCategoryName, 
            i.CategoryName AS NewCategoryName, 
            GETDATE()
        FROM 
            inserted i
        INNER JOIN 
            deleted d ON i.CategoryID = d.CategoryID
    END
END
GO
                                
                -----------------------------DELETE --------------------------------------------
CREATE TRIGGER AfterDeleteCategory
ON Categories
AFTER DELETE
AS
BEGIN
  
    INSERT INTO Categories(CategoryID, CategoryName)
    SELECT 
        d.CategoryID, 
        d.CategoryName, 
        'DELETE' AS Action, 
        GETDATE()
    FROM 
        deleted d;
END
GO

                   -------------------------INSTEAD TRIGGER INSERT---------------------------------
CREATE TRIGGER InsteadOfCategoryInsert
ON Categories
INSTEAD OF INSERT
AS
BEGIN
  
    IF EXISTS (SELECT 1 FROM Categories WHERE CategoryID = (SELECT CategoryID FROM inserted))
    BEGIN
        PRINT 'CategoryID already exists.'
    END
    ELSE
    BEGIN
        INSERT INTO Categories (CategoryID, CategoryName)
        SELECT CategoryID, CategoryName
        FROM inserted

        PRINT 'Category inserted successfully.'
    END
END
GO
                           -------------------------INSTEAD TRIGGER UPDATE---------------------------------
CREATE TRIGGER InsteadOfCategoryUpdate
ON Categories
INSTEAD OF UPDATE
AS
BEGIN
    INSERT INTO Categories(CategoryID, CategoryName)
    SELECT d.CategoryID, d.CategoryName, i.CategoryName, 'UPDATE', GETDATE()
    FROM inserted i
    INNER JOIN deleted d ON i.CategoryID = d.CategoryID

    
    UPDATE Categories
    SET CategoryName = i.CategoryName
    FROM Categories c
    INNER JOIN inserted i ON c.CategoryID = i.CategoryID
    
    PRINT 'Category updated successfully.'
END
GO
                          -------------------------INSTEAD TRIGGER UPDATE---------------------------------
CREATE TRIGGER InsteadOfCategoryDelete
ON Categories
INSTEAD OF DELETE
AS
BEGIN
    INSERT INTO Categories(CategoryID, CategoryName)
    SELECT d.CategoryID, d.CategoryName, 'DELETE', GETDATE()
    FROM deleted d

    DELETE FROM Categories
    WHERE CategoryID IN (SELECT CategoryID FROM deleted);
    
    PRINT 'Category deleted successfully.'
END
/*
-------------------------------------------------------------------------------------------------------------------------------
                            _____________________/END\_______________________
-*/-------------------------------------------------------------------------------------------------------------------------------