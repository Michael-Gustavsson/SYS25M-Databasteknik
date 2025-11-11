-- Övning 1.
-- Lista alla kunder som inte lagt någon beställning...
SELECT *
FROM Customers
    LEFT JOIN SalesOrders ON Customers.Id = SalesOrders.CustomerId
WHERE
    SalesOrders.Id IS NULL;

-- Övning 2.
-- Lägg en beställning åt en kund...
INSERT INTO SalesOrders (CustomerId) VALUES (3);
-- Hämta nyligen tillagda beställning kund med id 3...
SELECT * FROM SalesOrders WHERE CustomerId = 3;

-- Skapa en orderrad för beställning med id 8
INSERT INTO
    OrderItems (
        OrderId,
        ProductId,
        Quantity,
        Price
    )
VALUES (8, 2, 1, 1450);

-- Hämta orderrad...
SELECT * FROM OrderItems WHERE OrderId = 8;

-- 2. Hämta ut uppgifter för en beställning med alla kunduppgifter
-- samt ordervärde...
SELECT
    FirstName,
    LastName,
    OrderDate,
    AddressLine,
    PostalCode,
    City,
    PhoneNumber,
    SUM(
        OrderItems.Quantity * OrderItems.Price
    ) AS OrderValue
FROM
    Customers
    INNER JOIN SalesOrders ON Customers.Id = SalesOrders.CustomerId
    INNER JOIN OrderItems ON SalesOrders.Id = OrderItems.OrderId
    INNER JOIN CustomersAddresses ON Customers.Id = CustomersAddresses.CustomerId
    INNER JOIN Addresses ON CustomersAddresses.AddressId = Addresses.Id
    INNER JOIN PostalCodes ON Addresses.PostalCodeId = PostalCodes.Id
    INNER JOIN Cities ON PostalCodes.CityId = Cities.Id
    INNER JOIN CustomersPhones ON Customers.Id = CustomersPhones.CustomerId
    INNER JOIN PhoneNumbers ON CustomersPhones.PhoneId = PhoneNumbers.Id
WHERE
    SalesOrders.Id = 5
    AND AddressTypeId = 2
GROUP BY
    FirstName,
    LastName,
    OrderDate,
    AddressLine,
    PostalCode,
    City,
    PhoneNumber

SELECT
    FirstName,
    LastName,
    OrderDate,
    AddressLine,
    PostalCode,
    City,
    PhoneNumber,
    SUM(
        OrderItems.Quantity * OrderItems.Price
    ) AS OrderValue
FROM
    Customers
    INNER JOIN SalesOrders ON Customers.Id = SalesOrders.CustomerId
    INNER JOIN OrderItems ON SalesOrders.Id = OrderItems.OrderId
    INNER JOIN CustomersAddresses ON Customers.Id = CustomersAddresses.CustomerId
    INNER JOIN Addresses ON CustomersAddresses.AddressId = Addresses.Id
    INNER JOIN PostalCodes ON Addresses.PostalCodeId = PostalCodes.Id
    INNER JOIN Cities ON PostalCodes.CityId = Cities.Id
    INNER JOIN CustomersPhones ON Customers.Id = CustomersPhones.CustomerId
    INNER JOIN PhoneNumbers ON CustomersPhones.PhoneId = PhoneNumbers.Id
WHERE
    AddressTypeId = 1
GROUP BY
    FirstName,
    LastName,
    OrderDate,
    AddressLine,
    PostalCode,
    City,
    PhoneNumber
HAVING
    OrderValue < 3500

-- 3. Skapa en fråga som returnerar orderrader för beställning med id 8
SELECT
    ItemNumber,
    Name,
    Quantity,
    OrderItems.Price,
    Quantity * OrderItems.Price as LineSum
FROM
    OrderItems
    INNER JOIN SalesOrders ON OrderItems.OrderId = SalesOrders.Id
    INNER JOIN Products ON OrderItems.ProductId = Products.Id
WHERE
    SalesOrders.Id = 8;

--Övning 4.
-- 1.
UPDATE Products SET Price = Price * 1.05 WHERE Id = 1;

SELECT * FROM Products

-- 2.
SELECT * FROM OrderItems WHERE OrderId = 8;

SELECT * FROM SalesOrders;

SELECT * FROM OrderItems WHERE OrderId = 8 AND ProductId = 2;

UPDATE OrderItems
SET
    Quantity = 2
WHERE
    OrderId = 8
    AND ProductId = 2;

UPDATE OrderItems
SET
    Quantity = 1
WHERE
    OrderId = 8
    AND ProductId = 2;