-- Gold Layer Validation Queries
-- Verifies dimensional integrity, row counts, and aggregate consistency

-- 1. Gold table row counts
SELECT 'dim_date' AS table_name, COUNT(*) AS row_count FROM workspace.gold.dim_date
UNION ALL SELECT 'dim_artist', COUNT(*) FROM workspace.gold.dim_artist
UNION ALL SELECT 'dim_album', COUNT(*) FROM workspace.gold.dim_album
UNION ALL SELECT 'dim_genre', COUNT(*) FROM workspace.gold.dim_genre
UNION ALL SELECT 'dim_media_type', COUNT(*) FROM workspace.gold.dim_media_type
UNION ALL SELECT 'dim_employee', COUNT(*) FROM workspace.gold.dim_employee
UNION ALL SELECT 'dim_track', COUNT(*) FROM workspace.gold.dim_track
UNION ALL SELECT 'dim_customer', COUNT(*) FROM workspace.gold.dim_customer
UNION ALL SELECT 'fact_sales', COUNT(*) FROM workspace.gold.fact_sales
UNION ALL SELECT 'fact_sales_customer_agg', COUNT(*) FROM workspace.gold.fact_sales_customer_agg
ORDER BY table_name;

-- 2. Orphan check — every fact row should join to a customer dimension
SELECT COUNT(*) AS orphan_customer_keys
FROM workspace.gold.fact_sales fs
LEFT JOIN workspace.gold.dim_customer dc ON fs.customer_key = dc.customer_key
WHERE dc.customer_key IS NULL;

-- 3. Aggregate consistency — fact_sales total must match fact_sales_customer_agg total
SELECT
    (SELECT SUM(line_amount) FROM workspace.gold.fact_sales) AS fact_sales_total,
    (SELECT SUM(total_sales_amount) FROM workspace.gold.fact_sales_customer_agg) AS agg_total;

-- 4. Sample fact_sales
SELECT * FROM workspace.gold.fact_sales LIMIT 10;

-- 5. Top customers by sales
SELECT * FROM workspace.gold.fact_sales_customer_agg ORDER BY total_sales_amount DESC LIMIT 10;
