SELECT *, UNIX_TIMESTAMP(last_level_update_date) AS unix_ts_in_secs 
FROM new_teams
WHERE (is_deleted = 1 AND UNIX_TIMESTAMP(last_level_update_date) > :sql_last_value AND last_level_update_date < NOW())
ORDER BY last_level_update_date ASC