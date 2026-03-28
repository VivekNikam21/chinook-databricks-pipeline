-- Row Count Reconciliation Across All Pipeline Layers
-- Validates source = raw = bronze = silver for each table

SELECT 'album' AS table_name,
    (SELECT COUNT(*) FROM chinook_azure_sql_catalog.chinook.album) AS source_count,
    (SELECT COUNT(*) FROM workspace.bronze.album) AS bronze_count,
    (SELECT COUNT(*) FROM workspace.silver.album) AS silver_count
UNION ALL
SELECT 'artist',
    (SELECT COUNT(*) FROM chinook_azure_sql_catalog.chinook.artist),
    (SELECT COUNT(*) FROM workspace.bronze.artist),
    (SELECT COUNT(*) FROM workspace.silver.artist)
UNION ALL
SELECT 'customer',
    (SELECT COUNT(*) FROM chinook_azure_sql_catalog.chinook.customer),
    (SELECT COUNT(*) FROM workspace.bronze.customer),
    (SELECT COUNT(*) FROM workspace.silver.customer)
UNION ALL
SELECT 'employee',
    (SELECT COUNT(*) FROM chinook_azure_sql_catalog.chinook.employee),
    (SELECT COUNT(*) FROM workspace.bronze.employee),
    (SELECT COUNT(*) FROM workspace.silver.employee)
UNION ALL
SELECT 'genre',
    (SELECT COUNT(*) FROM chinook_azure_sql_catalog.chinook.genre),
    (SELECT COUNT(*) FROM workspace.bronze.genre),
    (SELECT COUNT(*) FROM workspace.silver.genre)
UNION ALL
SELECT 'invoice',
    (SELECT COUNT(*) FROM chinook_azure_sql_catalog.chinook.invoice),
    (SELECT COUNT(*) FROM workspace.bronze.invoice),
    (SELECT COUNT(*) FROM workspace.silver.invoice)
UNION ALL
SELECT 'invoiceline',
    (SELECT COUNT(*) FROM chinook_azure_sql_catalog.chinook.invoiceline),
    (SELECT COUNT(*) FROM workspace.bronze.invoiceline),
    (SELECT COUNT(*) FROM workspace.silver.invoiceline)
UNION ALL
SELECT 'mediatype',
    (SELECT COUNT(*) FROM chinook_azure_sql_catalog.chinook.mediatype),
    (SELECT COUNT(*) FROM workspace.bronze.mediatype),
    (SELECT COUNT(*) FROM workspace.silver.mediatype)
UNION ALL
SELECT 'playlist',
    (SELECT COUNT(*) FROM chinook_azure_sql_catalog.chinook.playlist),
    (SELECT COUNT(*) FROM workspace.bronze.playlist),
    (SELECT COUNT(*) FROM workspace.silver.playlist)
UNION ALL
SELECT 'playlisttrack',
    (SELECT COUNT(*) FROM chinook_azure_sql_catalog.chinook.playlisttrack),
    (SELECT COUNT(*) FROM workspace.bronze.playlisttrack),
    (SELECT COUNT(*) FROM workspace.silver.playlisttrack)
UNION ALL
SELECT 'track',
    (SELECT COUNT(*) FROM chinook_azure_sql_catalog.chinook.track),
    (SELECT COUNT(*) FROM workspace.bronze.track),
    (SELECT COUNT(*) FROM workspace.silver.track)
ORDER BY table_name;
