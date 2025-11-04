USE eShop;

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
),(
    'Pernilla',
    'Oskarsson',
    'pernilla@gmail.com',
    '0730-88776'
),(
    'Per',
    'Morberg',
    'per@gmail.com',
    '070-188776'
);

INSERT INTO Addresses(
    AddressLine,
    PostalCode,
    City
)VALUES(
    'Gatan 1',
    '12345',
    'Småstad'
),
(
    'Storgatan 14',
    '23456',
    'Lingonskogen'
)
,
(
    'Propellergatan 1',
    '44411',
    'Malmö'
),
(
    'Lövhammarsvägen 12',
    '44446',
    'Stenungsund'
),
(
    'Köpmansgatan 34',
    '44431',
    'Stenungsund'
);

INSERT INTO AddressTypes(
    Value
)VALUES(
    'Leverans'
),
(
    'Faktura'
);

INSERT INTO CustomersAddresses(
    CustomerId,
    AddressId,
    AddressTypeId
)VALUES(
    1,
    1,
    1
),(
    2,
    1,
    1
),(
    3,
    2,
    2
),(
    1,
    2,
    2
);

INSERT INTO SalesOrders(
    CustomerId
)VALUES(
    1
),(
    2
),(
    1
),(
    3
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

INSERT INTO Categories(
    CategoryName
)VALUES(
    'Maskiner'
),(
    'Trädgårdsmaskiner'
),(
    'Handverktyg'
),(
    'VVS-maskiner & -verktyg'
),(
    'Tillbehör'
);

INSERT INTO ProductsCategories(
    ProductId,
    CategoryId
)VALUES(
    1,
    2
),(
    2,
    3
),(
    3,
    3
),(
    4,
    3
),(
    5,
    1
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
),(
    1,
    2,
    3,
    4195
),
(
    2,
    1,
    1,
    1995
),
(
    2,
    5,
    1,
    5995
),
(
    3,
    4,
    1,
    1295
),
(
    4,
    4,
    1,
    1295
);

INSERT INTO InvoiceTypes(
    Value
)VALUES(
    'Faktura'
),(
    'Påminnelse'
),(
    'Kredit'
);

INSERT INTO Invoices(
    InvoiceNumber,
    DueDate
)VALUES(
    'A1111111-2',
    '2025-11-27'
);

INSERT INTO OrdersInvoices(
    OrderId,
    InvoiceId,
    InvoiceTypeId
)VALUES(
    1,
    1,
    1
);