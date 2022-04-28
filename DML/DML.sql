--DML (Data Manipulation Language)
--SELECT
--Select statement is used to retrieve objects from SQL database.

SELECT * FROM Products

--Also we can filter the data we want to see;

SELECT ProductID,ProductName,UnitsInStock FROM Products

 --UPDATE
 --UPDATE statement is used to modify the existing records in a table.

 UPDATE Shippers
 SET Phone ='(212)999-66-99'
 WHERE ShipperID = 4

--INSERT
--INSERT statement is used to add new rows of data to a table in database.
 
 INSERT Shippers (CompanyName,Phone) VALUES ('Pazuzu Shipment','(212)666-99-66')

 --DELETE
 --DELETE statement is used to delete existing records in a table.

DELETE FROM Shippers WHERE ShipperID = 4

--also we can delete all data stored in table without deleting the table.

DELETE FROM Shippers
