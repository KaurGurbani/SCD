
-- SCD TABLE DEFINITIONS

DROP TABLE IF EXISTS DimCustomer;
CREATE TABLE DimCustomer (
    CustomerID INT,
    Name VARCHAR(100),
    Address VARCHAR(100),
    StartDate DATE,
    EndDate DATE,
    CurrentFlag CHAR(1),
    PreviousAddress VARCHAR(100),
    Version INT,
    PRIMARY KEY (CustomerID, Version)
);

DROP TABLE IF EXISTS DimCustomer_History;
CREATE TABLE DimCustomer_History (
    CustomerID INT,
    Name VARCHAR(100),
    Address VARCHAR(100),
    ChangeDate DATE
);
