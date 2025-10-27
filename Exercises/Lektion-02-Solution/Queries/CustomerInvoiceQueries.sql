SELECT
    FirstName || ' ' || LastName AS Customername,
    Email,
    Phone,
    OrderDate,
    InvoiceDate,
    InvoiceNumber,
    DueDate,
    ItemNumber,
    Name,
    OrderItems.Price
FROM Customers INNER JOIN SalesOrders
    ON Customers.Id = SalesOrders.CustomerId INNER JOIN OrderItems
    ON SalesOrders.Id = OrderItems.OrderId INNER JOIN Products
    ON OrderItems.ProductId = Products.Id INNER JOIN Invoices
    ON SalesOrders.Id = Invoices.OrderId;
