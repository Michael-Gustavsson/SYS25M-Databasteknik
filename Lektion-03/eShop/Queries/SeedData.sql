INSERT INTO Customers(
    FirstName,
    LastName,
    Email,
    Phone
)VALUES(
    'Michael',
    'Gustavsson',
    'michael@gmail.com',
    '0702-223344'
);

INSERT INTO Customers(
    FirstName,
    LastName,
    Email,
    Phone
)VALUES(
    'Pernilla',
    'Oskarsson',
    'pernilla@gmail.com',
    '0730-88776'
);

INSERT INTO Customers(
    FirstName,
    LastName,
    Email,
    Phone
)VALUES(
    'Per',
    'Morberg',
    'per@gmail.com',
    '070-188776'
);

INSERT INTO SalesOrders(
    CustomerId
)VALUES(
    1
);

INSERT INTO AddressTypes(
    Value
)VALUES(
    'Leverans'
),
(
    'Faktura'
);

INSERT INTO Addresses(
    CustomerId,
    AddressTypeId,
    AddressLine,
    PostalCode,
    City
)VALUES(
    1,
    1,
    'Gatan 1',
    '12345',
    'Småstad'
),
(
    2,
    2,
    'Storgatan 14',
    '23456',
    'Lingonskogen'
);

INSERT INTO Products(
    ItemNumber,
    Name,
    Price
)VALUES(
    'AX-2222233',
    'Lövblås de lux',
    1995
),
(
    'AX-1112244556',
    'Spikpistol Dewalt',
    4995
),
(
    'AX-9993456',
    'Cirkelsåg Bosch',
    2995
),
(
    'AX-4455667',
    'Sticksåg Bosch',
    1295
),(
    'AX-8934567',
    'Bordsåg',
    5995
);

INSERT INTO OrderItems(
    OrderId,
    ProductId,
    Quantity,
    Price
)VALUES(
    1,
    3,
    2,
    1500
);

INSERT INTO OrderItems(
    OrderId,
    ProductId,
    Quantity,
    Price
)VALUES(
    1,
    2,
    3,
    4195
);