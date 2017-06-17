
CREATE TABLE AclID_table88 (
    acl_id          NUMBER(20) NOT NULL,
    principal_id    NUMBER(20) NOT NULL
);

CREATE TABLE Object_table(
    handle                          NUMBER(20) UNIQUE NOT NULL,
    handle_class                    NUMBER(6) NOT NULL,
    effective_acl                   NUMBER(20),
    acl_parent                      NUMBER(20),
	effective_owner					NUMERIC(20),
	owner_parent					NUMERIC(20),
);

CREATE TABLE scope_table( 
	handle		NUMBER(20), 
	scope		NUMBER(20), 
	propertyKey NUMERIC(3) 
);

CREATE SEQUENCE allocateHandleSequence START WITH 500 INCREMENT BY 1 cache 30;

CREATE TABLE Class_def_table88 (
    class_name          VARCHAR2( 1024 CHAR),
    class_id            NUMBER(6) 
);

CREATE TABLE mixin_def_table (
    mixin_name          VARCHAR2( 1024 CHAR ),
    inTable             VARCHAR2( 64 CHAR ),
    inColumn            VARCHAR2( 64 CHAR )
);

CREATE SEQUENCE scopeKeySequence START WITH 1 INCREMENT BY 1 cache 1;

CREATE TABLE Propdesc_table88 (
    name                VARCHAR2( 1024 CHAR),
    type                NUMBER(6),
    definedIn           VARCHAR2( 1024 CHAR),
    inTable             VARCHAR2( 64 CHAR),
    inColumn            VARCHAR2( 64 CHAR),
    indexName           VARCHAR2( 1026 CHAR),
	sequenceName		VARCHAR2( 1024 CHAR),
	scopeTableKey		NUMERIC(3),
	hasAuditTable		NUMERIC(1)
);

CREATE TABLE preferences_table (
    applicationName VARCHAR2( 1024 CHAR),
    preferenceName  VARCHAR2( 1024 CHAR),
    className       VARCHAR2( 1024 CHAR),
    classType       VARCHAR2( 1024 CHAR ),
    instance_id     NUMBER(20),
    user_id         NUMBER(20),
    preferenceValue CLOB
);

CREATE TABLE config_table (
	applicationName VARCHAR2( 1024 CHAR),
	configValue     CLOB
);

CREATE TABLE contentChangeTable88 (
    change_id       NUMBER(20) UNIQUE NOT NULL,
    handle_id       NUMBER(20) NOT NULL,
    propName        VARCHAR2( 2050 CHAR) NOT NULL,    
    changeType      NUMERIC( 1 ) NOT NULL,
    uri             VARCHAR2( 1024 CHAR) NOT NULL,
    modified_date   TIMESTAMP NOT NULL
);

CREATE TABLE schema_table (
    schema_id   NUMBER(6) NOT NULL,
    schema_xml  CLOB,
    schema_date TIMESTAMP
);
                    
CREATE TABLE version_table (
    name           VARCHAR2( 64 CHAR),
    next_version   NUMBER(6)
);

INSERT INTO version_table( name, next_version )
  VALUES( 'db version', 9 );
  
CREATE SEQUENCE nextContentSlotSequence0 START WITH 1 INCREMENT BY 1 cache 30;

CREATE TABLE listenerMap(
	listenerName VARCHAR2( 256 CHAR) UNIQUE, 
	sequenceName VARCHAR2( 32 CHAR), 
	tableName VARCHAR2( 32 CHAR), 
	securityInfo VARCHAR2( 512 CHAR) 
);

CREATE TABLE mixinIndex_table ( 
	mixinName VARCHAR2(1024 CHAR),  
	inTable VARCHAR2(1024 CHAR),
	inColumn VARCHAR2(2050 CHAR),
	indexName VARCHAR2(1026 CHAR)
);

CREATE SEQUENCE disasterID_seq INCREMENT BY 1 START WITH 1;

CREATE TABLE disaster_table(
    disasterID     NUMBER(20), 
    disasterTime   DATE, 
    user_id        NUMBER(20),             
    subsystem      VARCHAR2( 256 CHAR ),            
    severityLevel  VARCHAR2( 64 CHAR ), 
    disasterInfo   CLOB
);

CREATE TABLE CIMRecovery( 
	batchName VARCHAR2( 1024 ), 
	taskName VARCHAR2( 1024 ) 
);

CREATE OR REPLACE PROCEDURE resetSequence (seqName IN varchar2, newValue IN number) is nextValue number(20); incrementalVal number(20);  begin    execute immediate 'select '|| seqName ||'.nextVal from dual' into nextValue;    incrementalVal := newValue - nextValue - 1;    if incrementalVal <> 0 then        execute immediate 'alter sequence '|| seqName ||' increment by '|| incrementalVal;    end if;    execute immediate 'select '|| seqName ||'.nextVal from dual' into nextValue;    execute immediate 'alter sequence '|| seqname ||' increment by 1';end;
