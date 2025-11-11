START TRANSACTION;

INSERT INTO SalesOrders (CustomerId) VALUES (1);

INSERT INTO
    OrderItems (
        OrderId,
        ProductId,
        Quantity,
        Price
    )
VALUES (6, 3, 2, 1500);

COMMIT;