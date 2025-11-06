INSERT INTO
    Customers (FirstName, LastName)
VALUES ('Michael', 'Gustavsson'),
    ('Pernilla', 'Oskarsson'),
    ('Per', 'Morberg');

INSERT INTO
    Suppliers (Name)
VALUES ('Bosch'),
    ('Milwaukee'),
    ('Dewalt');

INSERT INTO
    Contacts (
        FirstName,
        LastName,
        SupplierId
    )
VALUES ('Helene', 'Oskarsson', 3),
    ('Evert', 'Ljusberg', 1),
    ('Bertil', 'Bertilsson', 2);

INSERT INTO
    PhoneNumbers (PhoneNumber)
VALUES ('070-2190871'),
    ('073-8880687'),
    ('070-2954599'),
    ('070-2222222'),
    ('070-3333333'),
    ('070-4444444'),
    ('08-10101010'),
    ('040-20202020'),
    ('08-30303030');

INSERT INTO
    CustomersPhones (CustomerId, PhoneId)
VALUES (1, 1),
    (2, 2),
    (3, 3);

INSERT INTO
    SuppliersPhones (SupplierId, PhoneId)
VALUES (1, 4),
    (2, 5),
    (3, 6);

INSERT INTO
    ContactsPhones (ContactId, PhoneId)
VALUES (1, 7),
    (2, 8),
    (3, 9);

INSERT INTO
    Cities (City)
VALUES ('Småstad'),
    ('Lingonskogen'),
    ('Malmö'),
    ('Stenungsund'),
    ('Stockholm');

INSERT INTO
    PostalCodes (PostalCode, CityId)
VALUES ('12345', 1),
    ('23456', 2),
    ('21100', 3),
    ('44431', 4),
    ('10084', 5),
    ('10065', 5),
    ('21184', 3);

INSERT INTO
    Addresses (AddressLine, PostalCodeId)
VALUES ('Gatan 1', 1),
    ('Storgatan 14', 2),
    ('Propellergatan 1', 3),
    ('Lövhammarsvägen 12', 4),
    ('Köpmansgatan 34', 5),
    ('Storgatan 14', 5),
    ('Sjömansvägen 34', 6),
    ('Propellergatan 1', 7);

INSERT INTO
    AddressTypes (Value)
VALUES ('Leverans'),
    ('Faktura');

INSERT INTO
    CustomersAddresses (
        CustomerId,
        AddressId,
        AddressTypeId
    )
VALUES (1, 1, 1),
    (2, 1, 1),
    (3, 2, 2),
    (1, 2, 2);

INSERT INTO
    SuppliersAddresses (SupplierId, AddressId)
VALUES (1, 6),
    (2, 8),
    (3, 7);

INSERT INTO
    EmailAddresses (Email)
VALUES ('michael@gmail.com'),
    ('pernilla@gmail.com'),
    ('per@gmail.com'),
    ('helene.oskarsson@dewalt.com'),
    ('evert.ljusberg@bosch.com'),
    (
        'bertil.bertilsson@milwaukee.com'
    ),
    ('info@bosch.com'),
    ('info@dewalt.com'),
    ('info@milwaukee.com');

INSERT INTO
    CustomersEmail (CustomerId, EmailId)
VALUES (1, 1),
    (2, 2),
    (3, 3);

INSERT INTO
    ContactsEmail (ContactId, EmailId)
VALUES (1, 4),
    (2, 5),
    (3, 6);

INSERT INTO
    SuppliersEmail (SupplierId, EmailId)
VALUES (1, 7),
    (2, 9),
    (3, 8);

INSERT INTO
    SalesOrders (CustomerId)
VALUES (1),
    (2),
    (1),
    (3);

INSERT INTO
    Products (ItemNumber, Name, Price)
VALUES (
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
    ),
    ('AX-8934567', 'Bordsåg', 5995);

INSERT INTO
    Categories (CategoryName)
VALUES ('Maskiner'),
    ('Trädgårdsmaskiner'),
    ('Handverktyg'),
    ('VVS-maskiner & -verktyg'),
    ('Tillbehör');

INSERT INTO
    ProductsCategories (ProductId, CategoryId)
VALUES (1, 2),
    (2, 3),
    (3, 3),
    (4, 3),
    (5, 1);

INSERT INTO
    OrderItems (
        OrderId,
        ProductId,
        Quantity,
        Price
    )
VALUES (1, 3, 2, 1500),
    (1, 2, 3, 4195),
    (2, 1, 1, 1995),
    (2, 5, 1, 5995),
    (3, 4, 1, 1295),
    (4, 4, 1, 1295);

INSERT INTO
    InvoiceTypes (Value)
VALUES ('Faktura'),
    ('Påminnelse'),
    ('Kredit');

INSERT INTO
    Invoices (InvoiceNumber, DueDate)
VALUES ('A1111111-2', '2025-11-27');

INSERT INTO
    OrdersInvoices (
        OrderId,
        InvoiceId,
        InvoiceTypeId
    )
VALUES (1, 1, 1);