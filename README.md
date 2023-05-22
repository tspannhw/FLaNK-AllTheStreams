# Cloud Demo 2021 

** Timothy Spann @PaasDev

# References

* https://github.com/tspannhw/stocks-nifi-kafka
* https://github.com/tspannhw/retail-dynamic-shelf-pricing
* https://github.com/tspannhw/nifi-djlsentimentanalysis-processor
* https://github.com/tspannhw/nifi-djlqa-processor

# Default Settings on Centos 7

/usr/lib/jvm/java-openjdk/jre/lib/security


# FLaNK-AllTheStreams
When I dream, all I see are all the streams.   The infinite streams of data, continuous and flowing, forever.



### Data

````
{"DateObserved":"2023-03-14 ","HourObserved":10,"LocalTimeZone":"PST","ReportingArea":"San Rafael","StateCode":"CA","Latitude":37.97,"Longitude":-122.52,"ParameterName":"O3","AQI":23}

````


### Delete a schema


````

curl -X DELETE "http://localhost:7788/api/v1/schemaregistry/schemas/citibikenyc" -H "accept: application/json"

http://localhost:7788/swagger#/1.%20Schema/deleteSchemaMetadata
````



