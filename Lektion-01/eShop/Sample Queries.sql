-- Sample Queries...
SELECT * FROM Customers;
SELECT Id, FirstName FROM Customers;
SELECT Id, FirstName,LastName FROM Customers
WHERE Id = 3;

SELECT * FROM Orders;

-- UPDATE QUERIES...
UPDATE Customers SET Email = 'Eva@gmail.com', Phone = '073-232456';
UPDATE Customers SET Email = 'pelle@gmail.com', Phone = '073-3333333'
    WHERE Id = 2;
UPDATE Customers SET Email = 'michael@gmail.com', Phone = '07-2333333'
    WHERE Id = 1;

-- DELETE QUERIES...
DELETE FROM Orders;

DELETE FROM Customers WHERE Id = 4;

