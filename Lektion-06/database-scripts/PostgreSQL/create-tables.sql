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

DROP TABLE IF EXISTS ContactsEmail;

DROP TABLE IF EXISTS Contacts;

DROP TABLE IF EXISTS Suppliers;

DROP TABLE IF EXISTS EmailAddresses;

DROP TABLE IF EXISTS Addresses;

DROP TABLE IF EXISTS PostalCodes;

DROP TABLE IF EXISTS Cities;

DROP TABLE IF EXISTS OrderItems;

DROP TABLE IF EXISTS OrdersInvoices;

DROP TABLE IF EXISTS ProductsCategories;

DROP TABLE IF EXISTS SalesOrders;

DROP TABLE IF EXISTS Categories;

DROP TABLE IF EXISTS Products;

DROP TABLE IF EXISTS InvoiceTypes;

DROP TABLE IF EXISTS Invoices;

CREATE TABLE Customers (
    Id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    FirstName VARCHAR(15) NOT NULL,
    LastName VARCHAR(30) NOT NULL
);

CREATE TABLE PhoneNumbers (
    Id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    PhoneNumber VARCHAR(25) NOT NULL UNIQUE
);

CREATE TABLE CustomersPhones (
    CustomerId INT,
    PhoneId INT,
    PRIMARY KEY (CustomerId, PhoneId),
    FOREIGN KEY (CustomerId) REFERENCES Customers (Id),
    FOREIGN KEY (PhoneId) REFERENCES PhoneNumbers (Id)
);

CREATE TABLE EmailAddresses (
    Id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Email VARCHAR(80) NOT NULL UNIQUE
);

CREATE TABLE CustomersEmail (
    CustomerId INT,
    EmailId INT,
    PRIMARY KEY (CustomerId, EmailId),
    FOREIGN KEY (CustomerId) REFERENCES Customers (Id),
    FOREIGN KEY (EmailId) REFERENCES EmailAddresses (Id)
);

CREATE TABLE Suppliers (
    Id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Name VARCHAR(80) NOT NULL UNIQUE
);

CREATE TABLE SuppliersPhones (
    SupplierId INT,
    PhoneId INT,
    PRIMARY KEY (SupplierId, PhoneId),
    FOREIGN KEY (SupplierId) REFERENCES Suppliers (Id),
    FOREIGN KEY (PhoneId) REFERENCES PhoneNumbers (Id)
);

CREATE TABLE Contacts (
    Id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    SupplierId INT NOT NULL,
    FirstName VARCHAR(40) NOT NULL,
    LastName VARCHAR(60) NOT NULL,
    FOREIGN KEY (SupplierId) REFERENCES Suppliers (Id)
);

CREATE TABLE ContactsEmail (
    ContactId INT,
    EmailId INT,
    PRIMARY KEY (ContactId, EmailId),
    FOREIGN KEY (ContactId) REFERENCES Contacts (Id),
    FOREIGN KEY (EmailId) REFERENCES EmailAddresses (Id)
);

CREATE TABLE SuppliersEmail (
    SupplierId INT,
    EmailId INT,
    PRIMARY KEY (SupplierId, EmailId),
    FOREIGN KEY (SupplierId) REFERENCES Suppliers (Id),
    FOREIGN KEY (EmailId) REFERENCES EmailAddresses (Id)
);

CREATE TABLE Cities (
    Id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    City VARCHAR(80) NOT NULL UNIQUE
);

CREATE TABLE PostalCodes (
    Id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    PostalCode VARCHAR(5) NOT NULL UNIQUE,
    CityId INT NOT NULL,
    FOREIGN KEY (CityId) REFERENCES Cities (Id)
);

CREATE TABLE Addresses (
    Id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    AddressLine VARCHAR(40) NOT NULL,
    PostalCodeId INT NOT NULL,
    FOREIGN KEY (PostalCodeId) REFERENCES PostalCodes (Id)
);

CREATE TABLE AddressTypes (
    Id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
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
    SupplierId INT,
    AddressId INT,
    PRIMARY KEY (SupplierId, AddressId),
    FOREIGN KEY (SupplierId) REFERENCES Suppliers (Id),
    FOREIGN KEY (AddressId) REFERENCES Addresses (Id)
);

CREATE TABLE ContactsPhones (
    ContactId INT,
    PhoneId INT,
    PRIMARY KEY (ContactId, PhoneId),
    FOREIGN KEY (ContactId) REFERENCES Contacts (Id),
    FOREIGN KEY (PhoneId) REFERENCES PhoneNumbers (Id)
);

CREATE TABLE SalesOrders (
    Id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    OrderDate DATE DEFAULT CURRENT_TIMESTAMP,
    CustomerId INTEGER
);

CREATE TABLE Products (
    Id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    ItemNumber VARCHAR(20) NOT NULL UNIQUE,
    Name VARCHAR(60) NOT NULL,
    Description VARCHAR(256) NULL,
    Price FLOAT NOT NULL
);

CREATE TABLE Categories (
    Id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
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
    Id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Value VARCHAR(15) NOT NULL UNIQUE
);

CREATE TABLE Invoices (
    Id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    InvoiceNumber VARCHAR(20) NOT NULL UNIQUE,
    InvoiceDate DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    DueDate DATE NOT NULL
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