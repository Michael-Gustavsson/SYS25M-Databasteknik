SELECT
    FirstName || ' ' || LastName AS 'Fullname',
    Email,
    Phone,
    AddressLine || ' ' || PostalCode || ' ' || City AS 'Address',
    Value AS 'Addresstype'
FROM Customers INNER JOIN Addresses
    ON Addresses.CustomerId = Customers.Id INNER JOIN AddressTypes
    ON Addresses.AddressTypeId = AddressTypes.Id