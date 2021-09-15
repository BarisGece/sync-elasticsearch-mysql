SELECT *, UNIX_TIMESTAMP(modification_date) AS unix_ts_in_secs 
FROM teams 
WHERE (UNIX_TIMESTAMP(modification_date) > :sql_last_value AND modification_date < NOW()) 
ORDER BY modification_date ASC