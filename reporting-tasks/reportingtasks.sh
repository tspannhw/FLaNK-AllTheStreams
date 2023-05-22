 nifi get-reporting-task  --baseUrl http://edge2ai-1.dim.local:8080 -verbose --reportingTaskId 07914d9f-1ce3-1174-0000-000039db6547 -ot json
{
  "revision" : {
    "clientId" : "07914c22-1ce3-1174-900c-2dff6ee491d2",
    "version" : 1
  },
  "id" : "07914d9f-1ce3-1174-0000-000039db6547",
  "uri" : "http://edge2ai-1.dim.local:8080/nifi-api/reporting-tasks/07914d9f-1ce3-1174-0000-000039db6547",
  "permissions" : {
    "canRead" : true,
    "canWrite" : true
  },
  "bulletins" : [ ],
  "component" : {
    "id" : "07914d9f-1ce3-1174-0000-000039db6547",
    "name" : "QueryNiFiReportingTask",
    "type" : "org.apache.nifi.reporting.sql.QueryNiFiReportingTask",
    "bundle" : {
      "group" : "org.apache.nifi",
      "artifact" : "nifi-sql-reporting-nar",
      "version" : "1.11.4.2.0.4.0-80"
    },
    "state" : "STOPPED",
    "persistsState" : false,
    "restricted" : false,
    "deprecated" : false,
    "multipleVersionsAvailable" : false,
    "schedulingPeriod" : "5 mins",
    "schedulingStrategy" : "TIMER_DRIVEN",
    "defaultSchedulingPeriod" : {
      "TIMER_DRIVEN" : "0 sec",
      "CRON_DRIVEN" : "* * * * * ?"
    },
    "properties" : { },
    "descriptors" : {
      "sql-reporting-query" : {
        "name" : "sql-reporting-query",
        "displayName" : "SQL Query",
        "description" : "SQL SELECT statement specifies which tables to query and how data should be filtered/transformed. SQL SELECT can select from the CONNECTION_STATUS, PROCESSOR_STATUS, BULLETINS, PROCESS_GROUP_STATUS, JVM_METRICS, CONNECTION_STATUS_PREDICTIONS, or PROVENANCE tables. Note that the CONNECTION_STATUS_PREDICTIONS table is not available for querying if analytics are not enabled).",
        "required" : true,
        "sensitive" : false,
        "dynamic" : false,
        "supportsEl" : true,
        "expressionLanguageScope" : "Variable Registry Only"
      },
      "sql-reporting-record-sink" : {
        "name" : "sql-reporting-record-sink",
        "displayName" : "Record Destination Service",
        "description" : "Specifies the Controller Service to use for writing out the query result records to some destination.",
        "allowableValues" : [ {
          "allowableValue" : {
            "displayName" : "QRKafkaRecordSink_2_0",
            "value" : "413c98ef-0178-1000-ffff-ffffb30e3409"
          },
          "canRead" : true
        } ],
        "required" : true,
        "sensitive" : false,
        "dynamic" : false,
        "supportsEl" : false,
        "expressionLanguageScope" : "Not Supported",
        "identifiesControllerService" : "org.apache.nifi.record.sink.RecordSinkService",
        "identifiesControllerServiceBundle" : {
          "group" : "org.apache.nifi",
          "artifact" : "nifi-standard-services-api-nar",
          "version" : "1.11.4.2.0.4.0-80"
        }
      },
      "sql-reporting-include-zero-record-results" : {
        "name" : "sql-reporting-include-zero-record-results",
        "displayName" : "Include Zero Record Results",
        "description" : "When running the SQL statement, if the result has no data, this property specifies whether or not the empty result set will be transmitted.",
        "defaultValue" : "false",
        "allowableValues" : [ {
          "allowableValue" : {
            "displayName" : "true",
            "value" : "true"
          },
          "canRead" : true
        }, {
          "allowableValue" : {
            "displayName" : "false",
            "value" : "false"
          },
          "canRead" : true
        } ],
        "required" : true,
        "sensitive" : false,
        "dynamic" : false,
        "supportsEl" : false,
        "expressionLanguageScope" : "Not Supported"
      }
    },
    "validationErrors" : [ "'Record Destination Service' is invalid because Record Destination Service is required", "'SQL Query' is invalid because SQL Query is required" ],
    "validationStatus" : "INVALID",
    "activeThreadCount" : 0,
    "extensionMissing" : false
  },
  "operatePermissions" : {
    "canRead" : true,
    "canWrite" : true
  },
  "status" : {
    "runStatus" : "STOPPED",
    "validationStatus" : "INVALID",
    "activeThreadCount" : 0
  }
}~                 

#> nifi get-reporting-tasks --baseUrl http://edge2ai-1.dim.local:8080 -verbose

#   Name                     ID                                     Type                     Run Status   
-   ----------------------   ------------------------------------   ----------------------   ----------   
1   QueryNiFiReportingTask   413c4367-0178-1000-0000-00002464dfb0   QueryNiFiReportingTask   RUNNING      
2   QueryNiFiReportingTask   07914d9f-1ce3-1174-0000-000039db6547   QueryNiFiReportingTask   STOPPED      

#> nifi get-reporting-tasks --baseUrl http://edge2ai-1.dim.local:8080 -verbose -ot json                                                             
{
  "reportingTasks" : [ {
    "revision" : {
      "clientId" : "079148c2-1ce3-1174-a195-9e6dc9febc6e",
      "version" : 15
    },
    "id" : "413c4367-0178-1000-0000-00002464dfb0",
    "uri" : "http://edge2ai-1.dim.local:8080/nifi-api/reporting-tasks/413c4367-0178-1000-0000-00002464dfb0",
    "permissions" : {
      "canRead" : true,
      "canWrite" : true
    },
    "bulletins" : [ ],
    "component" : {
      "id" : "413c4367-0178-1000-0000-00002464dfb0",
      "name" : "QueryNiFiReportingTask",
      "type" : "org.apache.nifi.reporting.sql.QueryNiFiReportingTask",
      "bundle" : {
        "group" : "org.apache.nifi",
        "artifact" : "nifi-sql-reporting-nar",
        "version" : "1.11.4.2.0.4.0-80"
      },
      "state" : "RUNNING",
      "comments" : "",
      "persistsState" : false,
      "restricted" : false,
      "deprecated" : false,
      "multipleVersionsAvailable" : false,
      "schedulingPeriod" : "1 min",
      "schedulingStrategy" : "TIMER_DRIVEN",
      "defaultSchedulingPeriod" : {
        "TIMER_DRIVEN" : "0 sec",
        "CRON_DRIVEN" : "* * * * * ?"
      },
      "properties" : {
        "sql-reporting-query" : "SELECT * FROM PROVENANCE LIMIT 1",
        "sql-reporting-record-sink" : "413c98ef-0178-1000-ffff-ffffb30e3409"
      },
      "descriptors" : {
        "sql-reporting-query" : {
          "name" : "sql-reporting-query",
          "displayName" : "SQL Query",
          "description" : "SQL SELECT statement specifies which tables to query and how data should be filtered/transformed. SQL SELECT can select from the CONNECTION_STATUS, PROCESSOR_STATUS, BULLETINS, PROCESS_GROUP_STATUS, JVM_METRICS, CONNECTION_STATUS_PREDICTIONS, or PROVENANCE tables. Note that the CONNECTION_STATUS_PREDICTIONS table is not available for querying if analytics are not enabled).",
          "required" : true,
          "sensitive" : false,
          "dynamic" : false,
          "supportsEl" : true,
          "expressionLanguageScope" : "Variable Registry Only"
        },
        "sql-reporting-record-sink" : {
          "name" : "sql-reporting-record-sink",
          "displayName" : "Record Destination Service",
          "description" : "Specifies the Controller Service to use for writing out the query result records to some destination.",
          "allowableValues" : [ {
            "allowableValue" : {
              "displayName" : "QRKafkaRecordSink_2_0",
              "value" : "413c98ef-0178-1000-ffff-ffffb30e3409"
            },
            "canRead" : true
          } ],
          "required" : true,
          "sensitive" : false,
          "dynamic" : false,
          "supportsEl" : false,
          "expressionLanguageScope" : "Not Supported",
          "identifiesControllerService" : "org.apache.nifi.record.sink.RecordSinkService",
          "identifiesControllerServiceBundle" : {
            "group" : "org.apache.nifi",
            "artifact" : "nifi-standard-services-api-nar",
            "version" : "1.11.4.2.0.4.0-80"
          }
        },
        "sql-reporting-include-zero-record-results" : {
          "name" : "sql-reporting-include-zero-record-results",
          "displayName" : "Include Zero Record Results",
          "description" : "When running the SQL statement, if the result has no data, this property specifies whether or not the empty result set will be transmitted.",
          "defaultValue" : "false",
          "allowableValues" : [ {
            "allowableValue" : {
              "displayName" : "true",
              "value" : "true"
            },
            "canRead" : true
          }, {
            "allowableValue" : {
              "displayName" : "false",
              "value" : "false"
            },
            "canRead" : true
          } ],
          "required" : true,
          "sensitive" : false,
          "dynamic" : false,
          "supportsEl" : false,
          "expressionLanguageScope" : "Not Supported"
        }
      },
      "validationErrors" : [ ],
      "validationStatus" : "VALID",
      "activeThreadCount" : 0,
      "extensionMissing" : false
    },
    "operatePermissions" : {
      "canRead" : true,
      "canWrite" : true
    },
    "status" : {
      "runStatus" : "RUNNING",
      "validationStatus" : "VALID",
      "activeThreadCount" : 0
    }
  }, {
    "revision" : {
      "clientId" : "07914c22-1ce3-1174-900c-2dff6ee491d2",
      "version" : 1
    },
    "id" : "07914d9f-1ce3-1174-0000-000039db6547",
    "uri" : "http://edge2ai-1.dim.local:8080/nifi-api/reporting-tasks/07914d9f-1ce3-1174-0000-000039db6547",
    "permissions" : {
      "canRead" : true,
      "canWrite" : true
    },
    "bulletins" : [ ],
    "component" : {
      "id" : "07914d9f-1ce3-1174-0000-000039db6547",
      "name" : "QueryNiFiReportingTask",
      "type" : "org.apache.nifi.reporting.sql.QueryNiFiReportingTask",
      "bundle" : {
        "group" : "org.apache.nifi",
        "artifact" : "nifi-sql-reporting-nar",
        "version" : "1.11.4.2.0.4.0-80"
      },
      "state" : "STOPPED",
      "persistsState" : false,
      "restricted" : false,
      "deprecated" : false,
      "multipleVersionsAvailable" : false,
      "schedulingPeriod" : "5 mins",
      "schedulingStrategy" : "TIMER_DRIVEN",
      "defaultSchedulingPeriod" : {
        "TIMER_DRIVEN" : "0 sec",
        "CRON_DRIVEN" : "* * * * * ?"
      },
      "properties" : { },
      "descriptors" : {
        "sql-reporting-query" : {
          "name" : "sql-reporting-query",
          "displayName" : "SQL Query",
          "description" : "SQL SELECT statement specifies which tables to query and how data should be filtered/transformed. SQL SELECT can select from the CONNECTION_STATUS, PROCESSOR_STATUS, BULLETINS, PROCESS_GROUP_STATUS, JVM_METRICS, CONNECTION_STATUS_PREDICTIONS, or PROVENANCE tables. Note that the CONNECTION_STATUS_PREDICTIONS table is not available for querying if analytics are not enabled).",
          "required" : true,
          "sensitive" : false,
          "dynamic" : false,
          "supportsEl" : true,
          "expressionLanguageScope" : "Variable Registry Only"
        },
        "sql-reporting-record-sink" : {
          "name" : "sql-reporting-record-sink",
          "displayName" : "Record Destination Service",
          "description" : "Specifies the Controller Service to use for writing out the query result records to some destination.",
          "allowableValues" : [ {
            "allowableValue" : {
              "displayName" : "QRKafkaRecordSink_2_0",
              "value" : "413c98ef-0178-1000-ffff-ffffb30e3409"
            },
            "canRead" : true
          } ],
          "required" : true,
          "sensitive" : false,
          "dynamic" : false,
          "supportsEl" : false,
          "expressionLanguageScope" : "Not Supported",
          "identifiesControllerService" : "org.apache.nifi.record.sink.RecordSinkService",
          "identifiesControllerServiceBundle" : {
            "group" : "org.apache.nifi",
            "artifact" : "nifi-standard-services-api-nar",
            "version" : "1.11.4.2.0.4.0-80"
          }
        },
        "sql-reporting-include-zero-record-results" : {
          "name" : "sql-reporting-include-zero-record-results",
          "displayName" : "Include Zero Record Results",
          "description" : "When running the SQL statement, if the result has no data, this property specifies whether or not the empty result set will be transmitted.",
          "defaultValue" : "false",
          "allowableValues" : [ {
            "allowableValue" : {
              "displayName" : "true",
              "value" : "true"
            },
            "canRead" : true
          }, {
            "allowableValue" : {
              "displayName" : "false",
              "value" : "false"
            },
            "canRead" : true
          } ],
          "required" : true,
          "sensitive" : false,
          "dynamic" : false,
          "supportsEl" : false,
          "expressionLanguageScope" : "Not Supported"
        }
      },
      "validationErrors" : [ "'Record Destination Service' is invalid because Record Destination Service is required", "'SQL Query' is invalid because SQL Query is required" ],
      "validationStatus" : "INVALID",
      "activeThreadCount" : 0,
      "extensionMissing" : false
    },
    "operatePermissions" : {
      "canRead" : true,
      "canWrite" : true
    },
    "status" : {
      "runStatus" : "STOPPED",
      "validationStatus" : "INVALID",
      "activeThreadCount" : 0
    }
  } ]
}~  

#> nifi get-reporting-task  --baseUrl http://edge2ai-1.dim.local:8080 -verbose --reportingTaskId 413c4367-0178-1000-0000-00002464dfb0 -ot json
{
  "revision" : {
    "clientId" : "079148c2-1ce3-1174-a195-9e6dc9febc6e",
    "version" : 15
  },
  "id" : "413c4367-0178-1000-0000-00002464dfb0",
  "uri" : "http://edge2ai-1.dim.local:8080/nifi-api/reporting-tasks/413c4367-0178-1000-0000-00002464dfb0",
  "permissions" : {
    "canRead" : true,
    "canWrite" : true
  },
  "bulletins" : [ ],
  "component" : {
    "id" : "413c4367-0178-1000-0000-00002464dfb0",
    "name" : "QueryNiFiReportingTask",
    "type" : "org.apache.nifi.reporting.sql.QueryNiFiReportingTask",
    "bundle" : {
      "group" : "org.apache.nifi",
      "artifact" : "nifi-sql-reporting-nar",
      "version" : "1.11.4.2.0.4.0-80"
    },
    "state" : "RUNNING",
    "comments" : "",
    "persistsState" : false,
    "restricted" : false,
    "deprecated" : false,
    "multipleVersionsAvailable" : false,
    "schedulingPeriod" : "1 min",
    "schedulingStrategy" : "TIMER_DRIVEN",
    "defaultSchedulingPeriod" : {
      "TIMER_DRIVEN" : "0 sec",
      "CRON_DRIVEN" : "* * * * * ?"
    },
    "properties" : {
      "sql-reporting-query" : "SELECT * FROM PROVENANCE LIMIT 1",
      "sql-reporting-record-sink" : "413c98ef-0178-1000-ffff-ffffb30e3409"
    },
    "descriptors" : {
      "sql-reporting-query" : {
        "name" : "sql-reporting-query",
        "displayName" : "SQL Query",
        "description" : "SQL SELECT statement specifies which tables to query and how data should be filtered/transformed. SQL SELECT can select from the CONNECTION_STATUS, PROCESSOR_STATUS, BULLETINS, PROCESS_GROUP_STATUS, JVM_METRICS, CONNECTION_STATUS_PREDICTIONS, or PROVENANCE tables. Note that the CONNECTION_STATUS_PREDICTIONS table is not available for querying if analytics are not enabled).",
        "required" : true,
        "sensitive" : false,
        "dynamic" : false,
        "supportsEl" : true,
        "expressionLanguageScope" : "Variable Registry Only"
      },
      "sql-reporting-record-sink" : {
        "name" : "sql-reporting-record-sink",
        "displayName" : "Record Destination Service",
        "description" : "Specifies the Controller Service to use for writing out the query result records to some destination.",
        "allowableValues" : [ {
          "allowableValue" : {
            "displayName" : "QRKafkaRecordSink_2_0",
            "value" : "413c98ef-0178-1000-ffff-ffffb30e3409"
          },
          "canRead" : true
        } ],
        "required" : true,
        "sensitive" : false,
        "dynamic" : false,
        "supportsEl" : false,
        "expressionLanguageScope" : "Not Supported",
        "identifiesControllerService" : "org.apache.nifi.record.sink.RecordSinkService",
        "identifiesControllerServiceBundle" : {
          "group" : "org.apache.nifi",
          "artifact" : "nifi-standard-services-api-nar",
          "version" : "1.11.4.2.0.4.0-80"
        }
      },
      "sql-reporting-include-zero-record-results" : {
        "name" : "sql-reporting-include-zero-record-results",
        "displayName" : "Include Zero Record Results",
        "description" : "When running the SQL statement, if the result has no data, this property specifies whether or not the empty result set will be transmitted.",
        "defaultValue" : "false",
        "allowableValues" : [ {
          "allowableValue" : {
            "displayName" : "true",
            "value" : "true"
          },
          "canRead" : true
        }, {
          "allowableValue" : {
            "displayName" : "false",
            "value" : "false"
          },
          "canRead" : true
        } ],
        "required" : true,
        "sensitive" : false,
        "dynamic" : false,
        "supportsEl" : false,
        "expressionLanguageScope" : "Not Supported"
      }
    },
    "validationErrors" : [ ],
    "validationStatus" : "VALID",
    "activeThreadCount" : 0,
    "extensionMissing" : false
  },
  "operatePermissions" : {
    "canRead" : true,
    "canWrite" : true
  },
  "status" : {
    "runStatus" : "RUNNING",
    "validationStatus" : "VALID",
    "activeThreadCount" : 0
  }
}~ 
