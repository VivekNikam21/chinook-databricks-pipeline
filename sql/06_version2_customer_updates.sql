-- Version 2: Customer Data Modifications for SCD Type 2 Demo
-- Run this in Azure SQL Query Editor against damg7370-DB
-- After running, rerun the Databricks pipeline to trigger SCD Type 2 changes

-- Customer 1: Change city and state
UPDATE chinook.Customer
SET City = 'Toronto', State = 'ON'
WHERE CustomerId = 1;

-- Customer 2: Change email and address
UPDATE chinook.Customer
SET Email = 'leonie.new@surfeu.de', Address = 'New Address 123'
WHERE CustomerId = 2;

-- Customer 3: Change country and city
UPDATE chinook.Customer
SET Country = 'United States', City = 'New York'
WHERE CustomerId = 3;
