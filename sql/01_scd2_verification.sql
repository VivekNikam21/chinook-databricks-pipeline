-- SCD Type 2 Verification Query
-- Proves dim_customer correctly tracks historical changes
-- After Version 2 updates, each modified customer should have:
--   - Old row: is_current = false, effective_end_date = run date
--   - New row: is_current = true, effective_end_date = 9999-12-31

SELECT customer_key, customer_id, first_name, last_name, city, country, email,
       effective_start_date, effective_end_date, is_current
FROM workspace.gold.dim_customer
WHERE customer_id IN (1, 2, 3)
ORDER BY customer_id, effective_start_date;

-- Count customers with multiple SCD2 versions
SELECT customer_id, first_name, last_name, COUNT(*) AS versions
FROM workspace.gold.dim_customer
GROUP BY customer_id, first_name, last_name
HAVING COUNT(*) > 1
ORDER BY customer_id;
