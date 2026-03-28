-- Source Row Count Verification (Run in Azure SQL Query Editor)
-- Validates Chinook dataset is complete before pipeline execution

SELECT 'Album' AS tbl, COUNT(*) AS cnt FROM chinook.Album
UNION ALL SELECT 'Artist', COUNT(*) FROM chinook.Artist
UNION ALL SELECT 'Customer', COUNT(*) FROM chinook.Customer
UNION ALL SELECT 'Employee', COUNT(*) FROM chinook.Employee
UNION ALL SELECT 'Genre', COUNT(*) FROM chinook.Genre
UNION ALL SELECT 'Invoice', COUNT(*) FROM chinook.Invoice
UNION ALL SELECT 'InvoiceLine', COUNT(*) FROM chinook.InvoiceLine
UNION ALL SELECT 'MediaType', COUNT(*) FROM chinook.MediaType
UNION ALL SELECT 'Playlist', COUNT(*) FROM chinook.Playlist
UNION ALL SELECT 'PlaylistTrack', COUNT(*) FROM chinook.PlaylistTrack
UNION ALL SELECT 'Track', COUNT(*) FROM chinook.Track
ORDER BY tbl;

-- Expected counts (Chinook Version 1):
-- Album: 347, Artist: 275, Customer: 59, Employee: 8, Genre: 25
-- Invoice: 412, InvoiceLine: 2240, MediaType: 5, Playlist: 18
-- PlaylistTrack: 8715, Track: 3503
-- Total: 15,607
