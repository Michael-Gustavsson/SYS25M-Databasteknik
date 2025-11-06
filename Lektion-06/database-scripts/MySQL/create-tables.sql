DROP TABLE IF EXISTS CustomersAddresses;

DROP TABLE IF EXISTS CustomersEmail;

DROP TABLE IF EXISTS CustomersPhones;

DROP TABLE IF EXISTS SuppliersAddresses;

DROP TABLE IF EXISTS SuppliersPhones;

DROP TABLE IF EXISTS SuppliersEmail;

DROP TABLE IF EXISTS ContactsPhones;

DROP TABLE IF EXISTS PhoneNumbers;

DROP TABLE IF EXISTS Customers;

DROP TABLE IF EXISTS AddressTypes;

DROP TABLE IF EXISTS PostalCodes;

DROP TABLE IF EXISTS Cities;

DROP TABLE IF EXISTS ContactsEmail;

DROP TABLE IF EXISTS Contacts;

DROP TABLE IF EXISTS Suppliers;

DROP TABLE IF EXISTS EmailAddresses;

DROP TABLE IF EXISTS Addresses;

DROP TABLE IF EXISTS OrderItems;

DROP TABLE IF EXISTS OrdersInvoices;

DROP TABLE IF EXISTS ProductsCategories;

DROP TABLE IF EXISTS SalesOrders;

DROP TABLE IF EXISTS Categories;

DROP TABLE IF EXISTS Products;

DROP TABLE IF EXISTS InvoiceTypes;

DROP TABLE IF EXISTS Invoices;

CREATE TABLE Customers (
    Id INTEGER PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(15) NOT NULL,
    LastName VARCHAR(30) NOT NULL
);

CREATE TABLE PhoneNumbers (
    Id INTEGER PRIMARY KEY AUTO_INCREMENT,
    PhoneNumber VARCHAR(25) NOT NULL UNIQUE
);

CREATE TABLE CustomersPhones (
    CustomerId INTEGER,
    PhoneId INTEGER,
    PRIMARY KEY (CustomerId, PhoneId),
    FOREIGN KEY (CustomerId) REFERENCES Customers (Id),
    FOREIGN KEY (PhoneId) REFERENCES PhoneNumbers (Id)
);

CREATE TABLE EmailAddresses (
    Id INTEGER PRIMARY KEY AUTO_INCREMENT,
    Email VARCHAR(80) NOT NULL UNIQUE
);

CREATE TABLE CustomersEmail (
    CustomerId INTEGER,
    EmailId INTEGER,
    PRIMARY KEY (CustomerId, EmailId),
    FOREIGN KEY (CustomerId) REFERENCES Customers (Id),
    FOREIGN KEY (EmailId) REFERENCES EmailAddresses (Id)
);

CREATE TABLE Suppliers (
    Id INTEGER PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(80) NOT NULL UNIQUE
);

CREATE TABLE SuppliersPhones (
    SupplierId INTEGER,
    PhoneId INTEGER,
    PRIMARY KEY (SupplierId, PhoneId),
    FOREIGN KEY (SupplierId) REFERENCES Suppliers (Id),
    FOREIGN KEY (PhoneId) REFERENCES PhoneNumbers (Id)
)

CREATE TABLE Contacts (
    Id INTEGER PRIMARY KEY AUTO_INCREMENT,
    SupplierId INTEGER NOT NULL,
    FirstName VARCHAR(40) NOT NULL,
    LastName VARCHAR(60) NOT NULL,
    FOREIGN KEY (SupplierId) REFERENCES Suppliers (Id)
);

CREATE TABLE ContactsEmail (
    ContactId INTEGER,
    EmailId INTEGER,
    PRIMARY KEY (ContactId, EmailId),
    FOREIGN KEY (ContactId) REFERENCES Contacts (Id),
    FOREIGN KEY (EmailId) REFERENCES EmailAddresses (Id)
);

CREATE TABLE SuppliersEmail (
    SupplierId INTEGER,
    EmailId INTEGER,
    PRIMARY KEY (SupplierId, EmailId),
    FOREIGN KEY (SupplierId) REFERENCES Suppliers (Id),
    FOREIGN KEY (EmailId) REFERENCES EmailAddresses (Id)
);

CREATE TABLE Cities (
    Id INTEGER PRIMARY KEY AUTO_INCREMENT,
    City VARCHAR(80) NOT NULL UNIQUE
);

CREATE TABLE PostalCodes (
    Id INTEGER PRIMARY KEY AUTO_INCREMENT,
    PostalCode VARCHAR(5) NOT NULL UNIQUE,
    CityId INTEGER NOT NULL,
    FOREIGN KEY (CityId) REFERENCES Cities (Id)
);

CREATE TABLE Addresses (
    Id INTEGER PRIMARY KEY AUTO_INCREMENT,
    AddressLine VARCHAR(40) NOT NULL,
    PostalCodeId INTEGER NOT NULL
);

CREATE TABLE AddressTypes (
    Id INTEGER PRIMARY KEY AUTO_INCREMENT,
    Value VARCHAR(15) NOT NULL UNIQUE
);

CREATE TABLE CustomersAddresses (
    CustomerId INTEGER,
    AddressId INTEGER,
    AddressTypeId INTEGER,
    PRIMARY KEY (
        CustomerId,
        AddressId,
        AddressTypeId
    ),
    FOREIGN KEY (CustomerId) REFERENCES Customers (Id),
    FOREIGN KEY (AddressId) REFERENCES Addresses (Id),
    FOREIGN KEY (AddressTypeId) REFERENCES AddressTypes (Id)
);

CREATE TABLE SuppliersAddresses (
    SupplierId INTEGER,
    AddressId INTEGER,
    PRIMARY KEY (SupplierId, AddressId),
    FOREIGN KEY (SupplierId) REFERENCES Suppliers (Id),
    FOREIGN KEY (AddressId) REFERENCES Addresses (Id)
);

CREATE TABLE ContactsPhones (
    ContactId INTEGER,
    PhoneId INTEGER,
    PRIMARY KEY (ContactId, PhoneId),
    FOREIGN KEY (ContactId) REFERENCES Contacts (Id),
    FOREIGN KEY (PhoneId) REFERENCES PhoneNumbers (Id)
);

CREATE TABLE SalesOrders (
    Id INTEGER PRIMARY KEY AUTO_INCREMENT,
    OrderDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    CustomerId INTEGER
);

CREATE TABLE Products (
    Id INTEGER PRIMARY KEY AUTO_INCREMENT,
    ItemNumber VARCHAR(20) NOT NULL UNIQUE,
    Name VARCHAR(60) NOT NULL,
    Description VARCHAR(256) NULL,
    Price FLOAT NOT NULL
);

CREATE TABLE Categories (
    Id INTEGER PRIMARY KEY AUTO_INCREMENT,
    CategoryName VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE ProductsCategories (
    ProductId INTEGER,
    CategoryId INTEGER,
    PRIMARY KEY (ProductId, CategoryId),
    FOREIGN KEY (ProductId) REFERENCES Products (Id),
    FOREIGN KEY (CategoryId) REFERENCES Categories (Id)
);

CREATE TABLE OrderItems (
    OrderId INTEGER,
    ProductId INTEGER,
    Quantity INTEGER NOT NULL,
    Price FLOAT NOT NULL,
    PRIMARY KEY (OrderId, ProductId),
    FOREIGN KEY (ProductId) REFERENCES Products (Id),
    FOREIGN KEY (OrderId) REFERENCES SalesOrders (Id)
);

CREATE TABLE InvoiceTypes (
    Id INTEGER PRIMARY KEY AUTO_INCREMENT,
    Value VARCHAR(15) NOT NULL UNIQUE
);

CREATE TABLE Invoices (
    Id INTEGER PRIMARY KEY AUTO_INCREMENT,
    InvoiceNumber VARCHAR(20) NOT NULL UNIQUE,
    InvoiceDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    DueDate DATETIME NOT NULL
);

CREATE TABLE OrdersInvoices (
    OrderId INTEGER,
    InvoiceId INTEGER,
    InvoiceTypeId INTEGER,
    PRIMARY KEY (
        OrderId,
        InvoiceId,
        InvoiceTypeId
    ),
    FOREIGN KEY (OrderId) REFERENCES SalesOrders (Id),
    FOREIGN KEY (InvoiceId) REFERENCES Invoices (Id),
    FOREIGN KEY (InvoiceTypeId) REFERENCES InvoiceTypes (Id)
);