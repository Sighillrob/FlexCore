CREATE TABLE AclID_table88 (
    acl_id          BIGINT NOT NULL,
    principal_id    BIGINT NOT NULL
);

CREATE TABLE Object_table(
    handle                          BIGINT NOT NULL,
    handle_class                    INTEGER NOT NULL,
    effective_acl                   BIGINT,
    acl_parent                      BIGINT,
	effective_owner					BIGINT,
	owner_parent					BIGINT
);

CREATE TABLE scope_table( 
	handle		BIGINT, 
	scope		BIGINT, 
	propertyKey NUMERIC(3) 
);

CREATE TABLE allocateHandle_table( handle BIGINT NOT NULL );
INSERT INTO  allocateHandle_table VALUES( 1 );

CREATE SEQUENCE allocateHandleSequence INCREMENT BY 1 START 500 OWNED BY allocateHandle_table.handle CACHE 1;

CREATE TABLE Class_def_table88 (
    class_name          VARCHAR( 1024 ),
    class_id            INTEGER 
);

CREATE TABLE mixin_def_table (
    mixin_name          VARCHAR( 1024 ),
    inTable             VARCHAR( 64 ),
    inColumn            VARCHAR( 64 )
);

CREATE SEQUENCE scopeKeySequence INCREMENT BY 1 START 1 CACHE 1;

CREATE TABLE Propdesc_table88 (
    name                VARCHAR( 1024 ),
    type                INTEGER,
    definedIn           VARCHAR( 1024 ),
    inTable             VARCHAR( 64 ),
    inColumn            VARCHAR( 64 ),
    indexName           VARCHAR( 1026 ),
	sequenceName		VARCHAR( 1024 ),
	scopeTableKey		NUMERIC(3),
	hasAuditTable		NUMERIC(1)
);

CREATE TABLE preferences_table (
    applicationName VARCHAR( 1024 ),
    preferenceName  VARCHAR( 1024 ),
    className       VARCHAR( 1024 ),
    classType       VARCHAR( 1024 ),
    instance_id     BIGINT,
    user_id         BIGINT,
    preferenceValue TEXT
);

CREATE TABLE config_table (
	applicationName VARCHAR( 1024 ),
	configValue     TEXT
);

CREATE TABLE contentChangeTable88 (
    change_id       BIGINT UNIQUE NOT NULL,
    handle_id       BIGINT NOT NULL,
    propName        VARCHAR( 2050 ) NOT NULL,    
    changeType      NUMERIC( 1 ) NOT NULL,
    uri             VARCHAR( 1024 ) NOT NULL,
    modified_date   TIMESTAMP NOT NULL
);
                    
CREATE TABLE schema_table (
    schema_id   INTEGER NOT NULL,
    schema_xml  text,
    schema_date TIMESTAMP
);

CREATE TABLE version_table (
    name           VARCHAR( 64 ),
    next_version   INTEGER
);

INSERT INTO version_table( name, next_version )
  VALUES( 'db version', 9 );
  
 CREATE SEQUENCE nextContentSlotSequence0 INCREMENT BY 1 START 1 CACHE 1;

 CREATE TABLE listenerMap( listenerName VARCHAR( 256 ) UNIQUE, sequenceName VARCHAR( 32 ), tableName VARCHAR( 32 ), securityInfo VARCHAR( 512 ) );

 CREATE TABLE mixinIndex_table ( 
	mixinName VARCHAR(1024), 
	inTable VARCHAR(1024),
	inColumn VARCHAR(2050),
	indexName VARCHAR(1026)
 );

CREATE SEQUENCE disasterID_seq INCREMENT BY 1 START 1 CACHE 1;

CREATE TABLE disaster_table(
    disasterID     BIGINT NOT NULL, 
    disasterTime   TIMESTAMP, 
    user_id        BIGINT,             
    subsystem      VARCHAR( 256 ),            
    severityLevel  VARCHAR( 64 ), 
    disasterInfo   TEXT
);

CREATE TABLE CIMRecovery( 
	batchName VARCHAR( 1024 ), 
	taskName VARCHAR( 1024 ) 
);
