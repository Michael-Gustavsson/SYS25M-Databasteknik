CREATE TABLE Categories(
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    CategoryName VARCHAR(15) NOT NULL UNIQUE
);

CREATE TABLE ProductsCategory(
    ProductId INTEGER,
    CategoryId INTEGER,
    PRIMARY KEY(ProductId,CategoryId)
);