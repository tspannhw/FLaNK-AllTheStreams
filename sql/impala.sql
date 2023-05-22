CREATE EXTERNAL TABLE stocksparquet
(
    `symbol` STRING, 
  uuid STRING,
    `ts` BIGINT,
    `dt`	 BIGINT,
  `datetime` STRING,
  `open` STRING, 
  `close` STRING,
  `high` STRING,
  `volume` STRING,
  `low` STRING,
PRIMARY KEY (uuid,`datetime`) ) 
STORED AS PARQUET
LOCATION '/tmp/stocks/stocks3';


# Kafka Connect to parquet requires a schema without union types so no Nulls and no timestamps

#CREATE EXTERNAL TABLE scada LIKE PARQUET '/tmp/sensors2/2bcf8ab8-17c5-41e8-a77e-fe7dffd59221'
#  STORED AS PARQUET
#  LOCATION '/tmp/sensors2';
 

CREATE EXTERNAL TABLE scada
(
        uuid STRING, 
	amplitude100 double, amplitude500 double, amplitude1000 double, 
	 lownoise double, midnoise double, highnoise double, amps double,
	ipaddress string, host string, host_name string, macaddress string, 
	  systemtime STRING,  	endtime string, runtime string, starttime string,
	cpu double, cpu_temp string,  diskusage string,memory double,  id string,
	 temperature string,  adjtemp string, adjtempf string, temperaturef STRING,
    pressure double,
    humidity double,
    lux double,
    proximity int,
    oxidising double,
    reducing double,
    nh3 double, gasko string,  
PRIMARY KEY (uuid) ) 
STORED AS PARQUET
LOCATION '/tmp/sensors2';

# Energy2 is directory of JSON
