 -- Database Queries

-- Find all customers with postal code 1010
SELECT * FROM Customers WHERE postalCode = '1010'
 -- Find the phone number for the supplier with the id 11
  SELECT Phone FROM Suppliers WHERE  SupplerID = '11'

-- List first 10 orders placed, sorted descending by the order date
SELECT * FROM Orders ORDER BY OrderDate desc LIMIT 10
-- Find all customers that live in London, Madrid, or Brazil
SELECT * FROM Customers WHERE CITY in ("London", "Madrid") OR Country = "Brazil"
-- Add a customer record for "The Shire", the contact name is "Bilbo Baggins" the address is -"1 Hobbit-Hole" in "Bag End", postal code "111" and the country is "Middle Earth"
INSERT INTO Customers (CustomerName,  ContactName, address, City, postalCode, Country)
values( "The Shire", "Bilbo Baggins", "1 Hobbit-Hole",  "Bag End", 111, "Middle Earth")
-- Update Bilbo Baggins record so that the postal code changes to "11122"
UPDATE Customers SET PostalCode ='11122' WHERE ContactName = "Bilbo Baggins"
-- (Stretch) Find a query to discover how many different cities are stored in the Customers table. Repeats should not be double counted
SELECT COUNT (distinct(City)) FROM Customers
-- (Stretch) Find all suppliers who have names longer than 20 characters. You can use `length(SupplierName)` to get the length of the name
SELECT * FROM Suppliers WHERE length (SupplierName)>20
-- Find all customers with postal code 1010

-- Find the phone number for the supplier with the id 11

-- List first 10 orders placed, sorted descending by the order date

-- Find all customers that live in London, Madrid, or Brazil

-- Add a customer record for "The Shire", the contact name is "Bilbo Baggins" the address is -"1 Hobbit-Hole" in "Bag End", postal code "111" and the country is "Middle Earth"

-- Update Bilbo Baggins record so that the postal code changes to "11122"

-- (Stretch) Find a query to discover how many different cities are stored in the Customers table. Repeats should not be double counted

-- (Stretch) Find all suppliers who have names longer than 20 characters. You can use `length(SupplierName)` to get the length of the name
