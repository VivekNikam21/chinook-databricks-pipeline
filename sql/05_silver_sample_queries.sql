-- Silver Layer Sample Queries
-- Validates cleaning transformations were applied correctly

-- 1. Customer — verify lowercase emails, trimmed strings
SELECT CustomerId, FirstName, LastName, Email, City, Country
FROM workspace.silver.customer
LIMIT 10;

-- 2. Employee — verify lowercase emails
SELECT EmployeeId, FirstName, LastName, Email, Title
FROM workspace.silver.employee;

-- 3. Invoice — verify data integrity
SELECT InvoiceId, CustomerId, InvoiceDate, Total, BillingCity, BillingCountry
FROM workspace.silver.invoice
LIMIT 10;

-- 4. Track — check nullable Composer field
SELECT TrackId, Name, Composer, Milliseconds, UnitPrice
FROM workspace.silver.track
WHERE Composer IS NULL
LIMIT 5;
