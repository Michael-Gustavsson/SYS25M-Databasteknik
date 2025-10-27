SELECT
    OrderId,
    InvoiceNumber,
    InvoiceDate,
    DueDate,
    OrderDate,
    Value AS 'InvoiceType'
FROM Invoices INNER JOIN OrdersInvoices
    ON Invoices.Id = OrdersInvoices.InvoiceId INNER JOIN SalesOrders
    ON OrdersInvoices.OrderId = SalesOrders.Id INNER JOIN InvoiceTypes
    ON OrdersInvoices.InvoiceTypeId = InvoiceTypes.Id;

SELECT
    SalesOrders.Id,
    OrderDate,
    ItemNumber,
    Name,
    OrderItems.Price,
    Quantity
FROM SalesOrders INNER JOIN OrderItems
    ON SalesOrders.Id = OrderItems.OrderId INNER JOIN Products
    ON OrderItems.ProductId = Products.Id
WHERE OrderId = 1;