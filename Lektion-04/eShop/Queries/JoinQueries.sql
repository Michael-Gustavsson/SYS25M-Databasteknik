SELECT
    FirstName || ' ' || LastName AS 'CustomerName',    
    Email AS 'E-Post',
    OrderDate,
    SalesOrders.Id AS 'OrderNumber',
    ItemNumber,
    Name,
    Quantity,
    OrderItems.Price
FROM Customers INNER JOIN SalesOrders
    ON Customers.Id = SalesOrders.CustomerId INNER JOIN OrderItems
    ON SalesOrders.Id = OrderItems.OrderId INNER JOIN Products
    ON OrderItems.ProductId = Products.Id;