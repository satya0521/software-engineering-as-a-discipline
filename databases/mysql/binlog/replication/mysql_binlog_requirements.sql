SELECT
    *,
    CASE VARIABLE_NAME
        WHEN 'innodb_version' THEN '> 5.6'
        WHEN 'server_id' THEN 'a unique server id'
        WHEN 'log_bin' THEN 'ON'
        WHEN 'log_bin_basename' THEN 'a log path'
        WHEN 'binlog_format' THEN 'ROW'
        WHEN 'binlog_row_image' THEN 'FULL'
        WHEN 'expire_logs_days' THEN 'depends on environment'
        WHEN 'binlog_rows_query_log_events' THEN 'ON'
        WHEN 'gtid_mode' THEN 'ON'
        WHEN 'enforce_gtid_consistency' THEN 'ON'
        WHEN 'log_slave_updates' THEN 'ON'
        ELSE ''
    END AS 'DESIRED_VALUE',
    CASE VARIABLE_NAME
        WHEN 'innodb_version' THEN 'innodb-parameters'
        WHEN 'server_id' THEN 'replication-options'
        WHEN 'log_bin' THEN 'replication-options-binary-log'
        WHEN 'log_bin_basename' THEN 'replication-options-binary-log'
        WHEN 'binlog_format' THEN 'replication-options-binary-log'
        WHEN 'binlog_row_image' THEN 'replication-options-binary-log'
        WHEN 'expire_logs_days' THEN 'replication-options-binary-log'
        WHEN 'binlog_rows_query_log_events' THEN 'replication-options-binary-log'
        WHEN 'gtid_mode' THEN 'replication-option-gtids'
        WHEN 'enforce_gtid_consistency' THEN 'replication-option-gtids'
        WHEN 'log_slave_updates' THEN 'replication-options-slave'
        ELSE ''
    END AS 'VARIABLE_TYPE', 
    CASE VARIABLE_NAME
        WHEN 'innodb_version' THEN 'Mandatory'
        WHEN 'server_id' THEN 'Mandatory'
        WHEN 'log_bin' THEN 'Mandatory'
        WHEN 'log_bin_basename' THEN 'Mandatory'
        WHEN 'binlog_format' THEN 'Mandatory'
        WHEN 'binlog_row_image' THEN 'Mandatory'
        WHEN 'expire_logs_days' THEN 'Mandatory'
        WHEN 'binlog_rows_query_log_events' THEN 'Optional'
        WHEN 'gtid_mode' THEN 'Optional'
        WHEN 'enforce_gtid_consistency' THEN 'Optional'
        WHEN 'log_slave_updates' THEN 'Optional'
        ELSE ''
    END AS 'REQUIRED'
FROM performance_schema.global_variables
WHERE VARIABLE_NAME = 'innodb_version' OR
    VARIABLE_NAME = 'server_id' OR
    VARIABLE_NAME = 'log_bin' OR
    VARIABLE_NAME = 'log_bin_basename' OR
    VARIABLE_NAME = 'binlog_format' OR
    VARIABLE_NAME = 'binlog_row_image' OR
    VARIABLE_NAME = 'expire_logs_days' OR
    VARIABLE_NAME = 'binlog_rows_query_log_events' OR
    VARIABLE_NAME = 'gtid_mode' OR
    VARIABLE_NAME = 'enforce_gtid_consistency' OR
    VARIABLE_NAME = 'log_slave_updates'
ORDER BY VARIABLE_TYPE;
