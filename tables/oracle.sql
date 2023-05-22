CREATE TABLE VACCINE
(
    vaccine_id number(10) NOT NULL,
    vaccine_name varchar2(50) NOT NULL,
    vaccine_dose number(10),
    vaccine_age varchar2(50),
    CONSTRAINT vaccine_pk PRIMARY KEY (vaccine_id)
);

CREATE TABLE cdc.transcomevents ( 
uuid varchar2(64), 
ts NUMBER(20),  
title varchar2(4000), 
description varchar2(4000), 
pubDate varchar2(255), 
point varchar2(255),
	 latitude NUMBER(25,2), 
   longitude NUMBER(25,2), 
    CONSTRAINT uuid_pk PRIMARY KEY (uuid)
);
