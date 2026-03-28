-- Metadata and Data Quality Validation Queries

-- 1. Parent metadata — all registered source tables
SELECT table_name, source_catalog, source_schema, source_table, active_flag, load_sequence
FROM workspace.metadata.pipeline_parent_metadata
ORDER BY load_sequence;

-- 2. Child execution metrics — latest pipeline run
SELECT table_name, stage_name, status, source_row_count, target_row_count, file_location
FROM workspace.metadata.pipeline_child_metrics
ORDER BY created_date DESC
LIMIT 20;

-- 3. DQ execution log — rule results from latest run
SELECT table_name, rule_name, rule_description, total_processed, passed_count, failed_count
FROM workspace.metadata.dq_execution_log
ORDER BY table_name, rule_name;

-- 4. DQ summary by table
SELECT table_name,
       COUNT(*) AS rules_executed,
       SUM(failed_count) AS total_failures
FROM workspace.metadata.dq_execution_log
GROUP BY table_name
ORDER BY table_name;
