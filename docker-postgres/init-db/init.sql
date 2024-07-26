-- init.sql

-- Enable the UUID extension for generating UUIDs
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Drop tables if they already exist
DROP TABLE IF EXISTS CustomerAddress;
DROP TABLE IF EXISTS Customer;

-- Create the Customer table
CREATE TABLE Customer (
    CustomerID UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100)
);

-- Create the CustomerAddress table
CREATE TABLE CustomerAddress (
    AddressID UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    CustomerID UUID,
    AddressLine1 VARCHAR(100),
    AddressLine2 VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(50),
    PostalCode VARCHAR(20),
    Country VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Insert initial data into the Customer table
INSERT INTO Customer (FirstName, LastName, Email) VALUES
('John', 'Doe', 'john.doe@example.com'),
('Jane', 'Smith', 'jane.smith@example.com'),
('Robert', 'Brown', 'robert.brown@example.com'),
('Emily', 'Johnson', 'emily.johnson@example.com'),
('Michael', 'Williams', 'michael.williams@example.com'),
('Jessica', 'Jones', 'jessica.jones@example.com'),
('David', 'Garcia', 'david.garcia@example.com'),
('Sarah', 'Martinez', 'sarah.martinez@example.com'),
('Daniel', 'Hernandez', 'daniel.hernandez@example.com'),
('Laura', 'Lopez', 'laura.lopez@example.com');

-- Insert initial data into the CustomerAddress table
INSERT INTO CustomerAddress (CustomerID, AddressLine1, AddressLine2, City, State, PostalCode, Country) VALUES
((SELECT CustomerID FROM Customer WHERE FirstName = 'John' LIMIT 1), '123 Main St', '', 'Anytown', 'CA', '12345', 'USA'),
((SELECT CustomerID FROM Customer WHERE FirstName = 'John' LIMIT 1), '456 Oak St', 'Apt 2', 'Anytown', 'CA', '12345', 'USA'),
((SELECT CustomerID FROM Customer WHERE FirstName = 'Jane' LIMIT 1), '789 Pine St', '', 'Othertown', 'TX', '67890', 'USA'),
((SELECT CustomerID FROM Customer WHERE FirstName = 'Robert' LIMIT 1), '101 Maple St', '', 'Sometown', 'FL', '54321', 'USA'),
((SELECT CustomerID FROM Customer WHERE FirstName = 'Emily' LIMIT 1), '202 Birch St', 'Suite 300', 'Yettown', 'NY', '98765', 'USA'),
((SELECT CustomerID FROM Customer WHERE FirstName = 'Michael' LIMIT 1), '303 Cedar St', '', 'Newtown', 'IL', '11223', 'USA'),
((SELECT CustomerID FROM Customer WHERE FirstName = 'Jessica' LIMIT 1), '404 Elm St', 'Unit 4B', 'Oldtown', 'WA', '44556', 'USA'),
((SELECT CustomerID FROM Customer WHERE FirstName = 'David' LIMIT 1), '505 Spruce St', '', 'Anothertown', 'CO', '77889', 'USA'),
((SELECT CustomerID FROM Customer WHERE FirstName = 'Sarah' LIMIT 1), '606 Fir St', '', 'Differtown', 'OR', '99001', 'USA'),
((SELECT CustomerID FROM Customer WHERE FirstName = 'Daniel' LIMIT 1), '707 Willow St', 'Apt 101', 'Sometown', 'AZ', '22456', 'USA');
