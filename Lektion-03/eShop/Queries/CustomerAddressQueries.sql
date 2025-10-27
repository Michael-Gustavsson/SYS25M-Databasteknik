SELECT
    FirstName || ' ' || LastName AS 'Fullname',
    Email,
    Phone,
    AddressLine || ' ' || PostalCode || ' ' || City AS 'Address',
    Value AS 'Addresstype'
FROM Customers INNER JOIN CustomersAddresses
    ON Customers.Id = CustomersAddresses.CustomerId INNER JOIN Addresses
    ON CustomersAddresses.AddressId = Addresses.Id INNER JOIN AddressTypes
    ON CustomersAddresses.AddressTypeId = AddressTypes.Id;