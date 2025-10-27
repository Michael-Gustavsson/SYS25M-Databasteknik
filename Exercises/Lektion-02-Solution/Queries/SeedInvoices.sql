DELETE FROM Invoices;

INSERT INTO Invoices(
    OrderId,
    InvoiceNumber,
    DueDate
)VALUES(
    1,
    'A1111111-2',
    datetime('2025-10-27','+20 days')
);
