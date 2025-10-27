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
    OrderId,
    InvoiceTypeId,
    InvoiceNumber,
    DueDate
)VALUES(
    1,
    1,
    'A1111111-2',
    datetime('2025-10-27','+20 days')
);
