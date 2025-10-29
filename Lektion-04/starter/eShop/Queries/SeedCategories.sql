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

INSERT INTO ProductsCategory(
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