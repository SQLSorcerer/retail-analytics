-- Create Dimensions Tables

CREATE TABLE Invoice (
    InvoiceNo INT PRIMARY KEY,
    InvoiceDate DATE,
    CustomerID INT,
    Country STRING,
    -- Add other attributes as needed
);

CREATE TABLE Product (
    StockCode INT PRIMARY KEY,
    Description STRING,
    UnitPrice DECIMAL(10, 2),
    -- Add other attributes as needed
);

CREATE TABLE InvoiceLine (
    InvoiceLineID INT PRIMARY KEY,
    InvoiceNo INT,
    StockCode INT,
    Quantity INT,
    UnitPrice DECIMAL(10, 2),
    FOREIGN KEY (InvoiceNo) REFERENCES Invoice(InvoiceNo),
    FOREIGN KEY (StockCode) REFERENCES Product(StockCode)
    -- Add other attributes as needed
);

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    Country STRING,
    -- Add other attributes as needed
);


-- Create Fact Table

CREATE TABLE FactSales (
    InvoiceLineID INT PRIMARY KEY,
    InvoiceNo INT,
    StockCode INT,
    Quantity INT,
    UnitPrice DECIMAL(10, 2),
    InvoiceDate DATE,
    CustomerID INT,
    Country STRING,
    FOREIGN KEY (InvoiceLineID) REFERENCES InvoiceLine(InvoiceLineID)
    -- Add other attributes as needed
);
