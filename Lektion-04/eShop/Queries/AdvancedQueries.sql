SELECT * FROM Products;

--Limit rows...
SELECT * FROM Products LIMIT 2;

-- Where ...
SELECT * FROM Products
WHERE Id = 1; -- = betyder exakt matchning...

SELECT * FROM Products
WHERE ItemNumber = 'AX-4455667';

SELECT * FROM Products
WHERE Price = 4995;

-- Where with AND...
SELECT * FROM Products;

SELECT * FROM Products
WHERE ItemNumber = 'AX-9993456' AND Price = 2995; -- Med AND MÅSTE ALLA uttryck vara sanna...

SELECT * FROM Products
WHERE ItemNumber = 'AX-999345' OR Price = 1295; 
-- Med OR BEHÖVER bara ett uttryck vara sant för att få tillbaka ett resultat...

-- Where med IN...
SELECT * FROM Products
WHERE Id = 1 OR Id = 2 OR Id=4 OR Id=3;

SELECT * FROM Products
WHERE Id IN(1,2,4,3);

SELECT * FROM Products
WHERE Price IN(2995,1295,4995);

-- Where med BETWEEN range operator...
SELECT * FROM Products;
SELECT * FROM Products
WHERE Price BETWEEN 1500 AND 3000;

SELECT * FROM Products
WHERE Price >= 1100 AND Price <= 3000;

-- Fritext sökning med Where...
SELECT * FROM Products
WHERE Name LIKE '%såg%';

SELECT * FROM Products
WHERE Name LIKE 'c%';

SELECT * FROM Products
WHERE Name LIKE '%bosch';

SELECT * FROM Products
WHERE Name LIKE '%dewalt';

SELECT * FROM Products
WHERE Name LIKE '_övblås de lux';

-- where with NULL och NOT NULL
SELECT * FROM Products
WHERE Description IS NULL;

-- UPDATE Products SET Description = 'Test beskrivning'
-- WHERE Id IN(1,3,5);

SELECT * FROM Products
WHERE Description IS NOT NULL;

-- Uppgift är att skapa en faktura där vi summerar varje orderrad...
-- Presentera faktura/orderrader på en faktura...
SELECT
    ItemNumber,
    Name,
    Quantity,
    OrderItems.Price,
    Quantity * OrderItems.Price AS LineSum
FROM Invoices INNER JOIN OrdersInvoices
    ON Invoices.Id = OrdersInvoices.InvoiceId INNER JOIN SalesOrders
    ON OrdersInvoices.OrderId = SalesOrders.Id INNER JOIN OrderItems
    ON SalesOrders.Id = OrderItems.OrderId INNER JOIN Products
    ON OrderItems.ProductId = Products.Id;

-- Visa faktura huvudet samt totalt fakturavärde...
SELECT
    InvoiceNumber,
    InvoiceDate,
    DueDate,
    OrderDate,
    FirstName || ' ' || LastName AS Customername,
    Email,
    Phone,
    SUM(Quantity * OrderItems.Price) AS InvoiceValue
FROM Invoices INNER JOIN OrdersInvoices
    ON Invoices.Id = OrdersInvoices.InvoiceId INNER JOIN SalesOrders
    ON OrdersInvoices.OrderId = SalesOrders.Id INNER JOIN OrderItems
    ON SalesOrders.Id = OrderItems.OrderId INNER JOIN Products
    ON OrderItems.ProductId = Products.Id INNER JOIN Customers
    ON Customers.Id = SalesOrders.CustomerId;