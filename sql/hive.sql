CREATE EXTERNAL TABLE IF NOT EXISTS `weatherorc` (`credit` STRING, `credit_url` STRING, `image` STRUCT<`url`:STRING, `title`:STRING, `link`:STRING>, `suggested_pickup` STRING, `suggested_pickup_period` BIGINT, `location` STRING, `station_id` STRING, `latitude` DOUBLE, `longitude` DOUBLE, `observation_time` STRING, `observation_time_rfc822` STRING, `weather` STRING, `temperature_string` STRING, `temp_f` DOUBLE, `temp_c` DOUBLE, `relative_humidity` BIGINT, `wind_string` STRING, `wind_dir` STRING, `wind_degrees` BIGINT, `wind_mph` DOUBLE, `wind_kt` BIGINT, `pressure_in` DOUBLE, `dewpoint_string` STRING, `dewpoint_f` DOUBLE, `dewpoint_c` DOUBLE, `visibility_mi` DOUBLE, `icon_url_base` STRING, `two_day_history_url` STRING, `icon_url_name` STRING, `ob_url` STRING, `disclaimer_url` STRING, `copyright_url` STRING, `privacy_policy_url` STRING) 
STORED AS ORC
LOCATION '/tmp/weatherorc';

CREATE EXTERNAL TABLE IF NOT EXISTS `weatherparquet` (`credit` STRING, `credit_url` STRING, `image` STRUCT<`url`:STRING, `title`:STRING, `link`:STRING>, `suggested_pickup` STRING, `suggested_pickup_period` BIGINT, `location` STRING, `station_id` STRING, `latitude` DOUBLE, `longitude` DOUBLE, `observation_time` STRING, `observation_time_rfc822` STRING, `weather` STRING, `temperature_string` STRING, `temp_f` DOUBLE, `temp_c` DOUBLE, `relative_humidity` BIGINT, `wind_string` STRING, `wind_dir` STRING, `wind_degrees` BIGINT, `wind_mph` DOUBLE, `wind_kt` BIGINT, `pressure_in` DOUBLE, `dewpoint_string` STRING, `dewpoint_f` DOUBLE, `dewpoint_c` DOUBLE, `visibility_mi` DOUBLE, `icon_url_base` STRING, `two_day_history_url` STRING, `icon_url_name` STRING, `ob_url` STRING, `disclaimer_url` STRING, `copyright_url` STRING, `privacy_policy_url` STRING) 
STORED AS PARQUET
LOCATION '/tmp/weatherparquet';



CREATE TABLE provenancehive
(
  eventId INT,
  timestampMillis INT,
  eventType STRING,
  durationMillis INT,
  lineageStart INT,
  details STRING,
  entityId STRING,
  entityType STRING,
  entitySize INT,
  componentName STRING,
   componentType STRING);

CREATE TABLE hv_stocks
(
  uuid STRING NOT NULL,
  `datetime` STRING,
  `symbol` STRING, 
  `open` STRING, 
  `close` STRING,
  `high` STRING,
  `volume` STRING,
  `low` STRING,
   PRIMARY KEY (UUID) DISABLE NOVALIDATE);


 CREATE EXTERNAL TABLE scada2 
(
uuid STRING, 
	amplitude100 DOUBLE, 
        amplitude500 DOUBLE, 
	amplitude1000 DOUBLE, 
	lownoise DOUBLE, 
	midnoise DOUBLE,
        highnoise DOUBLE, 
	amps DOUBLE, 
	ipaddress STRING, 
	host STRING, 
	host_name STRING,
        macaddress STRING, 
	systemtime STRING,  
	endtime STRING, 
	runtime STRING, 
	starttime STRING, 
        cpu DOUBLE, 
	cpu_temp STRING, 
	diskusage STRING, 
	memory DOUBLE, 
	id STRING, 
	temperature STRING, 
	adjtemp STRING, 
	adjtempf STRING, 
	temperaturef STRING, 
	pressure DOUBLE, 
	humidity DOUBLE, 
	lux DOUBLE, 
	proximity INT, 
	oxidising DOUBLE, 
	reducing DOUBLE, 
	nh3 DOUBLE, 
	gasko STRING)
  ROW FORMAT SERDE 'org.apache.hive.hcatalog.data.JsonSerDe'
  LOCATION '/tmp/demo';
  
