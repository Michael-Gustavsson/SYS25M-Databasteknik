SELECT * FROM Customers;
SELECT * FROM SalesOrders;

SELECT * FROM Customers INNER JOIN SalesOrders
    ON Customers.Id = SalesOrders.CustomerId;

SELECT * FROM Customers LEFT JOIN SalesOrders
    ON Customers.Id = SalesOrders.CustomerId;

SELECT * FROM Customers RIGHT JOIN SalesOrders
    ON Customers.Id = SalesOrders.CustomerId;

SELECT * FROM Customers FULL JOIN SalesOrders
    ON Customers.Id = SalesOrders.CustomerId;

SELECT * FROM Customers LEFT JOIN Addresses
    ON Customers.Id = Addresses.CustomerId;

SELECT FirstName,LastName,Email,Phone,AddressLine,PostalCode, City FROM Customers LEFT JOIN Addresses
    ON Customers.Id = Addresses.CustomerId;

SELECT * FROM Customers INNER JOIN Addresses
    ON Customers.Id = Addresses.CustomerId INNER JOIN SalesOrders
    ON Customers.Id = SalesOrders.CustomerId;


