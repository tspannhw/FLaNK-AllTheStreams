select * from scada2
where temperaturef > 89

SELECT scada2.uuid, scada2.systemtime, scada2.temperaturef, scada2.pressure, scada2.humidity, scada2.lux, scada2.proximity, 
scada2.oxidising,scada2.reducing , scada2.nh3, scada2.gasKO,energy2.`current`,                   
energy2.voltage,energy2.`power`,energy2.`total`,energy2.fanstatus
FROM energy2 JOIN scada2 ON energy2.systemtime = scada2.systemtime

SELECT scada2.uuid, scada2.systemtime, scada2.temperaturef, scada2.pressure, scada2.humidity, scada2.lux, scada2.proximity, 
scada2.oxidising,scada2.reducing , scada2.nh3, scada2.gasko,energy2.`current`,                   
energy2.voltage,energy2.`power`,energy2.`total`,energy2.fanstatus
FROM energy2 JOIN scada2 ON energy2.systemtime = scada2.systemtime

select `power`, voltage, `current`,TUMBLE_END(eventTimestamp, INTERVAL '5' MINUTE) AS window_end_timestamp
from energy2
where `power` > 7
GROUP BY TUMBLE(eventTimestamp, INTERVAL '5' MINUTE),`power`, voltage, `current`


select weather2.temperature_string, weather2.weather,
       weather2.observation_time, weather2.station_id, weather2.wind_string, weather2.location,transcomevents.`title`, transcomevents.latitude, transcomevents.longitude, transcomevents.`ts`
from weather2
FULL OUTER JOIN transcomevents
ON weather2.latitude = transcomevents.latitude
and weather2.longitude = transcomevents.longitude


select weather2.temperature_string, weather2.weather,
       weather2.observation_time, weather2.station_id, weather2.wind_string, weather2.location,transcomevents.`title`, transcomevents.latitude, transcomevents.longitude, transcomevents.`ts`,
       
       
       (
   3959 *
   acos(cos(radians(weather2.latitude)) * 
   cos(radians(transcomevents.latitude)) * 
   cos(radians(transcomevents.longitude) - 
   radians(weather2.longitude)) + 
   sin(radians(weather2.latitude)) * 
   sin(radians(transcomevents.latitude )))
) AS distance 
from weather2
FULL OUTER JOIN transcomevents
ON weather2.latitude = transcomevents.latitude
and weather2.longitude = transcomevents.longitude

SELECT symbol, uuid, ts, dt, `open`, `close`, high, volume, `low`, `datetime`, 'new-high' message, 
'nh' alertcode, CAST(CURRENT_TIMESTAMP AS BIGINT) alerttime 
FROM stocksraw st 
WHERE symbol is not null 
and symbol <> 'null' and
trim(symbol) <> '' and 
CAST(`close` as DOUBLE) > 
(SELECT MAX(CAST(`close` as DOUBLE)) FROM stocksraw s 
WHERE s.symbol = st.symbol)
            
SELECT HOP_END(eventTimestamp, INTERVAL '1' SECOND, INTERVAL '30' SECOND) as windowEnd,
            count(`close`) as closeCount, 
            sum(cast(`close` as float)) as closeSum, 
            avg(cast(`close` as float)) as closeAverage, 
            min(`close`) as closeMin, 
            max(`close`) as closeMax, 
            sum(case when `close` > 14 then 1 else 0 end) as stockGreaterThan14 
FROM stocksraw WHERE symbol = 'CLDR' 
GROUP BY HOP(eventTimestamp, INTERVAL '1' SECOND, INTERVAL '30' SECOND)


            



-- specify Kafka partition key on output
SELECT foo AS _eventKey FROM sensors

-- use event time timestamp from kafka
-- exactly once compatible
SELECT eventTimestamp FROM sensors

-- nested structures access
SELECT foo.’bar’ FROM table; -- must quote nested column

-- timestamps
SELECT * FROM payments
WHERE eventTimestamp > CURRENT_TIMESTAMP-interval '10' second;

-- unnest
SELECT b.*, u.*
FROM bgp_avro b,
UNNEST(b.path) AS u(pathitem)

-- aggregations and windows
SELECT card,
MAX(amount) as theamount,
TUMBLE_END(eventTimestamp, interval '5' minute) as ts
FROM payments
WHERE lat IS NOT NULL
AND lon IS NOT NULL
GROUP BY card, 
TUMBLE(eventTimestamp, interval '5' minute)
HAVING COUNT(*) > 4 -- >4==fraud

-- try to do this ksql!
SELECT us_west.user_score+ap_south.user_score
FROM kafka_in_zone_us_west us_west
FULL OUTER JOIN kafka_in_zone_ap_south ap_south
ON us_west.user_id = ap_south.user_id;


function GETPLANE(icao) {
    var c = new java.net.URL('http://yyyyyy.io' + icao).openConnection();
    c.requestMethod='GET';
    var reader = new java.io.BufferedReader(new java.io.InputStreamReader(c.inputStream));
    return reader.readLine();
}
GETPLANE($p0); //emit

# works
select location, max(temp_f) as max_temp_f, avg(temp_f) as avg_temp_f, min(temp_f) as min_temp_f from weather2 group by location

#works
SELECT HOP_END(eventTimestamp, INTERVAL '1' SECOND, INTERVAL '30' SECOND) as windowEnd, count(`close`) as closeCount,
       sum(cast(`close` as float)) as closeSum, avg(cast(`close` as float)) as closeAverage, min(`close`) as closeMin,
       max(`close`) as closeMax,
       sum(case when `close` > 14 then 1 else 0 end) as stockGreaterThan14 
FROM stocksraw WHERE symbol = 'CLDR' GROUP BY HOP(eventTimestamp, INTERVAL '1' SECOND, INTERVAL '30' SECOND);
                                                         
#works
SELECT scada2.uuid, scada2.systemtime, scada2.temperaturef, scada2.pressure, scada2.humidity, scada2.lux, scada2.proximity, 
scada2.oxidising,scada2.reducing , scada2.nh3, scada2.gasko,energy2.`current`,                   
energy2.voltage,energy2.`power`,energy2.`total`,energy2.fanstatus
FROM energy2 JOIN scada2 ON energy2.systemtime = scada2.systemtime

# works
select * 
from statusevents
where lower(description) like '%fail%'

                                                         
                                                         ####
                                                         
SELECT CAST(symbol as STRING) symbol, CAST(uuid as STRING) uuid, ts, dt, open, close, high, volume, low, datetime, 'new-high' message, 
                                                                          'nh' alertcode, CAST(CURRENT_TIMESTAMP AS BIGINT) alerttime 
                                                                          FROM stocks st 
                                                                          WHERE symbol is not null 
                                                                          and symbol <> 'null' and
                                                                          trim(symbol) <> '' and 
                                                                          CAST(close as DOUBLE) > 
                                                                          (SELECT MAX(CAST(close as DOUBLE)) FROM stocks s 
                                                                                           WHERE s.symbol = st.symbol);

SELECT scada2.uuid, scada2.systemtime, scada2.temperaturef, scada2.pressure, scada2.humidity, scada2.lux, scada2.proximity, scada2.oxidising,scada2.reducing , scada2.nh3, scada2.gasko, energy2.voltage,energy2.total,energy2.fanstatus FROM energy2, scada2 WHERE energy2.systemtime = scada2.systemtime


SELECT location, station_id, latitude, longitude, observation_time, weather, temperature_string, temp_f, temp_c, relative_humidity, wind_string, wind_dir, wind_degrees, wind_mph, wind_kt, pressure_in, dewpoint_string, dewpoint_f, dewpoint_c FROM weather2 WHERE location is not null and location <> 'null' and trim(location) <> '' and location like '%NJ'


SELECT HOP_END(eventTimestamp, INTERVAL '1' SECOND, INTERVAL '30' SECOND) as windowEnd, count("close") as closeCount, 
sum(cast("close" as float)) as closeSum, avg(cast("close" as float)) as closeAverage, min("close") as closeMin, max("close") as closeMax, 
sum(case when "close" > 14 then 1 else 0 end) as stockGreaterThan14 
FROM stocksraw 
GROUP BY HOP(eventTimestamp, INTERVAL '1' SECOND, INTERVAL '30' SECOND)
                                                  


SELECT HOP_END(eventTimestamp, INTERVAL '1' SECOND, INTERVAL '30' SECOND) as windowEnd, count(`close`) as closeCount,
       sum(cast(`close` as float)) as closeSum, avg(cast(`close` as float)) as closeAverage, min(`close`) as closeMin,
       max(`close`) as closeMax,
       sum(case when `close` > 14 then 1 else 0 end) as stockGreaterThan14 
FROM stocksraw WHERE symbol = 'CLDR' GROUP BY HOP(eventTimestamp, INTERVAL '1' SECOND, INTERVAL '30' SECOND);
                                                  
EPOCH_TO_TIMESTAMP(ts),
                                                  

                                                  
// parse the JSON record
var parsedVal = JSON.parse(record);
// Convert sensor_ts from micro to milliseconds
parsedVal['sensor_ts'] = Math.round(parsedVal['sensor_ts']/1000);
// serialize output as JSON
JSON.stringify(parsedVal);
                                                         
SELECT
  sensor_id as device_id,
  HOP_END(sensor_ts, INTERVAL '1' SECOND, INTERVAL '30' SECOND) as windowEnd,
  count(*) as sensorCount,
  sum(sensor_6) as sensorSum,
  avg(cast(sensor_6 as float)) as sensorAverage,
  min(sensor_6) as sensorMin,
  max(sensor_6) as sensorMax,
  sum(case when sensor_6 > 70 then 1 else 0 end) as sensorGreaterThan60
FROM iot_enriched_source
GROUP BY
  sensor_id,
  HOP(sensor_ts, INTERVAL '1' SECOND, INTERVAL '30' SECOND)

           
                                                         
                                                         
SELECT flight_number, flight_origin, flight_destination,
  TUMBLE_END("eventTimestamp", INTERVAL '5' MINUTE) AS window_end_timestamp
FROM airplane_flights
GROUP BY TUMBLE("eventTimestamp", INTERVAL '5' MINUTE)
           
SELECT a.web_order_id, a.product_name, a.order_date
 b.next_shipment_time
FROM online_orders a, shipment_events b
WHERE a.shipping_type = 'Priority'
 AND a.eventTimestamp BETWEEN b.eventTimestamp - INTERVAL '1' HOUR AND b.eventTimestamp
           
SELECT *
FROM airplane_flights a
WHERE flight_number IS NOT NULL
GROUP BY HOP(a."timestamp_ms", INTERVAL '15' SECOND, INTERVAL '5' SECOND), flight_number
           
-- eventTimestamp is the Kafka timestamp
-- as unix timestamp. Magically added to every schema.
SELECT max(eventTimestamp) FROM solar_inputs;

-- make it human readable
SELECT CAST(max(eventTimestamp) AS varchar) as TS FROM solar_inputs;

-- dete math with interval
SELECT * FROM payments
WHERE eventTimestamp > CURRENT_TIMESTAMP-interval '10' second;
           
SELECT SUM(CAST(amount AS numeric)) AS payment_volume,
CAST(TUMBLE_END(eventTimestamp, interval '1' hour) AS varchar) AS ts
FROM payments
GROUP BY TUMBLE(eventTimestamp, interval '1' hour);
                
SELECT card,
MAX(amount) as theamount,
TUMBLE_END(eventTimestamp, interval '5' minute) as ts
FROM payments
WHERE lat IS NOT NULL
AND lon IS NOT NULL
GROUP BY card, TUMBLE(eventTimestamp, interval '5' minute)
HAVING COUNT(*) > 4 -- >4==fraud
                
-- unnest each array element as separate row
SELECT b.*, u.*
 FROM bgp_avro b,
 UNNEST(b.path) AS u(pathitem)
                
 -- union two different virtual tables
SELECT * FROM clickstream
WHERE useragent = 'Chrome/62.0.3202.84 Mobile Safari/537.36'
UNION ALL
SELECT * FROM clickstream
WHERE useragent = 'Version/4.0 Chrome/58.0.3029.83 Mobile Safari/537.36'
                
SELECT card,
SUM(amount)/100 AS miles,
TUMBLE_END(eventTimestamp, interval '1' day)
FROM payments
GROUP BY card, TUMBLE(eventTimestamp, interval '1' day);
                
-- join multiple streams
select o.name,
       sum(d.clicks),
       hop_end(r.eventTimestamp, interval '20' second, interval '40' second)
 from click_stream o join orgs r on o.org_id = r.org_id
               join models d on d.org_id = r.org_id
 group by o.name,
        hop(r.eventTimestamp, interval '20' second, interval '40' second)
                
SELECT us_west.user_score+ap_south.user_score
FROM kafka_in_zone_us_west us_west
FULL OUTER JOIN kafka_in_zone_ap_south ap_south
ON us_west.user_id = ap_south.user_id;
                
SELECT 'testme_'||name FROM logs;
                
SELECT eventTimestamp, TYPEOF(eventTimestamp) as mytype FROM airplanes;
                
SELECT foo.`bar` FROM table; -- must quote nested column
                
SELECT "some string literal" FROM mytable; -- a literal
                
-- convert EPOCH time to timestamp
select EPOCH_TO_TIMESTAMP(1593718981) from ev_sample_fraud;

-- convert EPOCH milliseconds to timestamp
select EPOCHMILLIS_TO_TIMESTAMP(1593718838150) from ev_sample_fraud;
                
                

