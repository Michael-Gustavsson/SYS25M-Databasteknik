SELECT * FROM Customers;
SELECT * FROM Customers INNER JOIN SalesOrders
    ON Customers.Id = SalesOrders.CustomerId;

SELECT * FROM Customers INNER JOIN CustomersAddresses
    ON Customers.Id = CustomersAddresses.CustomerId INNER JOIN Addresses
    ON CustomersAddresses.AddressId = Addresses.Id;

SELECT 
    FirstName,
    LastName,
    Email,
    Phone,
    AddressLine,
    PostalCode, 
    City FROM Customers INNER JOIN CustomersAddresses
    ON Customers.Id = CustomersAddresses.CustomerId INNER JOIN Addresses
    ON CustomersAddresses.AddressId = Addresses.Id;
