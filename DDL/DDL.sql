--DDL (Data Definition Language)
--CREATE 
--CREATE query is used to create a database or objects such as tables, stored procedures etc.
CREATE  DATABASE testDB

CREATE TABLE Persons (
	PersonID int,
    LastName varchar(25),
    FirstName varchar(25),
    Address varchar(255),
    City varchar(255)
)

--ALTER
--ALTER query is used to add, delete or modify objects such as tables, stored procedures etc.

--Adds a new column
ALTER TABLE Persons
add Email nvarchar(255)

--Updates column named "City"
ALTER TABLE Persons
ALTER COLUMN City nvarchar (200)

--DROP
--DROP query is used to delete objects such as tables, columns, stored precedures etc.

--Deletes a column in a table. While drop deletes a column, table is being updated by deleted  one of it's objects..
ALTER TABLE Persons
drop column Email

--Deletes table 

DROP TABLE Persons

--Deletes database itself

DROP DATABASE testDB

