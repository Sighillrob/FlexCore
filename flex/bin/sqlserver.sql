
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

CREATE SEQUENCE allocateHandleSequence AS bigint START WITH 500 INCREMENT BY 1 cache 30;

CREATE TABLE Class_def_table88 (
    class_name          NVARCHAR( 1024 ),
    class_id            INTEGER 
);

CREATE TABLE mixin_def_table (
    mixin_name          NVARCHAR( 1024 ),
    inTable             NVARCHAR( 64 ),
    inColumn            NVARCHAR( 64 )
);

CREATE SEQUENCE scopeKeySequence AS bigint START WITH 1 INCREMENT BY 1 cache 1;

CREATE TABLE Propdesc_table88 (
    name                NVARCHAR( 1024 ),
    type                INTEGER,
    definedIn           NVARCHAR( 1024 ),
    inTable             NVARCHAR( 64 ),
    inColumn            NVARCHAR( 64 ),
    indexName           NVARCHAR( 1026 ),
	sequenceName		NVARCHAR( 1024 ),
	scopeTableKey		NUMERIC(3),
	hasAuditTable		NUMERIC(1)
);

CREATE TABLE preferences_table (
    applicationName NVARCHAR( 1024 ),
    preferenceName  NVARCHAR( 1024 ),
    className       NVARCHAR( 1024 ),
    classType       NVARCHAR( 1024 ),
    instance_id     BIGINT,
    user_id         BIGINT,
    preferenceValue ntext
);

CREATE TABLE config_table (
	applicationName NVARCHAR( 1024 ),
	configValue     ntext
);

CREATE TABLE contentChangeTable88 (
    change_id       BIGINT UNIQUE IDENTITY NOT NULL,
    handle_id       BIGINT NOT NULL,
    propName        NVARCHAR( 2050 ) NOT NULL,    
    changeType      NUMERIC( 1 ) NOT NULL,
    uri             NVARCHAR( 1024 ) NOT NULL,
    modified_date   DATETIME NOT NULL
);

CREATE TABLE schema_table (
    schema_id   INTEGER NOT NULL,
    schema_xml  ntext,
    schema_date DATETIME
);
                    
CREATE TABLE version_table (
    name           NVARCHAR( 64 ),
    next_version   INTEGER
);

INSERT INTO version_table( name, next_version )
  VALUES( 'db version', 9 );
  
CREATE SEQUENCE nextContentSlotSequence0 AS bigint START WITH 1 INCREMENT BY 1 cache 30;

CREATE TABLE listenerMap( listenerName VARCHAR( 256 ) UNIQUE, sequenceName VARCHAR( 32 ), tableName VARCHAR( 32 ), securityInfo VARCHAR( 512 ) );

CREATE TABLE mixinIndex_table ( 
	mixinName NVARCHAR(1024), 	
	inTable NVARCHAR(1024),
	inColumn NVARCHAR(2050),
	indexName NVARCHAR(1026)
);

CREATE SEQUENCE disasterID_seq START WITH 1 INCREMENT BY 1 cache 30;

CREATE TABLE disaster_table(
    disasterID     BIGINT NOT NULL, 
    disasterTime   DATETIME, 
    user_id        BIGINT,             
    subsystem      NVARCHAR( 256 ),            
    severityLevel  NVARCHAR( 64 ), 
    disasterInfo   ntext
);

CREATE TABLE CIMRecovery( 
	batchName NVARCHAR( 1024 ), 
	taskName NVARCHAR( 1024 ) 
);