-- Simple subqueries...
SELECT OrderId, ProductId
FROM OrderItems
WHERE
    Price IN (
        SELECT MAX(Price)
        FROM OrderItems
    );

SELECT OrderId, ProductId
FROM OrderItems
WHERE
    Price > (
        SELECT AVG(Price)
        FROM OrderItems
    );

-- Correlated subqueries...
SELECT *
FROM SalesOrders
    INNER JOIN Customers ON SalesOrders.CustomerId = Customers.Id

SELECT OrderDate, CustomerId
FROM SalesOrders AS O
WHERE
    EXISTS (
        SELECT *
        FROM Customers AS C
        WHERE
            C.Id = O.CustomerId
    );

-- INSERT INTO
--     Customers (FirstName, LastName)
-- VALUES ('Annika', 'Gustavsson');

SELECT *
FROM Customers AS C
WHERE
    NOT EXISTS (
        SELECT *
        FROM SalesOrders AS O
        WHERE
            C.Id = O.CustomerId
    );