absolute.hdfs.path
/tmp/weatherorc
No value set
hive.ddl
CREATE EXTERNAL TABLE IF NOT EXISTS `weatherorc` (`credit` STRING, `credit_url` STRING, `image` STRUCT<`url`:STRING, `title`:STRING, `link`:STRING>, `suggested_pickup` STRING, `suggested_pickup_period` INT, `location` STRING, `station_id` STRING, `latitude` DOUBLE, `longitude` DOUBLE, `observation_time` STRING, `observation_time_rfc822` STRING, `weather` STRING, `temperature_string` STRING, `temp_f` DOUBLE, `temp_c` DOUBLE, `relative_humidity` INT, `wind_string` STRING, `wind_dir` STRING, `wind_degrees` INT, `wind_mph` DOUBLE, `wind_kt` INT, `pressure_in` DOUBLE, `dewpoint_string` STRING, `dewpoint_f` DOUBLE, `dewpoint_c` DOUBLE, `visibility_mi` DOUBLE, `icon_url_base` STRING, `two_day_history_url` STRING, `icon_url_name` STRING, `ob_url` STRING, `disclaimer_url` STRING, `copyright_url` STRING, `privacy_policy_url` STRING) STORED AS ORC
