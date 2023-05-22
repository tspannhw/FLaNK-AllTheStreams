** Working on automating this

# https://www.datainmotion.dev/2020/04/sql-reporting-task-for-cloudera-flow.html

# provenance

# JVM Metrics

[root@ec2-54-166-162-14 demo]# nifi-toolkit-1.13.2/bin/cli.sh 

# get list of tasks

nifi get-reporting-tasks  --baseUrl http://edge2ai-1.dim.local:8080 -verbose   

# get each task to backup and export to file

nifi get-reporting-task  --baseUrl http://edge2ai-1.dim.local:8080 -verbose --reportingTaskId 07914d9f-1ce3-1174-0000-000039db6547 -ot json

nifi get-reporting-task  --baseUrl http://edge2ai-1.dim.local:8080 -verbose -ot json --reportingTaskId 

nifi-toolkit-1.13.2/bin/cli.sh nifi get-reporting-task  --baseUrl http://edge2ai-1.dim.local:8080 -verbose -ot json --reportingTaskId  81491eef-0179-1000-0000-000053e6275a > provenance.json

# need to export services for them

#> nifi get-services --baseUrl http://edge2ai-1.dim.local:8080 -verbose                                                                               

#   Name                   ID                                     State      
-   --------------------   ------------------------------------   --------   
1   JsonRecordSetWriter    9eda728b-0179-1000-0000-000026e48977   ENABLED    
2   KafkaRecordSink_2_6    9ed98798-0179-1000-0000-000051bc57e9   ENABLED    
3   PrometheusRecordSink   9f08c0d8-0179-1000-ffff-ffffa5d80748   DISABLED 

nifi-toolkit-1.13.2/bin/cli.sh nifi get-service --baseUrl http://edge2ai-1.dim.local:8080 --controllerServiceId 9eda728b-0179-1000-0000-000026e48977    -ot json

nifi-toolkit-1.13.2/bin/cli.sh nifi get-service --baseUrl http://edge2ai-1.dim.local:8080 --controllerServiceId 9eda728b-0179-1000-0000-000026e48977    -ot json > jsonrecordsetwriter.json

nifi-toolkit-1.13.2/bin/cli.sh nifi get-service --baseUrl http://edge2ai-1.dim.local:8080 --controllerServiceId 9ed98798-0179-1000-0000-000051bc57e9   -ot json > KafkaRecordSink_2_6.json

nifi-toolkit-1.13.2/bin/cli.sh nifi get-service --baseUrl http://edge2ai-1.dim.local:8080 --controllerServiceId 9f08c0d8-0179-1000-ffff-ffffa5d80748  -ot json > PrometheusRecordSink.json



# Import them from file

nifi create-reporting-task   --baseUrl http://edge2ai-1.dim.local:8080 -verbose -i file.json

# start them all

nifi start-reporting-tasks --baseUrl http://edge2ai-1.dim.local:8080 -verbose  
 
 
Need to export readers/writers


change all URLS and IPs to edge2ai-1.dim.local
