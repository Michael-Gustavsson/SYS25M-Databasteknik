SELECT
    SalesOrders.Id,
    OrderDate,
    FirstName,
    LastName,
    Email,
    Phone
    AddressLine,
    PostalCode,
    City
FROM SalesOrders INNER JOIN Customers
    ON SalesOrders.CustomerId = Customers.Id INNER JOIN CustomersAddresses
    ON Customers.Id = CustomersAddresses.CustomerId INNER JOIN Addresses
    ON CustomersAddresses.AddressId = Addresses.Id
WHERE SalesOrders.Id = 1 AND CustomersAddresses.AddressTypeId = 1;

SELECT
    ItemNumber,
    Name AS Product,
    Quantity,
    OrderItems.Price,
    Quantity *  OrderItems.Price AS LineSum
FROM SalesOrders INNER JOIN OrderItems
    ON OrderItems.OrderId = SalesOrders.Id INNER JOIN Products
    ON OrderItems.ProductId = Products.Id
WHERE SalesOrders.Id = 1;