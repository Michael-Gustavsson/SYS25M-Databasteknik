DELETE FROM InvoiceTypes;

INSERT INTO InvoiceTypes(
    Value
)VALUES(
    'Faktura'
),(
    'Påminnelse'
),(
    'Kredit'
);

DELETE FROM Invoices;

INSERT INTO Invoices(
    InvoiceNumber,
    DueDate
)VALUES(
    'A1111111-2',
    datetime('2025-10-27','+20 days')
);

DELETE FROM OrdersInvoices;

INSERT INTO OrdersInvoices(
    OrderId,
    InvoiceId,
    InvoiceTypeId
)VALUES(
    1,
    1,
    1
);