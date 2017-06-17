CREATE TABLE ACL_table ( handle_class       NUMERIC(6) NOT NULL,
                         handle_index       INTEGER NOT NULL,
                         handle_id          BIGINT NOT NULL,
                         Object_isDeleted   NUMERIC(1) NOT NULL,
                         user_group_class   NUMERIC(6) NOT NULL,
                         user_group_index   INTEGER NOT NULL,
                         searcher           INTEGER NOT NULL,
                         reader             INTEGER NOT NULL,
                         writer             INTEGER NOT NULL,
                         manager            INTEGER NOT NULL,
                         writeLinked        INTEGER NOT NULL,
                         readLinked         INTEGER NOT NULL,
                         readHistory        INTEGER NOT NULL
                       );

CREATE TABLE Link_table ( source_class      NUMERIC(6) NOT NULL,
                          source_index      INTEGER NOT NULL,
                          source_id         BIGINT NOT NULL,
                          source_isDeleted  NUMERIC(1) NOT NULL,
                          linkType          NUMERIC(6) NOT NULL,
                          destination_class NUMERIC(6) NOT NULL,
                          destination_index INTEGER NOT NULL,
                          destination_id    BIGINT NOT NULL,
                          destination_isDeleted NUMERIC(1) NOT NULL
                        );

CREATE TABLE DSObject_table ( handle_class              NUMERIC(6) NOT NULL,
                              handle_index              INTEGER NOT NULL,
                              handle_id                 BIGINT NOT NULL,
                              Object_isDeleted          NUMERIC(1), 
                              Object_isRootElement      NUMERIC(1),
                              Object_isRecord           NUMERIC(1),
                              Object_isSystemObj        NUMERIC(1),
                              Object_title              VARCHAR(256),
                              Object_webdav_title       VARCHAR(356),
                              Object_summary            VARCHAR(1024),
                              Object_description        LONGTEXT,
                              Object_create_date        DATETIME, 
                              Object_modified_date      DATETIME,
                              Object_keywords           VARCHAR( 1024 ),
                              Object_space              VARCHAR( 64 ),
                              Object_Locale             VARCHAR( 32 ),
                              Object_readyForDeclare    NUMERIC(1),
                              Document_author           VARCHAR( 128 ),
                              Document_highest_version_used     INTEGER,
                              Document_original_file_name VARCHAR( 256 ),
                              Document_add_as_draft     NUMERIC(1),
                              Document_canAddVersions   NUMERIC(1),
                              Document_isInteract       NUMERIC(1),
                              Docum_autoMovePreferredVersion NUMERIC(1),
                              Document_max_versions     INTEGER,
                              content_size              NUMERIC( 19, 0 ),
                              Version_revision_comments VARCHAR( 1024 ),
                              Version_version_number    INTEGER,
                              Rendition_generated       NUMERIC(1),
                              Rendition_rendition_type  VARCHAR( 512 ),
                              Remote_DN                 VARCHAR( 256 ),
                              domain_name               VARCHAR( 128 ),
                              User_username             VARCHAR( 128 ),
                              User_last_name            VARCHAR( 64 ),
                              User_first_name           VARCHAR( 64 ),
                              User_userLevel            VARCHAR( 32 ),
                              User_isActive             NUMERIC(1),
                              User_changePasswordAtLogin NUMERIC(1),
                              User_passwordExpiration   DATETIME,
                              User_failedLoginCount     INTEGER,
                              Space_spaceName           VARCHAR( 64 )
                              );

CREATE TABLE DSProp_table( handle_class NUMERIC(6), handle_index INTEGER,
                           handle_id BIGINT, 
                           isPrivate NUMERIC(1), 
                           user_handle_class NUMERIC(6), user_handle_index INTEGER, 
                           propName VARCHAR( 64 ), 
                           type NUMERIC(4), 
                           propdesc_ID NUMERIC(6),
                           ordering INTEGER, 
                           intBoolVal INTEGER, 
                           textVal LONGTEXT, 
                           floatVal FLOAT, 
                           dateVal DATETIME, 
                           stringVal VARCHAR( 4000 ),
						   bigDecimalVal NUMERIC( 26, 7 ),
						   referenceVal BIGINT );

CREATE TABLE CE_table ( ce_key                  BIGINT NOT NULL, 
                        ce_order                INTEGER,
                        originalName            VARCHAR( 512 ),
                        contentRepoHandle       VARCHAR( 128 ),
                        bucketID                VARCHAR( 128 ),
                        content_size            NUMERIC( 19, 0 ),
                        repoID                  INTEGER,
                        ce_owner_index          INTEGER,
						optimized_directory     NUMERIC(1),
                        constraint CE_table2_PK PRIMARY KEY ( ce_key, ce_order ) );

CREATE TABLE CE_guid_Mapping( repoID INTEGER, guid VARCHAR( 128 ));

CREATE TABLE isDeleted_table( handle_id    BIGINT,
                              directDelete NUMERIC(1),
							  deleteJobID  BIGINT );

CREATE TABLE rootObjectTable( handle_id BIGINT NOT NULL );

CREATE TABLE userInfo_table( handle_id  BIGINT         NOT NULL,
                             username   VARCHAR( 128 ) NOT NULL, 
                             domain     VARCHAR( 128 ) NOT NULL, 
                             userLevel  VARCHAR( 32 ) NOT NULL,
                             isActive   NUMERIC(1) );

CREATE TABLE careAboutTable( feature VARCHAR( 32 ), active NUMERIC(1) NOT NULL );

CREATE TABLE accessTable( handle_id   BIGINT, 
                          user_id     BIGINT, 
                          op          NUMERIC(4),
                          opDate      DATETIME,
                          commentText LONGTEXT,
                          changeData  LONGTEXT );

CREATE TABLE NextID_table ( class_name          VARCHAR( 64 ) UNIQUE,
                           next_handle          INTEGER );

CREATE TABLE StringTable ( locale           VARCHAR( 32 ),
                           stringType       VARCHAR( 32 ),
                           applicableClass  VARCHAR( 64 ),
                           stringKey        VARCHAR( 128 ),
                           stringValue      VARCHAR( 3850 )
                         );
CREATE TABLE InstanceStringTable ( locale           VARCHAR( 64 ),
                                   stringType       VARCHAR( 32 ),
                                   handle_id        BIGINT,
                                   isPrivate        INTEGER, 
                                   user_handle_id   BIGINT,    
                                   stringKey        VARCHAR( 64 ),
                                   stringValue      VARCHAR( 3850 )
                         );
CREATE TABLE Class_Def_Table( class_name    VARCHAR( 64 ),
                              class_id      INTEGER, 
                              originalName  VARCHAR( 64 ),
                              clonedFrom    VARCHAR( 64 ),
                              instantiable  INTEGER, 
                              system        INTEGER,
                              cloneable     INTEGER,
                              sourceLinkTypes       VARCHAR( 2048 ),
                              destinationLinkTypes  VARCHAR( 2048 ),
                              containerLinkTypes  VARCHAR( 2048 ),
                              canBeRecord   INTEGER,
                              enabledUserLevels     VARCHAR( 64 ),
							  isContentIndexable INTEGER
                            );
CREATE TABLE Propdesc_table( name       VARCHAR( 64 ),
                             type       INTEGER,
                             className  VARCHAR( 64 ),
                             system     INTEGER,
                             readOnly   INTEGER,
                             multiValued INTEGER,
                             required   INTEGER,
                             searchable INTEGER,
                             wantDbIndex INTEGER,
                             sortable   INTEGER,
                             basic      INTEGER,
                             isExternal INTEGER,
                             isExternalReadonly INTEGER,
                             hasSpecialSetter INTEGER,
                             useDefinedOrder INTEGER,
                             maxSize    INTEGER,
                             textEntryMode VARCHAR( 32 ),
                             validationString LONGTEXT, 
                             height     INTEGER,
                             inputStyle VARCHAR( 32 CR ),
                             defaultValue LONGTEXT,
                             minValue   VARCHAR( 32 ),
                             maxValue   VARCHAR( 32 ),
                             valPrecision  INTEGER,
                             valScale      INTEGER,
                             possibleValues LONGTEXT,
                             alwaysWellFormedXML NUMERIC(1),
                             propdesc_ID NUMERIC(6),
                             isInstanceProperty INTEGER,
                             propdesc_ID_refCount NUMERIC(6),
                             xmlIndexableValuePath LONGTEXT,
                             isPrivate  INTEGER,
                             dateAccuracy VARCHAR( 32 )
                          );
CREATE TABLE Linkdesc_table( name           VARCHAR( 64 ),
                             link_id        INTEGER, 
                             system         INTEGER,
                             readOnly       INTEGER,
                             requiredBySource   INTEGER,
                             multiSources       INTEGER,
                             multiDestinations  INTEGER,
                             indexablePropNames     VARCHAR( 64 ),
                             autoDeleteDestinations INTEGER,
                             autoInheritPermissions INTEGER,
                             addToSourceACL         INTEGER,
                             cascadeTraverse        INTEGER,
                             export                 INTEGER,
                             setsModified           INTEGER,
                             sourcePermissions      INTEGER,
                             destinationPermissions INTEGER,
                             accessDestPermissions  INTEGER,
                             includeInRecord        INTEGER,
                             enabledUserLevels      VARCHAR( 64 ),
                             internal               INTEGER
                          );
CREATE TABLE PropColumnMap( className      VARCHAR( 64 ),
                            propDescName   VARCHAR( 64 ),
                            columnName     VARCHAR( 64 ),
                            generatedIndex VARCHAR( 64 )
                          );
CREATE TABLE Class_Display_Sequence( class_name    VARCHAR( 64 ), 
                                     display_name  VARCHAR( 64 ), 
                                     sequenceNumber INTEGER,
                                     isLinkType    INTEGER, 
                                     isDestination INTEGER, 
                                     linkPropName  VARCHAR( 64 ) );
                                     
CREATE TABLE cameFromTable ( localHandleID  BIGINT NOT NULL,
                             remoteHandleID BIGINT NOT NULL,
                             serverIndex    NUMERIC(6) NOT NULL,
                             lastRefresh    DATETIME
                           );

CREATE TABLE siteIndexTable ( serverIDString VARCHAR( 2000 ),
                              siteType VARCHAR( 32 ), 
                              friendlyName VARCHAR( 256 ),
                              baseResource VARCHAR( 1024 ),
                              connectionInfo LONGTEXT, 
                              serverIndex    NUMERIC(6) NOT NULL,
                              moderatorIndex NUMERIC(6) NOT NULL
                            );

CREATE TABLE FedPropMap( localClassName VARCHAR( 32 ),   
						 localPropName VARCHAR( 32 ), 
						 serverIDString VARCHAR( 512 ), 
						 remoteClassName VARCHAR( 256 ), 
						 remotePropNameSearch VARCHAR( 256 ),
						 remotePropNameField VARCHAR( 256 ) );

CREATE TABLE federationApplicants ( serverIDString  VARCHAR( 2000 ) NOT NULL,
                                    moderatorIndex  NUMERIC(6) NOT NULL,
                                    passcode        VARCHAR( 32 ) NOT NULL,
                                    applicationTime DATETIME
                                  );

CREATE TABLE backgroundJob_table( JobID BIGINT,       
                                  JobParameters LONGTEXT, 
                                  createTime DATETIME,   
                                  stateTime DATETIME,    
                                  lastException LONGTEXT,
                                  state INTEGER,  
								  stateDetail INTEGER,  
                                  jobType INTEGER,   
                                  description LONGTEXT,
                                  userHandle BIGINT );

CREATE TABLE nxscope ( handle_class NUMERIC(6),
                       handle_index INTEGER,
                       scope_class NUMERIC(6),
                       scope_index INTEGER
                     );

CREATE TABLE nxxml ( nodeid BIGINT,
             handle_class NUMERIC(6),
             handle_index INTEGER,  
             nodetype CHAR(1),  
             nodename VARCHAR(500),
             nodedata LONGTEXT,
             parent VARCHAR(18),
             parent_nodeid BIGINT,
             context VARCHAR(18),
             context_nodeid BIGINT,
             Constraint nxxml_pk primary key(nodeid) );

CREATE TABLE Ingester_Recovery( name VARCHAR( 1024 ), batchID VARCHAR( 1024 ), uniqueID VARCHAR( 1024 ), refCount INTEGER );

CREATE TABLE indexRecovery( handleString VARCHAR( 120 ), messageString VARCHAR( 1024 ), stackTraceString VARCHAR( 1024 ), longDate BIGINT );

CREATE TABLE simpleDocClassMappings( docClassName VARCHAR( 32 ), simpleVersionClassName VARCHAR( 64 ), simpleRenditionClassName VARCHAR( 64 ) );

CREATE TABLE eventTable ( queueName  VARCHAR( 128 ),       
                          eventOrder BIGINT,           
                          batchID    VARCHAR( 128 ),
                          seqNo      NUMERIC( 6 )
                        );

CREATE TABLE eventObjectTable ( eventObj   LONGTEXT,                 
                          batchID    VARCHAR( 128 ),
                          seqNo      NUMERIC( 6 ),
                          refCount   INTEGER
                        );

CREATE TABLE NamedListeners( queueName  VARCHAR( 128 ), 
                             eventTypes NUMERIC( 10 ) );

CREATE TABLE forwardedEventTable ( queueName  VARCHAR( 128 ),       
                          eventObj   LONGTEXT,                 
                          eventOrder BIGINT,           
                          batchID    VARCHAR( 128 ),
                          seqNo      NUMERIC( 6 ),
                          isDaily NUMERIC( 1 )
                        );

CREATE TABLE forwardedSubsTable ( queueName  VARCHAR( 128 CHAR ),
                                  batchID VARCHAR( 128 ),
                                  subscription_id INTEGER,
                                  isDaily NUMERIC( 1 )
                                );

CREATE TABLE subscription_table( subscription INTEGER,
                                 publisher INTEGER,
                                 immediateOnly NUMERIC(1),
                                 eventTypes INTEGER,
                                 addVersionOnly NUMERIC(1)

CREATE TABLE deferredEventTable( detail VARCHAR( 800 ), handle_id BIGINT, sequenceNumber BIGINT, PRIMARY KEY( detail, handle_id ) );

CREATE TABLE cachedTempTableTable( tableName VARCHAR( 128 ), batchID VARCHAR( 128 ) );

CREATE TABLE deleteObjectTempData( target_id BIGINT NOT NULL, internal_objects_parent BIGINT, levelNumber INTEGER );
CREATE TABLE expungeObjectTempData( target_id BIGINT NOT NULL, internal_objects_parent BIGINT, levelNumber INTEGER );
CREATE TABLE restoreObjectTempData( target_id BIGINT NOT NULL, internal_objects_parent BIGINT, levelNumber INTEGER );
CREATE TABLE replaceACLTempData( target_id BIGINT NOT NULL, owner BIGINT, internal_objects_parent BIGINT, levelNumber INTEGER );
CREATE TABLE replaceOwnerTempData( target_id BIGINT NOT NULL, internal_objects_parent BIGINT, levelNumber INTEGER );
CREATE TABLE modifyACLTempData( target_id BIGINT NOT NULL, owner BIGINT, internal_objects_parent BIGINT, levelNumber INTEGER );

CREATE TABLE deleteObjectTempDataBG( target_id BIGINT NOT NULL, internal_objects_parent BIGINT, levelNumber INTEGER );
CREATE TABLE expungeObjectTempDataBG( target_id BIGINT NOT NULL, internal_objects_parent BIGINT, levelNumber INTEGER );
CREATE TABLE restoreObjectTempDataBG( target_id BIGINT NOT NULL, internal_objects_parent BIGINT, levelNumber INTEGER );
CREATE TABLE replaceACLTempDataBG( target_id BIGINT NOT NULL, owner BIGINT, internal_objects_parent BIGINT, levelNumber INTEGER );
CREATE TABLE replaceOwnerTempDataBG( target_id BIGINT NOT NULL, internal_objects_parent BIGINT, levelNumber INTEGER );

CREATE TABLE deleteObjectSkipDataBG( skip_id BIGINT NOT NULL, pass INTEGER );
CREATE TABLE expungeObjectSkipDataBG( skip_id BIGINT NOT NULL, pass INTEGER );
CREATE TABLE replaceACLSkipDataBG( skip_id BIGINT NOT NULL, pass INTEGER );

CREATE TABLE deleteObjectSkipData( skip_id BIGINT NOT NULL, pass INTEGER );
CREATE TABLE expungeObjectSkipData( skip_id BIGINT NOT NULL, pass INTEGER );
CREATE TABLE replaceACLSkipData( skip_id BIGINT NOT NULL, pass INTEGER );
CREATE TABLE modifyACLSkipData( skip_id BIGINT NOT NULL, pass INTEGER );

CREATE TABLE rm_instance_table( handle_id BIGINT, rm_instance_handle VARCHAR( 256 ) );

CREATE TABLE DWE_Max_Id(Id NUMERIC(22) NOT NULL, PRIMARY KEY(Id));
CREATE TABLE DWE_Workflows(Id NUMERIC(22) NOT NULL, Activated BIT NOT NULL, Wake_Up_Time NUMERIC(22) NULL, Class_Type VARCHAR(128) NOT NULL, Template_Id NUMERIC(22) NULL, Unique_Key VARCHAR(50) NULL, Engine_Id VARCHAR(50) NULL, Priority NUMERIC(10) NULL, Template BIT NULL, Date_Estimation BIT NULL, Template_UID VARCHAR(50) NULL, Version VARCHAR(50) NULL, Thumbprint VARCHAR(50) NULL, Version_Timestamp NUMERIC(22) NULL, PRIMARY KEY(Id));
CREATE TABLE DWE_Tasks( Id NUMERIC(22) NOT NULL,Class_Type VARCHAR(128) NOT NULL, Name VARCHAR(50) NULL, Workflow_Id NUMERIC(22) NOT NULL, Parent NUMERIC(22) NULL, Resource_Id VARCHAR(50) NULL, State NUMERIC(10) NOT NULL, Progress NUMERIC(10) NOT NULL, Earliest_Start_Date NUMERIC(22) NULL, Start_Date NUMERIC(22) NOT NULL, End_Date NUMERIC(22) NOT NULL, Notes VARCHAR(250) NULL, Role_Name VARCHAR(50) NULL, Template_Id NUMERIC(22) NULL, Scoped_Id NUMERIC(22) NULL, Priority NUMERIC(10) NULL, X_Pos NUMERIC(10) NULL, Y_Pos NUMERIC(10) NULL, PRIMARY KEY(Id));
CREATE TABLE DWE_Predecessors( Task_Id NUMERIC(22) NOT NULL, Pred_Id NUMERIC(22) NOT NULL, PRIMARY KEY (Task_Id, Pred_Id));
CREATE TABLE DWE_WF_Attributes(Workflow_Id NUMERIC(22) NOT NULL, Name VARCHAR(50) NOT NULL, Value BLOB NULL, Type VARCHAR(50) NULL, String_Value VARCHAR(4000) NULL, Is_Shared BIT NULL, Unique KEY(Workflow_Id, Name));
CREATE TABLE DWE_Internal_WF_Attributes(Workflow_Id NUMERIC(22) NOT NULL, Name VARCHAR(50) NOT NULL, Value BLOB NULL, Type VARCHAR (50) NULL, String_Value TEXT NULL, Is_Shared BIT NULL, Unique KEY(Workflow_Id, Name));
CREATE TABLE DWE_Task_Attributes(Task_Id NUMERIC(22) NOT NULL, Name VARCHAR(50) NOT NULL, Value BLOB NULL, Type VARCHAR(50) NULL, String_Value TEXT NULL, Is_Shared BIT NULL, Unique KEY(Task_Id, Name));
CREATE TABLE DWE_Internal_Task_Attributes(Task_Id NUMERIC(22) NOT NULL, Name VARCHAR(50) NOT NULL, Value BLOB NULL, Type VARCHAR (50) NULL, String_Value TEXT NULL, Is_Shared BIT NULL, Unique KEY(Task_Id, Name));
CREATE TABLE DWE_Delay_Timers(Task_Id NUMERIC(22) NOT NULL, End_Time NUMERIC(22) NULL, PRIMARY KEY(Task_Id));
CREATE TABLE DWE_Workflow_Documents(Workflow_Id NUMERIC(22) NOT NULL, Doc_Name VARCHAR(50) NOT NULL, Doc_Type VARCHAR(50) NULL, Document BLOB NULL, Unique KEY(Workflow_Id, Doc_Name));
CREATE TABLE DWE_Corr_Sets(Task_Id NUMERIC(22) NOT NULL, Name VARCHAR(50) NOT NULL, Initiated BIT NOT NULL, PRIMARY KEY(Task_Id, Name));
CREATE TABLE DWE_Corr_Tokens( Task_Id NUMERIC(22) NOT NULL, Set_Name VARCHAR(50) NOT NULL, Prop_Name VARCHAR(50) NOT NULL, Prop_Value VARCHAR(255) NULL, PRIMARY KEY(Task_Id, Set_Name, Prop_Name));
CREATE TABLE DWE_Meta_Data( Id VARCHAR(64) NOT NULL, Val1 VARCHAR(64) NULL, Val2 VARCHAR(256) NULL, PRIMARY KEY(Id));
CREATE TABLE DWE_Subscriptions(Task_Id NUMERIC(22) NOT NULL, Event_Type VARCHAR(255) NULL, PRIMARY KEY(Task_Id));
CREATE TABLE DWE_Resources(Id VARCHAR(50) NOT NULL, UserId VARCHAR(50) NULL, Password VARCHAR(32) NOT NULL, Name_Last VARCHAR(32) NOT NULL, Name_First VARCHAR(32) NULL, Email VARCHAR(50) NULL, Registration_Date NUMERIC(22) NULL, Last_Login_Date NUMERIC(22) NULL, Active NUMERIC(10) NULL, PRIMARY KEY(Id));
CREATE TABLE DWE_Organizations(Prefix VARCHAR(250) NOT NULL, Name VARCHAR(50) NOT NULL, Unique KEY(Prefix, Name));
CREATE TABLE DWE_Org_Resources(Org_Prefix VARCHAR(250) NOT NULL, Org_Name VARCHAR(50) NOT NULL, Resource_Id VARCHAR(50) NOT NULL, Unique KEY(Org_Prefix, Org_Name, Resource_Id));
CREATE TABLE DWE_Roles(Org_Prefix VARCHAR(250) NOT NULL, Org_Name VARCHAR(50) NOT NULL, Name VARCHAR(50) NOT NULL, Unique KEY(Org_Prefix, Org_Name, Name));
CREATE TABLE DWE_Resource_Roles(Resource_Id VARCHAR(50) NOT NULL, Role_Name VARCHAR(50) NOT NULL, Org_Prefix VARCHAR(250)  NOT NULL, Org_Name VARCHAR(50) NOT NULL, Unique KEY(Resource_Id, Role_Name, Org_Prefix, Org_Name));
CREATE TABLE DWE_Resource_Attributes(Resource_Id VARCHAR(50) NOT NULL, Name VARCHAR(50) NOT NULL, Value BLOB NULL, Type VARCHAR (50) NULL, String_Value TEXT NULL, PRIMARY KEY(Resource_Id, Name));
create table classpreferences(applicationName varchar( 512 ), className varchar(32), preferenceName varchar(512), preferenceValue LONGTEXT, user_id BIGINT);

CREATE TABLE instancePreferenceTable( 
	handle_id BIGINT NOT NULL, 
	applicationName VARCHAR( 512 ), 
	preferenceName VARCHAR( 512 ), 
	isPrivate NUMERIC(1),
	user_id BIGINT,
	preferenceValue LONGTEXT
 );

INSERT INTO Class_Def_Table VALUES( 'Object', 0, 'Object', 'Object', 0, 1, 1,     '', 
                                                                        '',
                                                                        '',
                                                                        0,
                                                                        '',1 );
INSERT INTO Class_Def_Table VALUES( 'Collection', 1, 'Collection', 'Collection', 1, 1, 1, '1,2,6,11,12', 
                                                                            '1,20,21,24',
                                                                            '1,24',
                                                                             0,
                                                                            '2,3,4,5,6',1 );
INSERT INTO Class_Def_Table VALUES( 'Document', 2, 'Document', 'Document', 1, 1, 1, '6,8,9,11,12,14,13,22,23,27,31', 
                                                                        '1,2,17,18,20,22,23,24,30',
                                                                        '1,2,17,18,24,30',
                                                                         1,
                                                                        '3,4,5,6',1 );
INSERT INTO Class_Def_Table VALUES( 'User', 3, 'User', 'User', 1, 1, 0,         '6,11,12,20,21', 
                                                                        '5,7,11,12,13,20',
                                                                        '',
                                                                         0,
                                                                        '1,4,5,6',1 );
INSERT INTO Class_Def_Table VALUES( 'Group', 4, 'Group', 'Group', 1, 1, 0,       '5,6,11,12,21', 
                                                                        '5,7,20,25',
                                                                        '',
                                                                         0,
                                                                        '4,5,6',1 );
INSERT INTO Class_Def_Table VALUES( 'Version', 5, 'Version', 'Version', 1, 1, 0,   '6,10,11,12,15,16', 
                                                                        '8,9,14,20',
                                                                        '',
                                                                         1,
                                                                        '3,4,5,6',1 );
INSERT INTO Class_Def_Table VALUES( 'Rendition', 6, 'Rendition', 'Rendition', 1, 1, 0,'6,11,12,31', 
                                                                         '10,15,16,20',
                                                                         '',
                                                                          1,
                                                                         '3,4,5,6',1 );
INSERT INTO Class_Def_Table VALUES( 'Subscription', 7, 'Subscription', 'Subscription', 1, 1, 0,'7,11,12', 
                                                                               '6',
                                                                               '',
                                                                                0,
                                                                               '4,5,6',1 );
INSERT INTO Class_Def_Table VALUES( 'Calendar', 8, 'Calendar', 'Calendar', 1, 1, 1, '4,6,11,12,27', 
                                                                        '1,20,24',
                                                                        '1,24',
                                                                         0,
                                                                        '3,5,6',1 );
INSERT INTO Class_Def_Table VALUES( 'Event', 9, 'Event', 'Event', 1, 1, 1,       '6,11,12', 
                                                                        '4,20',
                                                                        '4',
                                                                         0,
                                                                        '3,5,6',1 );
INSERT INTO Class_Def_Table VALUES( 'SavedQuery',10, 'SavedQuery', 'SavedQuery', 1, 1, 1,    '6,11,12', 
                                                                               '1,20,24',
                                                                               '1,24',
                                                                                0,
                                                                               '3,4,5,6',1 );
INSERT INTO Class_Def_Table VALUES( 'BulletinBoard', 11, 'BulletinBoard', 'BulletinBoard', 1, 1, 1, '3,6,11,12', 
                                                                                  '1,20,24',
                                                                                  '1,24',
                                                                                   0,
                                                                                  '5,6',1 );
INSERT INTO Class_Def_Table VALUES( 'Bulletin', 12, 'Bulletin', 'Bulletin', 1, 1, 1, '6,11,12,3,30', 
                                                                        '3,20',
                                                                        '3',
                                                                         0,
                                                                        '3,5,6',1 );
INSERT INTO Class_Def_Table VALUES( 'URL', 13, 'URL', 'URL', 1, 1, 1,           '6,11,12', 
                                                                        '1,20,24,27',
                                                                        '1,24',
                                                                         0,
                                                                        '3,5,6',1 );
INSERT INTO Class_Def_Table VALUES( 'MailMessage', 14, 'MailMessage', 'MailMessage', 1, 1, 1, '6,11,12,17,18,19,22', 
                                                                            '1,17,19,20,22,24',
                                                                            '1,17,24',
                                                                             1,
                                                                            '5,6',1 );
INSERT INTO Class_Def_Table VALUES( 'Workspace', 15, 'Workspace', 'Workspace', 1, 1, 1, '6,11,12,20,24,25,27', 
                                                                            '20,24',
                                                                            '24',
                                                                             0,
                                                                            '6',1 );
INSERT INTO Class_Def_Table VALUES( 'Weblog', 16, 'Weblog', 'Weblog', 1, 1, 1, '6,11,12,26,29', 
                                                                            '1,20,24,27',
                                                                            '1,24',
                                                                             0,
                                                                            '3,5,6',1 );
INSERT INTO Class_Def_Table VALUES( 'WeblogEntry', 17, 'WeblogEntry', 'WeblogEntry', 1, 1, 1, '6,11,12,27', 
                                                                            '20,26,27,29',
                                                                            '26,29',
                                                                             0,
                                                                            '3,5,6',1 );
INSERT INTO Class_Def_Table VALUES( 'Wiki', 18, 'Wiki', 'Wiki', 1, 1, 1, '6,11,12,27,28', 
                                                                         '1,20,24',
                                                                         '1,24',
                                                                          0,
                                                                         '5,6',1 );
INSERT INTO Class_Def_Table VALUES( 'WikiPage', 19, 'WikiPage', 'WikiPage', 1, 1, 1, '6,11,12,30', 
                                                                                     '20,28',
                                                                                     '28',
                                                                                      0,
                                                                                     '3,5,6',1 );
INSERT INTO Class_Def_Table VALUES( 'Space', 20, 'Space', 'Space', 1, 1, 0, '6,11,12,25', 
                                                                            '',
                                                                            '',
                                                                             0,
                                                                            '4,5,6',1 );
INSERT INTO Class_Def_Table VALUES( 'DocAnnotation', 21, 'DocAnnotation', 'DocAnnotation', 1, 1, 0, '6,11,12', 
                                                                                                    '20,31',
                                                                                                    '',
                                                                                                     0,
                                                                                                    '5,6',1 );

INSERT INTO Propdesc_table VALUES( 'title',              10, 'Object',        1, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0, 1, 256, 'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'webdav_title',       10, 'Object',        1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 356, 'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'description',        11, 'Object',        1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0,   'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'summary',            10, 'Object',        1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 1024,'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'isRoot',              3, 'Object',        1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0,   '', '', 0, 'RADIO_BUTTONS', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'isRecord',            3, 'Object',        1, 0, 0, 0, 1, 0, 1, 1, 0, 0, 1, 1, 0,   '', '', 0, 'RADIO_BUTTONS', 'false', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'readyForDeclare',     3, 'Object',        1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0,   '', '', 0, 'RADIO_BUTTONS', 'false', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'rm_instance_handle', 10, 'Object',        1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1024,'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'keywords',           10, 'Object',        1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 1024,'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'create_date',         4, 'Object',        1, 1, 0, 0, 1, 0, 1, 1, 0, 0, 0, 1, 0,   '', '', 0, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, 'DATE_TIME' );
INSERT INTO Propdesc_table VALUES( 'modified_date',       4, 'Object',        1, 1, 0, 0, 1, 0, 1, 1, 0, 0, 0, 1, 0,   '', '', 0, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, 'DATE_TIME' );
INSERT INTO Propdesc_table VALUES( 'expiration_date',     4, 'Object',        1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, 'DATE_TIME' );
INSERT INTO Propdesc_table VALUES( 'locale',             10, 'Object',        1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 32,  'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'client_data',        10, 'Object',        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1024,'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'routing_template_id', 1, 'Object',        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'copiedFrom',         10, 'Object',        1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 512, 'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'lastSynchronized',    4, 'Object',        1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, 'DATE_TIME' );
INSERT INTO Propdesc_table VALUES( 'space',              10, 'Object',        1, 1, 0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 64,  'TEXT', '', 1, '', ' ','', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'domain',             10, 'User',          1, 0, 0, 1, 1, 0, 1, 0, 0, 0, 1, 1, 128, 'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'username',           10, 'User',          1, 0, 0, 1, 1, 0, 1, 0, 0, 0, 1, 1, 128, 'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'password',           13, 'User',          1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 72,  'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'last_name',          10, 'User',          1, 0, 0, 1, 1, 0, 1, 0, 1, 0, 0, 1, 64,  'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'last_whats_new',      4, 'User',          1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0,   '', '', 0, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, 'DATE_TIME' );
INSERT INTO Propdesc_table VALUES( 'first_name',         10, 'User',          1, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 1, 64,  'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'email',              14, 'User',          1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 128, 'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'email_format',        3, 'User',          1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, 'RADIO_BUTTONS', 'true', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'last_login',          4, 'User',          1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, 'DATE_TIME' );
INSERT INTO Propdesc_table VALUES( 'mailstop',           10, 'User',          0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 128, 'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'phone',              10, 'User',          0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 128, 'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'home_page',          15, 'User',          0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 256, 'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'isActive',            3, 'User',          1, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 1, 0,   '', '', 0, 'RADIO_BUTTONS', 'true', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'remote_DN',          10, 'User',          1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 256, 'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'routing_choice',     20, 'User',          1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, 'SELECT_MENU', 'email','', '', 0, 0, 'none,email', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'routingIDs',         11, 'User',          1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,   'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'pagingIncrement',     1, 'User',          1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, '', '20', '1', '1000', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'javascriptOn',        3, 'User',          1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, 'RADIO_BUTTONS', 'true', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'attachmentAsURL',     3, 'User',          1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, 'RADIO_BUTTONS', 'false', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'isInteractEnabled',   3, 'User',          1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0,   '', '', 0, 'RADIO_BUTTONS', 'false', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'isRMContributorEnabled', 3, 'User',       1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0,   '', '', 0, 'RADIO_BUTTONS', 'false', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'isRMCoordinatorEnabled', 3, 'User',       1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0,   '', '', 0, 'RADIO_BUTTONS', 'false', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'isRMAdminEnabled',       3, 'User',       1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0,   '', '', 0, 'RADIO_BUTTONS', 'false', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'canDeclareIfContributor',3, 'User',       1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0,   '', '', 0, 'RADIO_BUTTONS', 'false', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'changePasswordAtLogin',  3, 'User',       1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0,   '', '', 0, 'RADIO_BUTTONS', 'false', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'failedLoginCount',    1, 'User',          1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0,   '', '', 0, '', '0', '0', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'passwordExpiration',  4, 'User',          1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0,   '', '', 0, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, 'DATE_TIME' );
INSERT INTO Propdesc_table VALUES( 'language',           10, 'User',          1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 32,  'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'characterCode',      10, 'User',          1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 32,  'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'noSubscriptionNotifyFor',20,'User',       1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, 'SELECT_MENU', '', '', '', 0, 0, 'anyChange,add,addNewVersion,remove,changeProps,changeACL,changeOwner,changeLocation,lockCheckout,unlock', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'noEmailAgentNotifyFor',  20,'User',       1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, 'SELECT_MENU', '', '', '', 0, 0, 'uploadSuccess,uploadFailure,forwarded', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'alternateEmail',     10, 'User',          1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 256, 'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'layoutDefaults',     21, 'User',          1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,   'TEXT', '', 1, '', '', '', '', 0, 0, '', 1,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'userLevel',          20, 'User',          1, 0, 0, 1, 1, 0, 1, 1, 0, 0, 1, 1, 0,   '', '', 0, 'SELECT_MENU', 'cpx', '', '', 0, 0, 'anonymous,minimum,dsLimited,imageManager,dsFull,cpx', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'homeSpace',          10, 'User',          1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 64,  'TEXT', '', 1, '', ' ', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'useRichTextEdit',     3, 'User',          1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, 'RADIO_BUTTONS', 'true', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'docCountQuota',       1, 'User',          1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0,   '', '', 0, '', '-2', '-2', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'contentSizeMBQuota',  1, 'User',          1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0,   '', '', 0, '', '-2', '-2', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'domain',             10, 'Group',         1, 0, 0, 1, 1, 0, 1, 0, 0, 0, 1, 1, 128, 'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'remote_DN',          10, 'Group',         1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 256, 'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'emailAlias',         10, 'Group',         1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 128, 'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'replyToGroup',        3, 'Group',         1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, 'RADIO_BUTTONS', 'false', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'confirmEmailReceipt', 3, 'Group',         1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, 'RADIO_BUTTONS', 'false', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'external_recipients',10, 'Group',         1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 2000,'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'spamControl',        20, 'Group',         1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, 'SELECT_MENU', 'anyone', '', '', 0, 0, 'anyone,onlyDSUser,onlyGroupMember', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'docCountQuota',       1, 'Group',         1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0,   '', '', 0, '', '-2', '-2', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'contentSizeMBQuota',  1, 'Group',         1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0,   '', '', 0, '', '-2', '-2', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'logo',               10, 'Collection',    1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 256, 'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'bg_image',           10, 'Collection',    1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 256, 'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'sort_order',         20, 'Collection',    1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, 'SELECT_MENU', 'TypeAndTitle', '', '', 0, 0, 'TypeAndTitle,TypeAndDate,Date,Title,TitleReversed,DateAscending', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'view_format',        20, 'Collection',    1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, 'SELECT_MENU', 'DetailedListing', '', '', 0, 0, 'DetailedListing,Images,Email', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'add_as_draft',        3, 'Collection',    1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0,   '', '', 0, 'RADIO_BUTTONS', 'false', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'emailAlias',         10, 'Collection',    1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 128, 'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'spamControl',        20, 'Collection',    1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, 'SELECT_MENU', 'anyone', '', '', 0, 0, 'anyone,onlyDSUser', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'logo',               10, 'BulletinBoard', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 256, 'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'bg_image',           10, 'BulletinBoard', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 256, 'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'expire',             20, 'BulletinBoard', 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, 'SELECT_MENU', '10', '', '', 0, 0, '0,1,2,3,4,5,6,7,8,9,10', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'showHierarchy',       3, 'BulletinBoard', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, 'RADIO_BUTTONS', 'true', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'url',                15, 'URL',           1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 500, 'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'displayInNewWindow',  3, 'URL',           1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, 'RADIO_BUTTONS', 'false', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'author',             10, 'Document',      0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 128, 'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'content_type',       10, 'Document',      1, 0, 0, 0, 1, 0, 1, 1, 0, 0, 0, 1, 512, 'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'size',               23, 'Document',      1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0,   '', '', 0, '', '0', '0', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'max_versions',        1, 'Document',      1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0,   '', '', 0, '', '4', '1', '10000', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'highest_version_used',1, 'Document',      1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0,   '', '', 0, '', '0', '0', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'abstract',           11, 'Document',      1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,   'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'original_file_name', 10, 'Document',      1, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 256, 'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'add_as_draft',        3, 'Document',      1, 0, 0, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0,   '', '', 0, 'RADIO_BUTTONS', 'false', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'canAddVersions',      3, 'Document',      1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0,   '', '', 0, 'RADIO_BUTTONS', 'true', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'isInteract',          3, 'Document',      1, 0, 0, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0,   '', '', 0, 'RADIO_BUTTONS', 'false', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'autoMovePreferredVersion', 3,'Document',  1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0,   '', '', 0, 'RADIO_BUTTONS', 'true', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'isPlaceholder',       3, 'Document',      1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, 'RADIO_BUTTONS', 'false', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'cfSpecialWords',     10, 'Document',      1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 2000,'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0,'', 0, '' );
INSERT INTO Propdesc_table VALUES( 'cfCopyID',           10, 'Document',      1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 256, 'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0,'', 0, '' );
INSERT INTO Propdesc_table VALUES( 'version_number',      1, 'Version',       1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0,   '', '', 0, '', '0', '0', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'revision_comments',  10, 'Version',       1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 1024,'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'abstract',           11, 'Version',       1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,   'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'rendition_type',     10, 'Rendition',     1, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0, 1, 512, 'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'rendition_detail',   10, 'Rendition',     1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1024,'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'size',               23, 'Rendition',     1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0,   '', '', 0, '', '0', '0', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'generated',           3, 'Rendition',     1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, 'RADIO_BUTTONS', 'false', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'external_recipients',10, 'Subscription',  1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2000,'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'events',             20, 'Subscription',  1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, 'SELECT_MENU', 'anyChange', '', '', 0, 0, 'anyChange,add,addNewVersion,remove,changeProps,changeACL,changeOwner,changeLocation,lockCheckout,unlock', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'period',             20, 'Subscription',  1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, 'SELECT_MENU', 'Immediate', '', '', 0, 0, 'Immediate,Daily,Weekly', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'recipient_activity',  3, 'Subscription',  1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, 'RADIO_BUTTONS', 'true', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'notification_action',20, 'Subscription',  1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0,   '', '', 0, 'SELECT_MENU', 'email', '', '', 0, 0, 'email,script,workflow', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'script',             10, 'Subscription',  1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 256, 'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'script_data',        10, 'Subscription',  1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 256, 'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'sender',              3, 'Subscription',  1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, 'RADIO_BUTTONS', 'false', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'subscription_scope', 20, 'Subscription',  1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, 'SELECT_MENU', 'oneLevel', '', '', 0, 0, 'allLevels,oneLevel', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'workflow_name',      10, 'Subscription',  1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 256, 'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'workflow_data',      11, 'Subscription',  1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,   'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'rulesEnabled',        3, 'Subscription',  1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0,   '', '', 0, 'RADIO_BUTTONS', 'true', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'rulesStarts',         4, 'Subscription',  1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, 'DATE_TIME' );
INSERT INTO Propdesc_table VALUES( 'query_string',       11, 'SavedQuery',    1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0,   'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'year',                1, 'Event',         1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'month',               1, 'Event',         1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'day',                 1, 'Event',         1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'has_time',            3, 'Event',         1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, 'RADIO_BUTTONS', 'true', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'start_time',          1, 'Event',         1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, '', '420', '0', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'end_time',            1, 'Event',         1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, '', '480', '0', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'num_repeat',          1, 'Event',         1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0,   '', '', 0, '', '1', '1', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'repeat',             20, 'Event',         1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, 'SELECT_MENU', 'None', '', '', 0, 0, 'None,Daily,Weekly,Every_2_Weeks,Monthly_By_Date,Yearly', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'exclusions',         10, 'Event',         1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 64,  'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'default_scale',       3, 'Calendar',      1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0,   '', '', 0, 'RADIO_BUTTONS', 'true', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'from',               10, 'MailMessage',   1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 256, 'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'subject',            10, 'MailMessage',   1, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 256, 'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'body',               11, 'MailMessage',   1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0,   'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'postedDate',          4, 'MailMessage',   1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, 'DATE_TIME' );
INSERT INTO Propdesc_table VALUES( 'received',            4, 'MailMessage',   1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, 'DATE_TIME' );
INSERT INTO Propdesc_table VALUES( 'messageID',          10, 'MailMessage',   1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 256, 'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'contentType',        10, 'MailMessage',   1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 256, 'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'size',                1, 'MailMessage',   1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, '', '0', '0', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'to',                 10, 'MailMessage',   1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 256, 'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'cc',                 10, 'MailMessage',   1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 256, 'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'references',         10, 'MailMessage',   1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 256, 'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'headers',            10, 'MailMessage',   1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 512, 'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'inReplyTo',          10, 'MailMessage',   1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 256, 'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'replyTo',            10, 'MailMessage',   1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 256, 'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'originally_signed',   3, 'MailMessage',   1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, 'RADIO_BUTTONS', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'originally_encrypted',3, 'MailMessage',   1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, 'RADIO_BUTTONS', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'layout',             21, 'Workspace',     1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,   'TEXT', '', 1, '', '', '', '', 0, 0, '', 1,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'emailAlias',         10, 'Workspace',     1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 128, 'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'iconFilename',       10, 'Workspace',     1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 256, 'TEXT', '', 1, '', 'workspace.png', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'xmlFields',          21, 'Weblog',        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,   'TEXT', '', 1, '', '', '', '', 0, 0, '', 1,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'xmlTemplates',       21, 'Weblog',        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,   'TEXT', '', 1, '', '', '', '', 0, 0, '', 1,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'emailAlias',         10, 'Weblog',        1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 128, 'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'isModerated',         3, 'Weblog',        1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0,   '', '', 0, 'RADIO_BUTTONS', 'false', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'xmlFields',          21, 'WeblogEntry',   1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,   'TEXT', '', 1, '', '', '', '', 0, 0, '', 1,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'approval_state',     20, 'WeblogEntry',   1, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0,   '', '', 0, 'SELECT_MENU', 'approved', '', '', 0, 0, 'toBeApproved,rejected,resubmitted,approved', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'xmlFields',          21, 'Wiki',          1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,   'TEXT', '', 1, '', '', '', '', 0, 0, '', 1,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'xmlTemplates',       21, 'Wiki',          1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,   'TEXT', '', 1, '', '', '', '', 0, 0, '', 1,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'xmlFields',          21, 'WikiPage',      1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,   'TEXT', '', 1, '', '', '', '', 0, 0, '', 1,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'spaceName',          10, 'Space',         1, 1, 0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 2000,'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'spaceSettings',      21, 'Space',         1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,   'TEXT', '', 1, '', '', '', '', 0, 0, '', 1,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'classNames',         10, 'Space',         1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 64,  'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'annotationBody',     21, 'DocAnnotation', 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0,   'TEXT', '', 1, '', '', '', '', 0, 0, '', 1,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'signed_by',          10, 'MailMessage',   0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 256, 'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'attachmentsOnly',     3, 'Collection',    0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, 'RADIO_BUTTONS', 'false', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'attachmentsOnly',     3, 'Workspace',     0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, 'RADIO_BUTTONS', 'false', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );

INSERT INTO Linkdesc_table VALUES( 'containment',        1, 1, 0, 0, 1, 1, '',         1, 0, 0, 1, 1, 0,16, 4, 32,0, '2,3,4,5,6', 0 );
INSERT INTO Linkdesc_table VALUES( 'draftContainment',   2, 1, 0, 0, 0, 1, '',         1, 0, 0, 0, 1, 0,16, 4, 32,0, '5,6', 0 );
INSERT INTO Linkdesc_table VALUES( 'bulletin',           3, 1, 0, 0, 1, 1, '',         1, 0, 0, 1, 1, 0,16, 4, 32,0, '5,6', 0 );
INSERT INTO Linkdesc_table VALUES( 'event',              4, 1, 0, 0, 1, 1, '',         1, 0, 0, 1, 1, 0,16, 4, 32,0, '3,5,6', 0 );
INSERT INTO Linkdesc_table VALUES( 'membership',         5, 1, 0, 0, 1, 1, '',         0, 0, 0, 0, 1, 1, 2, 4, 4, 0, '4,5,6', 0 );
INSERT INTO Linkdesc_table VALUES( 'subscription',       6, 1, 0, 0, 0, 1, '',         1, 1, 0, 1, 0, 0, 4, 4, 4, 0, '4,5,6', 0 );
INSERT INTO Linkdesc_table VALUES( 'subscriber',         7, 1, 0, 0, 1, 1, '',         0, 0,108,0, 0, 1, 4, 4, 4, 0, '4,5,6', 0 );
INSERT INTO Linkdesc_table VALUES( 'version',            8, 1, 1, 0, 0, 1, '',         1, 49,0, 1, 1, 1,16, 4, 32,1, '3,4,5,6', 1 );
INSERT INTO Linkdesc_table VALUES( 'draftVersion',       9, 1, 0, 0, 0, 1, '',         1, 49,0, 0, 1, 0,16, 4, 32,0, '5,6', 1 );
INSERT INTO Linkdesc_table VALUES( 'rendition',         10, 1, 0, 0, 0, 1, '',         1, 49,0, 1, 1, 0,16, 4, 32,1, '3,4,5,6', 1 );
INSERT INTO Linkdesc_table VALUES( 'owner',             11, 1, 0, 1, 1, 0, 'username', 0, 0,127,0, 1, 1, 1, 4, 4, 0, '4,5,6', 0 );
INSERT INTO Linkdesc_table VALUES( 'modifiedBy',        12, 1, 1, 0, 1, 0, 'username', 0, 0, 0, 0, 1, 0, 2, 4, 4, 0, '2,3,4,5,6', 0 );
INSERT INTO Linkdesc_table VALUES( 'lockedBy',          13, 1, 1, 0, 1, 0, 'username', 0, 0, 0, 0, 0, 0, 2, 4, 4, 0, '3,5,6', 0 );
INSERT INTO Linkdesc_table VALUES( 'preferredVersion',  14, 1, 0, 1, 0, 0, '',         0, 48,0, 0, 1, 1, 2, 4, 32,0, '5,6', 1 );
INSERT INTO Linkdesc_table VALUES( 'preferredRendition',15, 1, 0, 1, 0, 0, '',         0, 48,0, 0, 1, 1, 2, 4, 32,0, '5,6', 1 );
INSERT INTO Linkdesc_table VALUES( 'originalRendition', 16, 1, 0, 1, 0, 0, '',         0, 48,0, 0, 1, 1, 2, 4, 32,0, '5,6', 1 );
INSERT INTO Linkdesc_table VALUES( 'attachment',        17, 1, 1, 0, 0, 1, '',         1, 1, 0, 1, 1, 1, 2, 4, 32,1, '5,6', 1 );
INSERT INTO Linkdesc_table VALUES( 'nativeMessage',     18, 1, 1, 0, 0, 0, '',         1, 1, 0, 1, 1, 1,16, 4, 32,1, '5,6', 1 );
INSERT INTO Linkdesc_table VALUES( 'messageThread',     19, 1, 0, 0, 0, 1, '',         0, 0, 0, 0, 1, 0,16, 4, 4, 0, '5,6', 1 );
INSERT INTO Linkdesc_table VALUES( 'favorite',          20, 1, 0, 0, 1, 1, '',         0, 0, 0, 0, 0, 0, 4, 4, 4, 0, '2,3,4,5,6',  0 );
INSERT INTO Linkdesc_table VALUES( 'associatedCollection',21,1,0, 0, 1, 1, '',         0, 0, 0, 0, 0, 0, 4, 4, 4, 0, '2,3,4,5,6', 0 );
INSERT INTO Linkdesc_table VALUES( 'recordSuccessor',   22, 1, 1, 0, 0, 0, '',         0, 0, 0, 0, 0, 0, 4, 2, 4, 0, '5,6', 0 );
INSERT INTO Linkdesc_table VALUES( 'jobTicket',         23, 1, 1, 0, 0, 1, '',         1,127,0, 1, 0, 0, 2, 4, 4, 0, '5,6', 1 );
INSERT INTO Linkdesc_table VALUES( 'workspace',         24, 1, 0, 0, 1, 1, '',         1, 0, 0, 1, 1, 0,16, 4, 32,0, '6', 0 );
INSERT INTO Linkdesc_table VALUES( 'membershipGroup',   25, 1, 0, 0, 1, 0, '',         0, 0,126,0, 1, 1, 1, 4, 4, 0, '4,5,6', 0 );
INSERT INTO Linkdesc_table VALUES( 'weblog',            26, 1, 1, 0, 0, 1, '',         1, 1, 0, 1, 1, 1,16, 4, 32,0, '3,5,6', 1 );
INSERT INTO Linkdesc_table VALUES( 'annotation',        27, 1, 0, 0, 1, 1, '',         1, 1, 0, 1, 1, 1, 4, 4, 4, 0, '3,5,6', 1 );
INSERT INTO Linkdesc_table VALUES( 'wikiPage',          28, 1, 1, 0, 0, 1, '',         1, 1, 0, 1, 1, 1,16, 4, 32,0, '5,6', 1 );
INSERT INTO Linkdesc_table VALUES( 'draftWeblog',       29, 1, 1, 0, 0, 1, '',         1, 1, 0, 0, 1, 0,16, 4, 32,0, '3,5,6', 1 );
INSERT INTO Linkdesc_table VALUES( 'attach',            30, 1, 0, 0, 1, 1, '',         1, 1, 0, 0, 1, 1, 2, 4, 4, 0, '3,5,6', 1 );
INSERT INTO Linkdesc_table VALUES( 'docAnnotation',     31, 1, 1, 0, 0, 1, '',         1, 1, 0, 1, 1, 0, 2, 2, 4, 0, '5,6', 1 );

INSERT INTO PropColumnMap ( className, propDescName, columnName ) VALUES( 'Object', 'title', 'Object_title' );
INSERT INTO PropColumnMap ( className, propDescName, columnName ) VALUES( 'Object', 'webdav_title', 'Object_webdav_title' );
INSERT INTO PropColumnMap ( className, propDescName, columnName ) VALUES( 'Object', 'description', 'Object_description' );
INSERT INTO PropColumnMap ( className, propDescName, columnName ) VALUES( 'Object', 'summary',     'Object_summary' );
INSERT INTO PropColumnMap ( className, propDescName, columnName ) VALUES( 'Object', 'isRoot',     'Object_isRootElement' );
INSERT INTO PropColumnMap ( className, propDescName, columnName ) VALUES( 'Object', 'isRecord',   'Object_isRecord' );
INSERT INTO PropColumnMap ( className, propDescName, columnName ) VALUES( 'Object', 'create_date', 'Object_create_date' );
INSERT INTO PropColumnMap ( className, propDescName, columnName ) VALUES( 'Object', 'modified_date', 'Object_modified_date' );
INSERT INTO PropColumnMap ( className, propDescName, columnName ) VALUES( 'Object', 'keywords', 'Object_keywords' );
INSERT INTO PropColumnMap ( className, propDescName, columnName ) VALUES( 'Object', 'space', 'Object_space' );
INSERT INTO PropColumnMap ( className, propDescName, columnName ) VALUES( 'Object', 'locale', 'Object_Locale' );
INSERT INTO PropColumnMap ( className, propDescName, columnName ) VALUES( 'Object', 'readyForDeclare', 'Object_readyForDeclare' );
INSERT INTO PropColumnMap ( className, propDescName, columnName ) VALUES( 'User', 'domain', 'domain_name' );
INSERT INTO PropColumnMap ( className, propDescName, columnName ) VALUES( 'User', 'username',  'User_username' );
INSERT INTO PropColumnMap ( className, propDescName, columnName ) VALUES( 'User', 'last_name', 'User_last_name' );
INSERT INTO PropColumnMap ( className, propDescName, columnName ) VALUES( 'User', 'first_name',  'User_first_name' );
INSERT INTO PropColumnMap ( className, propDescName, columnName ) VALUES( 'User', 'isActive', 'User_isActive' );
INSERT INTO PropColumnMap ( className, propDescName, columnName ) VALUES( 'User', 'userLevel', 'User_userLevel' );
INSERT INTO PropColumnMap ( className, propDescName, columnName ) VALUES( 'User', 'homeSpace', 'Space_spaceName' );
INSERT INTO PropColumnMap ( className, propDescName, columnName ) VALUES( 'User', 'changePasswordAtLogin', 'User_changePasswordAtLogin' );
INSERT INTO PropColumnMap ( className, propDescName, columnName ) VALUES( 'User', 'failedLoginCount', 'User_failedLoginCount' );
INSERT INTO PropColumnMap ( className, propDescName, columnName ) VALUES( 'User', 'passwordExpiration', 'User_passwordExpiration' );
INSERT INTO PropColumnMap ( className, propDescName, columnName ) VALUES( 'User', 'remote_DN', 'Remote_DN' );
INSERT INTO PropColumnMap ( className, propDescName, columnName ) VALUES( 'Group', 'domain', 'domain_name' );
INSERT INTO PropColumnMap ( className, propDescName, columnName ) VALUES( 'Group', 'remote_DN', 'Remote_DN' );
INSERT INTO PropColumnMap ( className, propDescName, columnName ) VALUES( 'Document', 'author', 'Document_author' );
INSERT INTO PropColumnMap ( className, propDescName, columnName ) VALUES( 'Document', 'content_type', 'Rendition_rendition_type' );
INSERT INTO PropColumnMap ( className, propDescName, columnName ) VALUES( 'Document', 'highest_version_used', 'Document_highest_version_used' );
INSERT INTO PropColumnMap ( className, propDescName, columnName ) VALUES( 'Document', 'original_file_name', 'Document_original_file_name' );
INSERT INTO PropColumnMap ( className, propDescName, columnName ) VALUES( 'Document', 'isPlaceholder', 'User_isActive' );
INSERT INTO PropColumnMap ( className, propDescName, columnName ) VALUES( 'Document', 'max_versions', 'Document_max_versions' );
INSERT INTO PropColumnMap ( className, propDescName, columnName ) VALUES( 'Document', 'size', 'content_size' );
INSERT INTO PropColumnMap ( className, propDescName, columnName ) VALUES( 'Document', 'add_as_draft', 'Document_add_as_draft' );
INSERT INTO PropColumnMap ( className, propDescName, columnName ) VALUES( 'Document', 'canAddVersions', 'Document_canAddVersions' );
INSERT INTO PropColumnMap ( className, propDescName, columnName ) VALUES( 'Document', 'isInteract', 'Document_isInteract' );
INSERT INTO PropColumnMap ( className, propDescName, columnName ) VALUES( 'Document', 'autoMovePreferredVersion', 'Docum_autoMovePreferredVersion' );
INSERT INTO PropColumnMap ( className, propDescName, columnName ) VALUES( 'Version', 'version_number', 'Version_version_number' );
INSERT INTO PropColumnMap ( className, propDescName, columnName ) VALUES( 'Version', 'revision_comments', 'Version_revision_comments' );
INSERT INTO PropColumnMap ( className, propDescName, columnName ) VALUES( 'Rendition', 'rendition_type', 'Rendition_rendition_type' );
INSERT INTO PropColumnMap ( className, propDescName, columnName ) VALUES( 'Rendition', 'size', 'content_size' );
INSERT INTO PropColumnMap ( className, propDescName, columnName ) VALUES( 'Rendition', 'generated', 'Rendition_generated' );
INSERT INTO PropColumnMap ( className, propDescName, columnName ) VALUES( 'Collection', 'add_as_draft', 'Document_add_as_draft' );
INSERT INTO PropColumnMap ( className, propDescName, columnName ) VALUES( 'Space', 'spaceName', 'Space_spaceName' );

INSERT INTO simpleDocClassMappings ( docClassName, simpleVersionClassName, simpleRenditionClassName ) VALUES ( 'Document', 'v_Document', 'r_Document' );

INSERT INTO NextID_table VALUES( 'Collection', 13 );
INSERT INTO NextID_table VALUES( 'Document', 10 );
INSERT INTO NextID_table VALUES( 'User', 10 );
INSERT INTO NextID_table VALUES( 'Group', 10 );
INSERT INTO NextID_table VALUES( 'Version', 10 );
INSERT INTO NextID_table VALUES( 'Rendition', 10 );
INSERT INTO NextID_table VALUES( 'Subscription', 10 );
INSERT INTO NextID_table VALUES( 'Calendar', 10 );
INSERT INTO NextID_table VALUES( 'Event', 10 );
INSERT INTO NextID_table VALUES( 'SavedQuery', 10 );
INSERT INTO NextID_table VALUES( 'BulletinBoard', 10 );
INSERT INTO NextID_table VALUES( 'Bulletin', 10 );
INSERT INTO NextID_table VALUES( 'URL', 10 );
INSERT INTO NextID_table VALUES( 'MailMessage', 10 );
INSERT INTO NextID_table VALUES( 'Workspace', 10 );
INSERT INTO NextID_table VALUES( 'Weblog', 10 );
INSERT INTO NextID_table VALUES( 'WeblogEntry', 10 );
INSERT INTO NextID_table VALUES( 'Wiki', 10 );
INSERT INTO NextID_table VALUES( 'WikiPage', 10 );
INSERT INTO NextID_table VALUES( 'Space', 10 );
INSERT INTO NextID_table VALUES( 'DocAnnotation', 10 );
INSERT INTO NextID_table VALUES( 'db version', 8036 );
INSERT INTO NextID_table VALUES( 'site index', 0 );
INSERT INTO NextID_table VALUES( 'propdesc ID', 0 );
INSERT INTO NextID_table VALUES( 'Job ID', 0 );

INSERT INTO DSObject_table( handle_class, handle_index, handle_id, Object_create_date,        Object_modified_date,    Object_title, User_username, Object_isSystemObj, Object_isDeleted, Object_isRecord, domain_name, User_last_name, User_first_name, User_isActive, User_changePasswordAtLogin, User_failedLoginCount, User_userLevel, Object_space, Object_Locale )
                    VALUES(            3,            1,     10003, '2011-05-19 08:10:00.00', '2011-05-19 08:10:00.00', 'Guest',      'Guest',       1,                  0,                0,               'DocuShare', 'Guest',        '',              1,             0,                          0,                     'anonymous',    ' ',          'en' );
INSERT INTO DSObject_table( handle_class, handle_index, handle_id, Object_create_date,        Object_modified_date,    Object_title, User_username, Object_isSystemObj, Object_isDeleted, Object_isRecord, domain_name, User_last_name,       User_first_name, User_isActive, User_changePasswordAtLogin, User_failedLoginCount, User_userLevel, Object_space, Object_Locale )
                    VALUES(            3,            2,     20003, '2011-05-19 08:10:00.00', '2011-05-19 08:10:00.00', 'admin',      'admin',       1,                  0,                0,               'DocuShare', 'Site Administrator', '',              1,             0,                          0,                     'cpx',          ' ',          'en' );
INSERT INTO DSObject_table( handle_class, handle_index, handle_id, Object_create_date,        Object_modified_date,    Object_title,          Object_isSystemObj, Object_isDeleted, Object_isRecord, domain_name, Object_space, Object_Locale )
                    VALUES(            4,            1,     10004, '2011-05-19 08:10:00.00', '2011-05-19 08:10:00.00', 'Site Administrators', 1,                  0,                0,               'DocuShare',   ' ',        'en' );
INSERT INTO DSObject_table( handle_class, handle_index, handle_id, Object_create_date,        Object_modified_date,    Object_title,             Object_isSystemObj, Object_isDeleted, Object_isRecord, domain_name, Object_space, Object_Locale )
                    VALUES(            4,            2,     20004, '2011-05-19 08:10:00.00', '2011-05-19 08:10:00.00', 'Content Administrators', 1,                  0,                0,               'DocuShare',   ' ',        'en' );
INSERT INTO DSObject_table( handle_class, handle_index, handle_id, Object_create_date,        Object_modified_date,    Object_title,             Object_isSystemObj, Object_isDeleted, Object_isRecord, domain_name, Object_space, Object_Locale )
                    VALUES(            4,            3,     30004, '2011-05-19 08:10:00.00', '2011-05-19 08:10:00.00', 'Account Administrators', 1,                  0,                0,               'DocuShare',   ' ',        'en' );
INSERT INTO DSObject_table( handle_class, handle_index, handle_id, Object_create_date,        Object_modified_date,    Object_title,          Object_isSystemObj, Object_isDeleted, Object_isRecord, domain_name, Object_space, Object_Locale )
                    VALUES(            4,            4,     40004, '2011-05-19 08:10:00.00', '2011-05-19 08:10:00.00', 'All Users and Guest', 1,                  0,                0,               'DocuShare',   ' ',        'en' );
INSERT INTO DSObject_table( handle_class, handle_index, handle_id, Object_create_date,        Object_modified_date,    Object_title,             Object_isSystemObj, Object_isDeleted, Object_isRecord, domain_name, Object_space, Object_Locale )
                    VALUES(            4,            5,     50004, '2011-05-19 08:10:00.00', '2011-05-19 08:10:00.00', 'All Users Except Guest', 1,                  0,                0,               'DocuShare',   ' ',        'en' );
INSERT INTO DSObject_table( handle_class, handle_index, handle_id, Object_create_date,        Object_modified_date,    Object_title,             Object_isSystemObj, Object_isDeleted, Object_isRecord, domain_name, Object_space, Object_Locale )
                    VALUES(            4,            6,     60004, '2011-05-19 08:10:00.00', '2011-05-19 08:10:00.00', 'Read-Only Users',        1,                  0,                0,               'DocuShare',   ' ',        'en' );
INSERT INTO DSObject_table( handle_class, handle_index, handle_id, Object_create_date,        Object_modified_date,    Object_title,                Object_isSystemObj, Object_isDeleted, Object_isRecord, domain_name, Object_space, Object_Locale )
                    VALUES(            4,            7,     70004, '2011-05-19 08:10:00.00', '2011-05-19 08:10:00.00', 'All Users Except Read-Only',1,               0,                0,               'DocuShare',   ' ',          'en' );

INSERT INTO DSObject_table( handle_class, handle_index, handle_id, Object_create_date,     Object_modified_date,    Object_title,                    Object_isSystemObj, Object_isDeleted, Object_isRecord, Object_isRootElement, Object_webdav_title,             Object_space, Object_Locale, Document_add_as_draft )
                    VALUES(            1,           10, 100001, '2011-05-19 08:10:00.00', '2011-05-19 08:10:00.00', 'Initial Top Level Collection A',0,                  0,                0,               1,                    'Initial Top Level Collection A',' ',          'en',          0 );
INSERT INTO DSObject_table( handle_class, handle_index, handle_id, Object_create_date,     Object_modified_date,    Object_title,                    Object_isSystemObj, Object_isDeleted, Object_isRecord, Object_isRootElement, Object_webdav_title,             Object_space, Object_Locale, Document_add_as_draft )
                    VALUES(            1,           11, 110001, '2011-05-19 08:10:00.00', '2011-05-19 08:10:00.00', 'Initial Top Level Collection B',0,                  0,                0,               1,                    'Initial Top Level Collection B',' ',          'en',          0 );
INSERT INTO DSObject_table( handle_class, handle_index, handle_id, Object_create_date,     Object_modified_date,    Object_title,                    Object_isSystemObj, Object_isDeleted, Object_isRecord, Object_isRootElement, Object_webdav_title,             Object_space, Object_Locale, Document_add_as_draft )
                    VALUES(            1,           12, 120001, '2011-05-19 08:10:00.00', '2011-05-19 08:10:00.00', 'Initial Top Level Collection C',0,                  0,                0,               1,                    'Initial Top Level Collection C',' ',          'en',          0 );
INSERT INTO DSObject_table( handle_class, handle_index, handle_id, Object_create_date,     Object_modified_date,    Object_title,                    Object_isSystemObj, Object_isDeleted, Object_isRecord, Object_isRootElement, Object_webdav_title,             Object_space, Object_Locale, Document_add_as_draft )
                    VALUES(            1,           13, 130001, '2011-05-19 08:10:00.00', '2011-05-19 08:10:00.00', 'Initial Top Level Collection D',0,                  0,                0,               1,                    'Initial Top Level Collection D',' ',          'en',          0 );

INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName, type, propdesc_ID, ordering, intBoolVal ) 
    VALUES( 3, 1, 10003, 0, 'docCountQuota', 1, 0, 0, -2 );
INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName, type, propdesc_ID, ordering, intBoolVal ) 
    VALUES( 3, 2, 20003, 0, 'docCountQuota', 1, 0, 0, -1 );
INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName, type, propdesc_ID, ordering, intBoolVal ) 
    VALUES( 4, 1, 10004, 0, 'docCountQuota', 1, 0, 0, -2 );
INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName, type, propdesc_ID, ordering, intBoolVal ) 
    VALUES( 4, 2, 20004, 0, 'docCountQuota', 1, 0, 0, -1 );
INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName, type, propdesc_ID, ordering, intBoolVal ) 
    VALUES( 4, 3, 30004, 0, 'docCountQuota', 1, 0, 0, -2 );
INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName, type, propdesc_ID, ordering, intBoolVal ) 
    VALUES( 4, 4, 40004, 0, 'docCountQuota', 1, 0, 0, -2 );
INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName, type, propdesc_ID, ordering, intBoolVal ) 
    VALUES( 4, 5, 50004, 0, 'docCountQuota', 1, 0, 0, -2 );
INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName, type, propdesc_ID, ordering, intBoolVal ) 
    VALUES( 4, 6, 60004, 0, 'docCountQuota', 1, 0, 0, -2 );
INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName, type, propdesc_ID, ordering, intBoolVal ) 
    VALUES( 4, 7, 70004, 0, 'docCountQuota', 1, 0, 0, -2 );

INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName, type, propdesc_ID, ordering, intBoolVal ) 
    VALUES( 3, 1, 10003, 0, 'contentSizeMBQuota', 1, 0, 0, -2 );
INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName, type, propdesc_ID, ordering, intBoolVal ) 
    VALUES( 3, 2, 20003, 0, 'contentSizeMBQuota', 1, 0, 0, -1 );
INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName, type, propdesc_ID, ordering, intBoolVal ) 
    VALUES( 4, 1, 10004, 0, 'contentSizeMBQuota', 1, 0, 0, -2 );
INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName, type, propdesc_ID, ordering, intBoolVal ) 
    VALUES( 4, 2, 20004, 0, 'contentSizeMBQuota', 1, 0, 0, -1 );
INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName, type, propdesc_ID, ordering, intBoolVal ) 
    VALUES( 4, 3, 30004, 0, 'contentSizeMBQuota', 1, 0, 0, -2 );
INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName, type, propdesc_ID, ordering, intBoolVal ) 
    VALUES( 4, 4, 40004, 0, 'contentSizeMBQuota', 1, 0, 0, -2 );
INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName, type, propdesc_ID, ordering, intBoolVal ) 
    VALUES( 4, 5, 50004, 0, 'contentSizeMBQuota', 1, 0, 0, -2 );
INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName, type, propdesc_ID, ordering, intBoolVal ) 
    VALUES( 4, 6, 60004, 0, 'contentSizeMBQuota', 1, 0, 0, -2 );
INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName, type, propdesc_ID, ordering, intBoolVal ) 
    VALUES( 4, 7, 70004, 0, 'contentSizeMBQuota', 1, 0, 0, -2 );

INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName,   type, propdesc_ID, ordering, stringVal ) 
                  VALUES( 3,            1,            10003,     0,         'password', 13,   0,           0,        '   ' );
INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName,       type, propdesc_ID, ordering, intBoolVal ) 
                  VALUES( 3,            1,            10003,     0,         'email_format', 3,    0,           0,        1 );
INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName,          type, propdesc_ID, ordering, intBoolVal ) 
                  VALUES( 3,            1,            10003,     0,         'pagingIncrement', 1,    0,           0,        20 );
INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName,       type, propdesc_ID, ordering, intBoolVal ) 
                  VALUES( 3,            1,            10003,     0,         'javascriptOn', 3,    0,           0,        1 );
INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName,                 type, propdesc_ID, ordering, intBoolVal ) 
                  VALUES( 3,            1,            10003,     0,         'isRMContributorEnabled', 3,    0,           0,        0 );
INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName,                 type, propdesc_ID, ordering, intBoolVal ) 
                  VALUES( 3,            1,            10003,     0,         'isRMCoordinatorEnabled', 3,    0,           0,        0 );
INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName,           type, propdesc_ID, ordering, intBoolVal ) 
                  VALUES( 3,            1,            10003,     0,         'isRMAdminEnabled', 3,    0,           0,        0 );
INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName,                  type, propdesc_ID, ordering, intBoolVal ) 
                  VALUES( 3,            1,            10003,     0,         'canDeclareIfContributor', 3,    0,           0,        0 );
INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName,                type, propdesc_ID, ordering, intBoolVal ) 
                  VALUES( 3,            1,            10003,     0,         'changePasswordAtLogin', 3,    0,           0,        0 );
INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName,           type, propdesc_ID, ordering, intBoolVal ) 
                  VALUES( 3,            1,            10003,     0,         'failedLoginCount', 1,    0,           0,        0 );
INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName,         type, propdesc_ID, ordering, stringVal ) 
                  VALUES( 3,            1,            10003,     0,         'routing_choice', 20,   0,           0,        'none' );
INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName,      type, propdesc_ID, ordering, intBoolVal ) 
                  VALUES( 3,            1,            10003,     0,         'useRichTextEdit', 3,    0,           0,        1 );

INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName,   type, propdesc_ID, ordering, stringVal ) 
                  VALUES( 3,            2,            20003,     0,         'password', 13,   0,           0,        '5FA0836F50D7B9775812D831113AE66832A935606E47AD90C928F0A3B5C7F21AF3BF9FB8' );
INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName, type, propdesc_ID, ordering, stringVal ) 
                  VALUES( 3,            2,            20003,     0,         'email',  10,   0,           0,        'please_set_admin_email' );
INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName,       type, propdesc_ID, ordering, intBoolVal ) 
                  VALUES( 3,            2,            20003,     0,         'email_format', 3,    0,           0,        1 );
INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName,          type, propdesc_ID, ordering, intBoolVal ) 
                  VALUES( 3,            2,            20003,     0,         'pagingIncrement', 1,    0,           0,        20 );
INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName,       type, propdesc_ID, ordering, intBoolVal ) 
                  VALUES( 3,            2,            20003,     0,         'javascriptOn', 3,    0,           0,        1 );
INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName,                 type, propdesc_ID, ordering, intBoolVal ) 
                  VALUES( 3,            2,            20003,     0,         'isRMContributorEnabled', 3,    0,           0,        0 );
INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName,                 type, propdesc_ID, ordering, intBoolVal ) 
                  VALUES( 3,            2,            20003,     0,         'isRMCoordinatorEnabled', 3,    0,           0,        0 );
INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName,           type, propdesc_ID, ordering, intBoolVal ) 
                  VALUES( 3,            2,            20003,     0,         'isRMAdminEnabled', 3,    0,           0,        0 );
INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName,                  type, propdesc_ID, ordering, intBoolVal ) 
                  VALUES( 3,            2,            20003,     0,         'canDeclareIfContributor', 3,    0,           0,        0 );
INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName,                type, propdesc_ID, ordering, intBoolVal ) 
                  VALUES( 3,            2,            20003,     0,         'changePasswordAtLogin', 3,    0,           0,        0 );
INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName,           type, propdesc_ID, ordering, intBoolVal ) 
                  VALUES( 3,            2,            20003,     0,         'failedLoginCount', 1,    0,           0,        0 );
INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName,         type, propdesc_ID, ordering, stringVal ) 
                  VALUES( 3,            2,            20003,     0,         'routing_choice', 20,   0,           0,        'none' );
INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName,      type, propdesc_ID, ordering, intBoolVal ) 
                  VALUES( 3,            2,            20003,     0,         'useRichTextEdit', 3,    0,           0,        1 );

INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName,     type, propdesc_ID, ordering, stringVal ) 
                  VALUES( 1,            10,           100001,    0,         'sort_order', 20,   0,           0,        'TypeAndTitle' );
INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName,      type, propdesc_ID, ordering, stringVal ) 
                  VALUES( 1,            10,           100001,    0,         'view_format', 20,   0,           0,        'DetailedListing' );

INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName,     type, propdesc_ID, ordering, stringVal ) 
                  VALUES( 1,            11,           110001,    0,         'sort_order', 20,   0,           0,        'TypeAndTitle' );
INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName,      type, propdesc_ID, ordering, stringVal ) 
                  VALUES( 1,            11,           110001,    0,         'view_format', 20,   0,           0,        'DetailedListing' );

INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName,     type, propdesc_ID, ordering, stringVal ) 
                  VALUES( 1,            12,           120001,    0,         'sort_order', 20,   0,           0,        'TypeAndTitle' );
INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName,      type, propdesc_ID, ordering, stringVal ) 
                  VALUES( 1,            12,           120001,    0,         'view_format', 20,   0,           0,        'DetailedListing' );

INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName,     type, propdesc_ID, ordering, stringVal ) 
                  VALUES( 1,            13,           130001,    0,         'sort_order', 20,   0,           0,        'TypeAndTitle' );
INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName,      type, propdesc_ID, ordering, stringVal ) 
                  VALUES( 1,            13,           130001,    0,         'view_format', 20,   0,           0,        'DetailedListing' );

INSERT INTO rootObjectTable ( handle_id ) VALUES( 100001 );
INSERT INTO rootObjectTable ( handle_id ) VALUES( 110001 );
INSERT INTO rootObjectTable ( handle_id ) VALUES( 120001 );
INSERT INTO rootObjectTable ( handle_id ) VALUES( 130001 );

INSERT INTO userInfo_table ( handle_id, username, domain, userLevel, isActive ) VALUES( 10003, 'Guest', 'DocuShare', 'anonymous', 1 );
INSERT INTO userInfo_table ( handle_id, username, domain, userLevel, isActive ) VALUES( 20003, 'admin', 'DocuShare', 'cpx', 1 );

INSERT INTO careAboutTable ( feature, active ) VALUES( 'records', 0 );
INSERT INTO careAboutTable ( feature, active ) VALUES( 'spaces', 0 );
INSERT INTO careAboutTable ( feature, active ) VALUES( 'quotas', 0 );
INSERT INTO careAboutTable ( feature, active ) VALUES( 'classifications', 0 );
INSERT INTO careAboutTable ( feature, active ) VALUES( 'routing', 0 );

INSERT INTO Link_table VALUES( 4, 1, 10004, 0, 5, 3, 2, 20003, 0 );
INSERT INTO Link_table VALUES( 4, 2, 20004, 0, 5, 4, 1, 10004, 0 );
INSERT INTO Link_table VALUES( 4, 2, 20004, 0, 5, 3, 2, 20003, 0 );
INSERT INTO Link_table VALUES( 4, 3, 30004, 0, 5, 4, 1, 10004, 0 );
INSERT INTO Link_table VALUES( 4, 3, 30004, 0, 5, 3, 2, 20003, 0 );

INSERT INTO Link_table VALUES( 1, 10, 100001, 0, 11, 3, 2, 20003, 0 );
INSERT INTO Link_table VALUES( 1, 11, 110001, 0, 11, 3, 2, 20003, 0 );
INSERT INTO Link_table VALUES( 1, 12, 120001, 0, 11, 3, 2, 20003, 0 );
INSERT INTO Link_table VALUES( 1, 13, 130001, 0, 11, 3, 2, 20003, 0 );

INSERT INTO Link_table VALUES( 3, 1, 10003, 0, 11, 3, 1, 10003, 0 );
INSERT INTO Link_table VALUES( 3, 2, 20003, 0, 11, 3, 2, 20003, 0 );
INSERT INTO Link_table VALUES( 4, 1, 10004, 0, 11, 3, 2, 20003, 0 );
INSERT INTO Link_table VALUES( 4, 2, 20004, 0, 11, 3, 2, 20003, 0 );
INSERT INTO Link_table VALUES( 4, 3, 30004, 0, 11, 3, 2, 20003, 0 );
INSERT INTO Link_table VALUES( 4, 4, 40004, 0, 11, 3, 2, 20003, 0 );
INSERT INTO Link_table VALUES( 4, 5, 50004, 0, 11, 3, 2, 20003, 0 );
INSERT INTO Link_table VALUES( 4, 6, 60004, 0, 11, 3, 2, 20003, 0 );
INSERT INTO Link_table VALUES( 4, 7, 70004, 0, 11, 3, 2, 20003, 0 );

INSERT INTO ACL_table VALUES ( 3,1,10003,0,  3,1, 1,1,0,0,0,1,0 );
INSERT INTO ACL_table VALUES ( 3,1,10003,0,  4,2, 1,1,1,1,1,1,1 );
INSERT INTO ACL_table VALUES ( 3,1,10003,0,  4,3, 1,1,1,1,1,1,1 );
INSERT INTO ACL_table VALUES ( 3,1,10003,0,  4,4, 1,1,0,0,0,1,1 );
INSERT INTO ACL_table VALUES ( 3,2,20003,0,  3,2, 1,1,1,1,1,1,1 );
INSERT INTO ACL_table VALUES ( 3,2,20003,0,  4,2, 1,1,1,1,1,1,1 );
INSERT INTO ACL_table VALUES ( 3,2,20003,0,  4,3, 1,1,1,1,1,1,1 );
INSERT INTO ACL_table VALUES ( 3,2,20003,0,  4,4, 1,1,0,0,0,1,1 );
INSERT INTO ACL_table VALUES ( 4,1,10004,0,  3,2, 1,1,1,1,1,1,1 );
INSERT INTO ACL_table VALUES ( 4,1,10004,0,  4,2, 1,1,1,1,1,1,1 );
INSERT INTO ACL_table VALUES ( 4,1,10004,0,  4,3, 1,1,1,1,1,1,1 );
INSERT INTO ACL_table VALUES ( 4,1,10004,0,  4,4, 1,1,0,0,0,1,1 );
INSERT INTO ACL_table VALUES ( 4,2,20004,0,  3,2, 1,1,1,1,1,1,1 );
INSERT INTO ACL_table VALUES ( 4,2,20004,0,  4,2, 1,1,1,1,1,1,1 );
INSERT INTO ACL_table VALUES ( 4,2,20004,0,  4,3, 1,1,1,1,1,1,1 );
INSERT INTO ACL_table VALUES ( 4,2,20004,0,  4,4, 1,1,0,0,0,1,1 );
INSERT INTO ACL_table VALUES ( 4,3,30004,0,  3,2, 1,1,1,1,1,1,1 );
INSERT INTO ACL_table VALUES ( 4,3,30004,0,  4,2, 1,1,1,1,1,1,1 );
INSERT INTO ACL_table VALUES ( 4,3,30004,0,  4,3, 1,1,1,1,1,1,1 );
INSERT INTO ACL_table VALUES ( 4,3,30004,0,  4,4, 1,1,0,0,0,1,1 );
INSERT INTO ACL_table VALUES ( 4,4,40004,0,  3,2, 1,1,1,1,1,1,1 );
INSERT INTO ACL_table VALUES ( 4,4,40004,0,  4,2, 1,1,1,1,1,1,1 );
INSERT INTO ACL_table VALUES ( 4,4,40004,0,  4,3, 1,1,1,1,1,1,1 );
INSERT INTO ACL_table VALUES ( 4,4,40004,0,  4,4, 1,1,0,0,0,1,1 );
INSERT INTO ACL_table VALUES ( 4,5,50004,0,  3,2, 1,1,1,1,1,1,1 );
INSERT INTO ACL_table VALUES ( 4,5,50004,0,  4,2, 1,1,1,1,1,1,1 );
INSERT INTO ACL_table VALUES ( 4,5,50004,0,  4,3, 1,1,1,1,1,1,1 );
INSERT INTO ACL_table VALUES ( 4,5,50004,0,  4,4, 1,1,0,0,0,1,1 );
INSERT INTO ACL_table VALUES ( 4,6,60004,0,  3,2, 1,1,1,1,1,1,1 );
INSERT INTO ACL_table VALUES ( 4,6,60004,0,  4,2, 1,1,1,1,1,1,1 );
INSERT INTO ACL_table VALUES ( 4,6,60004,0,  4,3, 1,1,1,1,1,1,1 );
INSERT INTO ACL_table VALUES ( 4,6,60004,0,  4,4, 1,1,0,0,0,1,1 );
INSERT INTO ACL_table VALUES ( 4,7,70004,0,  3,2, 1,1,1,1,1,1,1 );
INSERT INTO ACL_table VALUES ( 4,7,70004,0,  4,2, 1,1,1,1,1,1,1 );
INSERT INTO ACL_table VALUES ( 4,7,70004,0,  4,3, 1,1,1,1,1,1,1 );
INSERT INTO ACL_table VALUES ( 4,7,70004,0,  4,4, 1,1,0,0,0,1,1 );

INSERT INTO ACL_table VALUES ( 1,10,100001,0, 3,2, 1,1,1,1,1,1,1 );
INSERT INTO ACL_table VALUES ( 1,10,100001,0, 3,1, 1,1,0,0,0,1,0 );
INSERT INTO ACL_table VALUES ( 1,10,100001,0, 4,2, 1,1,1,1,1,1,1 );
INSERT INTO ACL_table VALUES ( 1,10,100001,0, 4,6, 1,1,0,0,0,1,1 );
INSERT INTO ACL_table VALUES ( 1,10,100001,0, 4,7, 1,1,1,0,1,1,1 );
INSERT INTO ACL_table VALUES ( 1,11,110001,0, 3,2, 1,1,1,1,1,1,1 );
INSERT INTO ACL_table VALUES ( 1,11,110001,0, 3,1, 1,1,0,0,0,1,0 );
INSERT INTO ACL_table VALUES ( 1,11,110001,0, 4,2, 1,1,1,1,1,1,1 );
INSERT INTO ACL_table VALUES ( 1,11,110001,0, 4,6, 1,1,0,0,0,1,1 );
INSERT INTO ACL_table VALUES ( 1,11,110001,0, 4,7, 1,1,1,0,1,1,1 );
INSERT INTO ACL_table VALUES ( 1,12,120001,0, 3,2, 1,1,1,1,1,1,1 );
INSERT INTO ACL_table VALUES ( 1,12,120001,0, 3,1, 1,1,0,0,0,1,0 );
INSERT INTO ACL_table VALUES ( 1,12,120001,0, 4,2, 1,1,1,1,1,1,1 );
INSERT INTO ACL_table VALUES ( 1,12,120001,0, 4,6, 1,1,0,0,0,1,1 );
INSERT INTO ACL_table VALUES ( 1,12,120001,0, 4,7, 1,1,1,0,1,1,1 );
INSERT INTO ACL_table VALUES ( 1,13,130001,0, 3,2, 1,1,1,1,1,1,1 );
INSERT INTO ACL_table VALUES ( 1,13,130001,0, 3,1, 1,1,0,0,0,1,0 );
INSERT INTO ACL_table VALUES ( 1,13,130001,0, 4,2, 1,1,1,1,1,1,1 );
INSERT INTO ACL_table VALUES ( 1,13,130001,0, 4,6, 1,1,0,0,0,1,1 );
INSERT INTO ACL_table VALUES ( 1,13,130001,0, 4,7, 1,1,1,0,1,1,1 );

INSERT INTO StringTable VALUES ( 'en', 'class name', 'BulletinBoard', 'BulletinBoard', 'Discussion' );
INSERT INTO StringTable VALUES ( 'en', 'class name plural', 'BulletinBoard', 'BulletinBoard', 'Discussions' );
INSERT INTO StringTable VALUES ( 'en', 'class name', 'Bulletin', 'Bulletin', 'Topic' );
INSERT INTO StringTable VALUES ( 'en', 'class name plural', 'Bulletin', 'Bulletin', 'Topics' );
INSERT INTO StringTable VALUES ( 'en', 'class name', 'Calendar', 'Calendar', 'Calendar' );
INSERT INTO StringTable VALUES ( 'en', 'class name plural', 'Calendar', 'Calendar', 'Calendars' );
INSERT INTO StringTable VALUES ( 'en', 'class name', 'Event', 'Event', 'Event' );
INSERT INTO StringTable VALUES ( 'en', 'class name plural', 'Event', 'Event', 'Events' );
INSERT INTO StringTable VALUES ( 'en', 'class name', 'Collection', 'Collection', 'Collection' );
INSERT INTO StringTable VALUES ( 'en', 'class name plural', 'Collection', 'Collection', 'Collections' );
INSERT INTO StringTable VALUES ( 'en', 'class name', 'Document', 'Document', 'Document' );
INSERT INTO StringTable VALUES ( 'en', 'class name plural', 'Document', 'Document', 'Documents' );
INSERT INTO StringTable VALUES ( 'en', 'class name', 'Version', 'Version', 'Version' );
INSERT INTO StringTable VALUES ( 'en', 'class name plural', 'Version', 'Version', 'Versions' );
INSERT INTO StringTable VALUES ( 'en', 'class name', 'Rendition', 'Rendition', 'Rendition' );
INSERT INTO StringTable VALUES ( 'en', 'class name plural', 'Rendition', 'Rendition', 'Renditions' );
INSERT INTO StringTable VALUES ( 'en', 'class name', 'Subscription', 'Subscription', 'Subscription' );
INSERT INTO StringTable VALUES ( 'en', 'class name plural', 'Subscription', 'Subscription', 'Subscriptions' );
INSERT INTO StringTable VALUES ( 'en', 'class name', 'SavedQuery', 'SavedQuery', 'SavedQuery' );
INSERT INTO StringTable VALUES ( 'en', 'class name plural', 'SavedQuery', 'SavedQuery', 'SavedQueries' );
INSERT INTO StringTable VALUES ( 'en', 'class name', 'URL', 'URL', 'URL' );
INSERT INTO StringTable VALUES ( 'en', 'class name plural', 'URL', 'URL', 'URLs' );
INSERT INTO StringTable VALUES ( 'en', 'class name', 'User', 'User', 'User' );
INSERT INTO StringTable VALUES ( 'en', 'class name plural', 'User', 'User', 'Users' );
INSERT INTO StringTable VALUES ( 'en', 'class name', 'Group', 'Group', 'Group' );
INSERT INTO StringTable VALUES ( 'en', 'class name plural', 'Group', 'Group', 'Groups' );
INSERT INTO StringTable VALUES ( 'en', 'class name', 'MailMessage', 'MailMessage', 'MailMessage' );
INSERT INTO StringTable VALUES ( 'en', 'class name plural', 'MailMessage', 'MailMessage', 'MailMessages' );
INSERT INTO StringTable VALUES ( 'en', 'class name', 'Workspace', 'Workspace', 'Workspace' );
INSERT INTO StringTable VALUES ( 'en', 'class name plural', 'Workspace', 'Workspace', 'Workspaces' );
INSERT INTO StringTable VALUES ( 'en', 'class name', 'Weblog', 'Weblog', 'Weblog' );
INSERT INTO StringTable VALUES ( 'en', 'class name plural', 'Weblog', 'Weblog', 'Weblogs' );
INSERT INTO StringTable VALUES ( 'en', 'class name', 'WeblogEntry', 'WeblogEntry', 'WeblogEntry' );
INSERT INTO StringTable VALUES ( 'en', 'class name plural', 'WeblogEntry', 'WeblogEntry', 'WeblogEntries' );
INSERT INTO StringTable VALUES ( 'en', 'class name', 'Wiki', 'Wiki', 'Wiki' );
INSERT INTO StringTable VALUES ( 'en', 'class name plural', 'Wiki', 'Wiki', 'Wikis' );
INSERT INTO StringTable VALUES ( 'en', 'class name', 'WikiPage', 'WikiPage', 'WikiPage' );
INSERT INTO StringTable VALUES ( 'en', 'class name plural', 'WikiPage', 'WikiPage', 'WikiPages' );
INSERT INTO StringTable VALUES ( 'en', 'class name', 'Space', 'Space', 'Space' );
INSERT INTO StringTable VALUES ( 'en', 'class name plural', 'Space', 'Space', 'Spaces' );
INSERT INTO StringTable VALUES ( 'en', 'class name', 'DocAnnotation', 'DocAnnotation', 'DocAnnotation' );
INSERT INTO StringTable VALUES ( 'en', 'class name plural', 'DocAnnotation', 'DocAnnotation', 'DocAnnotations' );

INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'containment', 'containment' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'draftContainment', 'draftContainment' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'bulletin', 'bulletin' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'event', 'event' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'membership', 'membership' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'subscription', 'subscription' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'subscriber', 'subscriber' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'lockedBy', 'lockedBy' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'version', 'version' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'draftVersion', 'draftVersion' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'rendition', 'rendition' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'owner', 'owner' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'modifiedBy', 'modifiedBy' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'preferredVersion', 'preferredVersion' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'preferredRendition', 'preferredRendition' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'originalRendition', 'originalRendition' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'attachment', 'attachment' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'nativeMessage', 'nativeMessage' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'messageThread', 'messageThread' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'favorite', 'favorite' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'associatedCollection', 'associatedCollection' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'recordSuccessor', 'recordSuccessor' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'jobTicket', 'jobTicket' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'workspace', 'workspace' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'membershipGroup', 'membershipGroup' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'weblog', 'weblog' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'annotation', 'annotation' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'wikiPage', 'wikiPage' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'draftWeblog', 'draftWeblog' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'attach', 'attach' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'docAnnotation', 'docAnnotation' );

INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'containment', 'Appears In' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'containment', 'Contains' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'draftContainment', 'Appears In' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'draftContainment', 'Contains Drafts' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'bulletin', 'Appears In' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'bulletin', 'Contains' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'event', 'Appears In' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'event', 'Contains' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'membership', 'Member Of' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'membership', 'Members' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'subscription', 'Subscribed To' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'subscription', 'Subscriptions' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'subscriber', 'Subscribed To' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'subscriber', 'Subscribed By' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'lockedBy', 'Locks' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'lockedBy', 'Locked By' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'version', 'Version Of' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'version', 'Versions' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'draftVersion', 'Draft Version Of' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'draftVersion', 'Draft Versions' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'rendition', 'Rendition Of' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'rendition', 'Renditions' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'owner', 'Owns' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'owner', 'Owner' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'modifiedBy', 'Modified' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'modifiedBy', 'Modified By' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'preferredVersion', 'Preferred Version Of' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'preferredVersion', 'Preferred Version' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'preferredRendition', 'Preferred Rendition Of' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'preferredRendition', 'Preferred Rendition' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'originalRendition', 'Original Rendition Of' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'originalRendition', 'Original Rendition' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'attachment', 'Attachment In' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'attachment', 'Attachments' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'nativeMessage', 'Native Message For' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'nativeMessage', 'Native Message' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'messageThread', 'Previous Thread' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'messageThread', 'Next Thread' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'favorite', 'Favorite For' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'favorite', 'Favorites:' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'associatedCollection', 'Associated Collection For' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'associatedCollection', 'Associated Collection' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'recordSuccessor', 'Intended Record Predecessor' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'recordSuccessor', 'Intended Record Successor' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'jobTicket', 'Job Ticket For' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'jobTicket', 'Job Tickets' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'workspace', 'Appears In' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'workspace', 'Contains' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'membershipGroup', 'Membership Group' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'membershipGroup', 'Membership Group For' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'weblog', 'Appears In' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'weblog', 'Contains' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'annotation', 'Appears On' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'annotation', 'Annotations' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'wikiPage', 'Appears In' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'wikiPage', 'Contains' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'draftWeblog', 'Appears In' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'draftWeblog', 'Contains Pre-approved' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'attach', 'Attached to' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'attach', 'Attach links' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'docAnnotation', 'Annotation On' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'docAnnotation', 'Annotations' );

INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'containment', 'The container end of the link' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'containment', 'The containee end of the link' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'draftContainment', 'The container end of the link' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'draftContainment', 'The containee end of the link' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'bulletin', 'The Discussion container, or previous thread Topic end of the link' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'bulletin', 'The Topic containee end of the link' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'event', 'The Calendar container end of the link' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'event', 'The Calendar Event containee end of the link' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'membership', 'The Group container end of the link' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'membership', 'The member elements end of the link' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'subscription', 'The object which is subscribed to' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'subscription', 'The Subscription object' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'subscriber', 'The Subscription held by a subscriber.' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'subscriber', 'The User or Group which holds a subscription' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'lockedBy', 'The object which is locked' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'lockedBy', 'The User object which holds the lock' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'version', 'The Document object which has the destination Version' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'version', 'The Version object which is held by the source Document' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'draftVersion', 'The Document object which has the destination draft Version' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'draftVersion', 'The draft Version object which is held by the source Document' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'rendition', 'The Version object which has the destination Rendition' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'rendition', 'The Rendition object which is held by the source Version' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'owner', 'The owned object' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'owner', 'The User which owns the source object' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'modifiedBy', 'The object which was modified' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'modifiedBy', 'The user who last changed the object' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'preferredVersion', 'The Document for which the destination Version is the preferred version' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'preferredVersion', 'The Version which is the preferred version for the source Document' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'preferredRendition', 'The Version for which the destination Rendition is the preferred rendition' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'preferredRendition', 'The Rendition which is the preferred rendition for the source Version' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'originalRendition', 'The Version for which the destionation Rendition is the original rendition' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'originalRendition', 'The Rendition which is the original rendition for the source Version' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'attachment', 'The mail message end of the link' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'attachment', 'The attachment end of the link' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'nativeMessage', 'The mail message end of the link' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'nativeMessage', 'The native message end of the link' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'messageThread', 'The prededing item in the thread' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'messageThread', 'The following item in the thread' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'favorite', 'The user''s end of the link' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'favorite', 'The favorite item end of the link' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'associatedCollection', 'The user or group with which this collection is associated.' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'associatedCollection', 'The collection that is linked to a group or a user. For a collection linked to a group, it is the collection into which the DocuShare email application copies email messages sent to the group members.  For a collection linked to a user, it is the user''s personal collection, displayed in the DocuShare web UI in My DocuShare.' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'recordSuccessor', 'The object which will be the record predecessor to the destination object in the IRM when the successor relationship is established at the IRM' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'recordSuccessor', 'The object which will be a record successor to the source object in the IRM when the successor relationship is established at the IRM' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'jobTicket', 'The Document which holds a job ticket' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'jobTicket', 'The Document which is a job ticket for another Document' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'workspace', 'The containing object' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'workspace', 'The object which is contained' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'membershipGroup', 'The object which holds a membership group' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'membershipGroup', 'The group which is membership group for a particular object' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'weblog', 'The weblog container for this object' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'weblog', 'The entry in a weblog' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'annotation', 'The object to which the annotation has been made' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'annotation', 'The annotation end of the link' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'wikiPage', 'The wiki, which may hold wiki pages' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'wikiPage', 'The page in a wiki' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'draftWeblog', 'The weblog container for this object' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'draftWeblog', 'A pre-approved entry in a weblog' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'attach', 'The object to which this object is attached' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'attach', 'Objects attached to this object' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'docAnnotation', 'The document which has been annotated' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'docAnnotation', 'The annotation on a document' );

INSERT INTO StringTable VALUES ( 'en', 'property name', 'Object', 'Object.title', 'Title' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Object', 'Object.title', 'The title of the object. The title should be short, but descriptive, and can contain spaces and punctuation marks.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Object', 'Object.webdav_title', 'WebDAV Title' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Object', 'Object.webdav_title', 'The internally-managed title of the object, used just for WebDAV. Your application should not access this non-visible property.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Object', 'Object.description', 'Description' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Object', 'Object.description', 'A detailed description of the object. You can include HTML tags in the object''s description. For container objects, the description appears below the title.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Object', 'Object.summary', 'Summary' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Object', 'Object.summary', 'A short description of the object. The summary appears below the object''s title.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Object', 'Object.isRoot', 'Appears on Home Page' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Object', 'Object.isRoot.true', 'Yes' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Object', 'Object.isRoot.false', 'No' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Object', 'Object.isRoot', 'True if this object is a root object.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Object', 'Object.isRecord', 'Record' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Object', 'Object.isRecord.true', 'Yes' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Object', 'Object.isRecord.false', 'No' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Object', 'Object.isRecord', 'Indicates whether this is a Record.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Object', 'Object.rm_instance_handle', 'Record Instance Handle' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Object', 'Object.rm_instance_handle', 'Used internally by DocuShare to handle data for DS Objects that have been declared to be records.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Object', 'Object.keywords', 'Keywords' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Object', 'Object.keywords', 'One or more words to associate with the object. Keywords help to categorize objects and can be used to find objects in a search. Separate keywords with a comma.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Object', 'Object.create_date', 'Create Date' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Object', 'Object.create_date', 'The date and time when the object was added to DocuShare.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Object', 'Object.modified_date', 'Modified Date' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Object', 'Object.modified_date', 'The date and time when the object was last changed.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Object', 'Object.expiration_date', 'Expiration Date' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Object', 'Object.expiration_date', 'The date on which the object is no longer needed. You can search for expired objects and delete or archive them.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Object', 'Object.locale', 'Locale' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Object', 'Object.locale', 'The language that was specified for this object.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Object', 'Object.client_data', 'Client Data' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Object', 'Object.client_data', 'Internal, non-visible property used by the Windows Client for its operation.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Object', 'Object.readyForDeclare', 'Ready for Declare' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Object', 'Object.readyForDeclare.true', 'Yes' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Object', 'Object.readyForDeclare.false', 'No' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Object', 'Object.readyForDeclare', 'Indicates that the object has at least one complete classification and can be declared as a record. This is an indication that a user has finished classification, but it does not guarantee that all required for declare is complete.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Object', 'Object.routing_template_id', 'Routing Template ID' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Object', 'Object.routing_template_id', 'The internal ID of the template that will be run when documents are added to this object' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Object', 'Object.copiedFrom', 'Copied From' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Object', 'Object.copiedFrom', 'Unique identifier of the object from which this object was copied' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Object', 'Object.lastSynchronized', 'Last Synchronized' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Object', 'Object.lastSynchronized', 'Date on which this copied object was last synchronized from the original object from which it was copied.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Object', 'Object.space', 'Space' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Object', 'Object.space', 'The space in which this object exists.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Object', 'Object.archivedAncestors', 'Archived Ancestors' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Object', 'Object.archivedAncestors', 'Internal property used to archive an object''s scope' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Object', 'Object.archivedParents', 'Archived Parents' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Object', 'Object.archivedParents', 'Internal property used to archive an object''s scope' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Object', 'Object.archivedDate', 'Archived Date' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Object', 'Object.archivedDate', 'Date on which an object was archived' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.domain', 'Domain' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.domain', 'The organization or entity to which the user belongs.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.username', 'Username' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.username', 'The name used to log into DocuShare.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.password', 'Password' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.password', 'The password used to log into DocuShare.  The password is case sensitive and can be any non-zero length, though it is stored as a fixed length encrypted value.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.last_name', 'Last Name' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.last_name', 'The user''s last name. Users are listed on the DocuShare site by their first and last names.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.first_name', 'First Name' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.first_name', 'The user''s first name. Users are listed on the DocuShare site by their first and last names.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.email', 'Email Address' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.email', 'The user''s complete email address. User email addresses are available to all DocuShare users, allowing a user to easily contact another user.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.email_format', 'Email Format' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.email_format.true', 'HTML' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.email_format.false', 'Plain Text' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.email_format', 'The email format DocuShare uses to send mail messages to the user: HTML or Plain Text.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.last_login', 'Last Login' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.last_login', 'The date and time when the user last logged into DocuShare.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.mailstop', 'Mail Stop' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.mailstop', 'The user''s mailing address or mail stop.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.phone', 'Phone' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.phone', 'The user''s phone number.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.home_page', 'Home Page' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.home_page', 'The URL of the user''s home page, if one is available.  This home page is different from the personal home page provided through My DocuShare.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.last_whats_new', 'Last What''s New' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.last_whats_new', 'Last time the user ran What''s New.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.isActive', 'Active User' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.isActive', 'Active/inactive status of the user account.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.isActive.true', 'Yes' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.isActive.false', 'No' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.remote_DN', 'Remote Distinguished Name' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.remote_DN', 'Define the name by which external user information is retrieved.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.routing_choice', 'Routing Task Notification' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.routing_choice.none', 'None' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.routing_choice.email', 'Email' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.routing_choice', 'How to notify the user of an assigned routing task. Email sends a mail message with a URL to the newly assigned task. None displays the task in the My Tasks window only.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.routingIDs', 'Routing IDs' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.routingIDs', 'Internal user data for workflow.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.pagingIncrement', 'Page Size' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.pagingIncrement', 'For paged displays such as favorites, collection contents, and search results, the maximum number of lines to display per page.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.javascriptOn', 'Enable Javascript' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.javascriptOn', 'Enables DocuShare to use Javascript to enhance the performance and appearance of DocuShare web pages. When disabled, DocuShare displays pages using HTML. <b>Yes</b> to enable, <b>No</b> to disable. For 508C compliance, set to disable.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.javascriptOn.true', 'Yes' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.javascriptOn.false', 'No' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.attachmentAsURL', 'Attachment as URL' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.attachmentAsURL.true', 'Yes' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.attachmentAsURL.false', 'No' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.attachmentAsURL', 'If you are a member of the group to whom an email message is sent, specifies how attachments are handled. Yes includes a URL to the attachment in the message; No includes the attachment in the message.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.isInteractEnabled', 'Interact Enabled' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.isInteractEnabled.true', 'Yes' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.isInteractEnabled.false', 'No' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.isInteractEnabled', 'Indicates whether this user is enabled to use the Interact feature.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.isRMContributorEnabled', 'RM Contributor' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.isRMContributorEnabled.true', 'Yes' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.isRMContributorEnabled.false', 'No' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.isRMContributorEnabled', 'Indicates whether the user is a records management Contributor. Contributors can classify objects, designate the objects that are ready to be declared as records, and create personal presets.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.isRMCoordinatorEnabled', 'RM Coordinator' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.isRMCoordinatorEnabled.true', 'Yes' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.isRMCoordinatorEnabled.false', 'No' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.isRMCoordinatorEnabled', 'Indicates whether the user is a records management Coordinator. Coordinators can classify objects, declare objects as records, add successor records, create personal, group, and collection presets, assign user roles, and access the IRM system' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.isRMAdminEnabled', 'RM Administrator' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.isRMAdminEnabled.true', 'Yes' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.isRMAdminEnabled.false', 'No' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.isRMAdminEnabled', 'Indicates whether the user is a records management Administrator. Administrators can access the IRM system. In addition, Administrators can do any action allowed to RM Contributors or RM Coordinators.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.canDeclareIfContributor', 'Contributor Declare' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.canDeclareIfContributor.true', 'Yes' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.canDeclareIfContributor.false', 'No' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.canDeclareIfContributor', 'If the user is a records management Contributor, indicates whether the user can declare objects as records.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.changePasswordAtLogin', 'Must Change Password at Login' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.changePasswordAtLogin.true', 'Yes' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.changePasswordAtLogin.false', 'No' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.changePasswordAtLogin', 'Indicates that the system will require the password to be changed at next login.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.failedLoginCount', 'Failed Login Count' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.failedLoginCount', 'Internal property which tracks the number of failed logins since the last successful login, or user create.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.passwordExpiration', 'Password Expire Date' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.passwordExpiration', 'The date on which the current password will no longer be valid and must be changed.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.language', 'Language' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.language', 'The user''s preferred display language. This is available for anything which needs to provide user-visible display, though browser applications normally use the browser language settings.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.characterCode', 'Character Code' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.characterCode', 'The user''s preferred display character encoding.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.noSubscriptionNotifyFor', 'Suppress Notification Messages' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.noSubscriptionNotifyFor.anyChange', 'Any Change' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.noSubscriptionNotifyFor.add', 'Something added' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.noSubscriptionNotifyFor.addNewVersion', 'New Document Version added' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.noSubscriptionNotifyFor.remove', 'Something deleted' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.noSubscriptionNotifyFor.changeProps', 'Properties edited' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.noSubscriptionNotifyFor.changeACL', 'Permissions edited' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.noSubscriptionNotifyFor.changeOwner', 'Change in ownership' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.noSubscriptionNotifyFor.changeLocation', 'Location edited' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.noSubscriptionNotifyFor.lockCheckout', 'Document locked or checked out' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.noSubscriptionNotifyFor.unlock', 'Document unlocked' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.noSubscriptionNotifyFor', 'The DocuShare notifications for which email messages to this user should be suppressed.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.noEmailAgentNotifyFor', 'Suppress Email Agent Messages' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.noEmailAgentNotifyFor.uploadSuccess', 'Upload success' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.noEmailAgentNotifyFor.uploadFailure', 'Upload failure' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.noEmailAgentNotifyFor.forwarded', 'Forwarded' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.noEmailAgentNotifyFor', 'The DocuShare Email Agent events for which email notification to this user should be suppressed.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.alternateEmail', 'Alternate Email Addresses' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.alternateEmail', 'Additional email addresses for this user. Separate email addresses with a comma.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.layoutDefaults', 'Layout Defaults' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.layoutDefaults', 'The user''s choices for display layout defaults, in XML format' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.userLevel', 'User Level' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.userLevel.anonymous', 'Guest' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.userLevel.minimum', 'Read-Only' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.userLevel.dsLimited', 'DocuShare Limited' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.userLevel.imageManager', 'Image Manager' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.userLevel.dsFull', 'DocuShare' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.userLevel.cpx', 'CPX' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.userLevel', 'User level determines the level of access to site content and functions.  User levels are Guest, Read-Only, DocuShare Limited, Image Manager, DocuShare, or CPX.  Your site license determines the available user levels.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.homeSpace', 'Home Space' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.homeSpace', 'The space initially selected for a user after login.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.useRichTextEdit', 'Text Composition Format' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.useRichTextEdit.true', 'Rich Text' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.useRichTextEdit.false', 'Plain Text' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.useRichTextEdit', 'Indicates the user''s preference for rich text or plain text editing for text input, for example in Wiki or Weblog entries or the description property.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.docCountQuota', 'Document Count Quota' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.docCountQuota', 'The maximum number of documents this user can own. The value may also be unlimited or not set. The number includes email attachments and documents attached to wiki pages.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.contentSizeMBQuota', 'Document Content Size Quota (MB)' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.contentSizeMBQuota', 'The maximum size, in megabytes, of document content owned by this user. The value may also be unlimited or not set. Document content size includes content in all renditions of all versions of documents.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Group', 'Group.remote_DN', 'Remote Distinguished Name' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Group', 'Group.remote_DN', 'Define the name by which external group information is retrieved.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Group', 'Group.domain', 'Domain' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Group', 'Group.domain', 'The organization or entity to which the group belongs.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Group', 'Group.emailAlias', 'Email Alias' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Group', 'Group.emailAlias', 'A unique name that can be used as the recipient of an email message.  The name must follow your email application''s conventions; for example, no spaces between words.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Group', 'Group.replyToGroup', 'Reply To' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Group', 'Group.replyToGroup.true', 'Group' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Group', 'Group.replyToGroup.false', 'Sender' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Group', 'Group.replyToGroup', 'Specifies to whom an email reply is sent when any member of the group sends a message. Sender emails a reply only to the user who sent the message; Group emails a reply to all the group members regardless of who sent the message. If the group includes another group as a member, the reply includes that group as well.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Group', 'Group.confirmEmailReceipt', 'Confirm Email Receipt' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Group', 'Group.confirmEmailReceipt.true', 'Yes' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Group', 'Group.confirmEmailReceipt.false', 'No' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Group', 'Group.confirmEmailReceipt', 'Confirms receiving the email message sent to a collection or group by sending an email to the message sender.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Group', 'Group.external_recipients', 'External Recipients' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Group', 'Group.external_recipients', 'The email addresses for people who are not registered users on the DocuShare server.  When the Group is used by the DocuShare Email agent, these email addresses are included along with those of group members.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Group', 'Group.spamControl', 'Spam Control' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Group', 'Group.spamControl', 'Indicates who may send email to the Group email alias.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Group', 'Group.spamControl.anyone', 'No Restriction' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Group', 'Group.spamControl.onlyDSUser', 'Registered Users Only' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Group', 'Group.spamControl.onlyGroupMember', 'Group Members Only' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Group', 'Group.docCountQuota', 'Document Count Quota' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Group', 'Group.docCountQuota', 'The maximum number of documents a member of this group can own. The value may also be unlimited or not set. The number includes email attachments and documents attached to wiki pages. This limit applies if the user does not have an explicit quota defined. If the user belongs to more than one group with a quota, the highest group quota applies.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Group', 'Group.contentSizeMBQuota', 'Document Content Size Quota (MB)' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Group', 'Group.contentSizeMBQuota', 'The maximum size, in megabytes, of document content owned by any member of this group. The value may also be unlimited or not set. Document content size includes content in all renditions of all versions of documents. This limit applies if the user does not have an explicit quota defined. If the user belongs to more than one group with a quota, the highest group quota applies.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Collection', 'Collection.logo', 'Logo' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Collection', 'Collection.logo', 'The URL or handle of a GIF or JPEG image. The URL is any valid Internet address for an image file (for example, http://www.mycompany.com/images/image.gif) and the handle is the handle number of an image in a DocuShare repository (for example, Document-12). The image displays at the top of the collection listing.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Collection', 'Collection.bg_image', 'Background Image' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Collection', 'Collection.bg_image', 'The URL or handle of a GIF or JPEG image. The URL is any valid Internet address for an image file (for example, http://www.mycompany.com/images/image.gif) and the handle is the handle number of an image in a DocuShare repository (for example, Document-12). The image displays in the background of the collection listing.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Collection', 'Collection.sort_order', 'Sort Order' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Collection', 'Collection.sort_order.TypeAndTitle', 'Type and Title' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Collection', 'Collection.sort_order.TypeAndDate', 'Type and Date' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Collection', 'Collection.sort_order.Date', 'Date' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Collection', 'Collection.sort_order.Title', 'Title' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Collection', 'Collection.sort_order.TitleReversed', 'Title Reversed' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Collection', 'Collection.sort_order.DateAscending', 'Date Ascending' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Collection', 'Collection.sort_order', 'The order in which objects are displayed in the collection: Type and Title groups objects by type and orders objects alphabetically by title. Type and Date groups objects by type and orders objects in reverse chronological order, with most recently modified objects displayed first. Date displays objects in reverse chronological order, with most recently modified objects displayed first. Title displays objects alphabetically by title. Title Reversed displays objects in reverse alphabetical order by title. Date Ascending displays objects chronologically, with most recently modified objects displayed last.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Collection', 'Collection.view_format', 'View Format' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Collection', 'Collection.view_format.DetailedListing', 'Detailed Listing' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Collection', 'Collection.view_format.Images', 'Images' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Collection', 'Collection.view_format.Email', 'Email' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Collection', 'Collection.view_format', 'The format in which objects are displayed in the collection. Detailed Listing displays objects in a list. Images displays image files as thumbnails and all other object types as large icons. Email displays the properties associated with mail messages.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Collection', 'Collection.add_as_draft', 'Route Before Publishing' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Collection', 'Collection.add_as_draft.true', 'Yes' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Collection', 'Collection.add_as_draft.false', 'No' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Collection', 'Collection.add_as_draft', 'Requires each document added to the collection to be routed.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Collection', 'Collection.emailAlias', 'Email Alias' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Collection', 'Collection.emailAlias', 'A unique name that can be used as the recipient of an email message.  The name must follow your email application''s conventions; for example, no spaces between words.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Collection', 'Collection.spamControl', 'Spam Control' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Collection', 'Collection.spamControl', 'Indicates who may send email to the Collection email alias.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Collection', 'Collection.spamControl.anyone', 'No Restriction' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Collection', 'Collection.spamControl.onlyDSUser', 'Registered Users Only' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'BulletinBoard', 'BulletinBoard.logo', 'Logo' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'BulletinBoard', 'BulletinBoard.logo', 'The URL or handle of a GIF or JPEG image. The URL is any valid Internet address for an image file (for example, http://www.mycompany.com/images/image.gif) and the handle is the handle number of an image in a DocuShare repository (for example, Document-12). The image displays at the top of the discussion listing.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'BulletinBoard', 'BulletinBoard.bg_image', 'Background Image' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'BulletinBoard', 'BulletinBoard.bg_image', 'The URL or handle of a GIF or JPEG image. The URL is any valid Internet address for an image file (for example, http://www.mycompany.com/images/image.gif) and the handle is the handle number of an image in a DocuShare repository (for example, Document-12). The image displays in the background of the discussion listing.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'BulletinBoard', 'BulletinBoard.expire', 'Topics Expire In' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'BulletinBoard', 'BulletinBoard.expire.0', '1 hour' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'BulletinBoard', 'BulletinBoard.expire.1', '1 day' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'BulletinBoard', 'BulletinBoard.expire.2', '2 days' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'BulletinBoard', 'BulletinBoard.expire.3', '3 days' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'BulletinBoard', 'BulletinBoard.expire.4', '4 days' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'BulletinBoard', 'BulletinBoard.expire.5', '5 days' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'BulletinBoard', 'BulletinBoard.expire.6', '1 week' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'BulletinBoard', 'BulletinBoard.expire.7', '2 weeks' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'BulletinBoard', 'BulletinBoard.expire.8', '1 month' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'BulletinBoard', 'BulletinBoard.expire.9', '2 months' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'BulletinBoard', 'BulletinBoard.expire.10', 'Never' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'BulletinBoard', 'BulletinBoard.expire', 'The length of time to retain bulletins in the discussion after they are added. When a topic becomes older than the selected duration, it no longer appears in the discussion. Expired topics can be viewed and deleted separately.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'BulletinBoard', 'BulletinBoard.showHierarchy', 'Display Hierarchy' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'BulletinBoard', 'BulletinBoard.showHierarchy.true', 'Indented' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'BulletinBoard', 'BulletinBoard.showHierarchy.false', 'Flat' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'BulletinBoard', 'BulletinBoard.showHierarchy', 'Specifies how topic threads are displayed in the discussion. <b>Indented</b> indents each reply to a topic or reply. <b>Flat</b> displays all topics and replies at the same level.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'URL', 'URL.url', 'URL' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'URL', 'URL.url', 'The complete Internet address of a Web page. For example: http://www.website.com. While viewing the Web page in a browser, you can copy the URL from the Address or Location field and paste it into the URL field.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'URL', 'URL.displayInNewWindow', 'Display in New Window' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'URL', 'URL.displayInNewWindow.true', 'Yes' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'URL', 'URL.displayInNewWindow.false', 'No' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'URL', 'URL.displayInNewWindow', 'Indicates whether DocuShare should display the URL in a new browser, or in the same browser as DocuShare.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Document', 'Document.author', 'Author' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Document', 'Document.author', 'The document''s author or authors. An author can be someone other than the document''s owner.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Document', 'Document.content_type', 'Content Type' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Document', 'Document.content_type', 'The format of the document, as defined by its MIME Type. For example, a Microsoft Word document would map to the MIME Type application/msword. DocuShare uses the MIME Type to open a document in the appropriate editor. When a document is uploaded to the server, DocuShare tries to determine the content type. If the type cannot be determined, you can enter the appropriate MIME Type for the document. If you are uncertain about the correct value to enter, see your administrator. ' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Document', 'Document.size', 'Size' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Document', 'Document.size', 'Size, in bytes, of the document''s content file.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Document', 'Document.max_versions', 'Max Versions' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Document', 'Document.max_versions', 'The maximum number of versions to save. When a new version of a document is added to DocuShare, the oldest version is deleted.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Document', 'Document.highest_version_used', 'Highest Version' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Document', 'Document.highest_version_used', 'The highest version number assigned so far for this document.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Document', 'Document.abstract', 'Abstract' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Document', 'Document.abstract', 'A summary of the document content, generated and added immediately after the document is indexed for search.  The abstract is available only for documents whose content type supports text capture and analysis.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Document', 'Document.original_file_name', 'File name' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Document', 'Document.original_file_name', 'The document''s original filename.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Document', 'Document.add_as_draft', 'Routing Required' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Document', 'Document.add_as_draft.true', 'Yes' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Document', 'Document.add_as_draft.false', 'No' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Document', 'Document.add_as_draft', 'Specifies whether new versions for this document are automatically routed.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Document', 'Document.canAddVersions', 'Add Versions' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Document', 'Document.canAddVersions.true', 'Allowed' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Document', 'Document.canAddVersions.false', 'Not Allowed' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Document', 'Document.canAddVersions', 'Indicates whether additional versions may be added to the original document.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Document', 'Document.isInteract', 'Interact Document' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Document', 'Document.isInteract.true', 'Yes' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Document', 'Document.isInteract.false', 'No' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Document', 'Document.isInteract', 'Indicates whether this is an Interact document.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Document', 'Document.autoMovePreferredVersion', 'Update Preferred Version' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Document', 'Document.autoMovePreferredVersion.true', 'Yes' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Document', 'Document.autoMovePreferredVersion.false', 'No' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Document', 'Document.autoMovePreferredVersion', 'If ''Yes'', a new version automatically becomes the preferred (main) version.  If ''No'', the preferred version remains the same version until another version is designated.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Document', 'Document.isPlaceholder', 'Is Placeholder' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Document', 'Document.isPlaceholder', 'Indicates whether this object is a placeholder for something else' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Document', 'Document.isPlaceholder.true', 'Yes' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Document', 'Document.isPlaceholder.false', 'No' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Document', 'Document.cfSpecialWords', 'TrueMatch Special Words' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Document', 'Document.cfSpecialWords', 'Words used by the TrueMatch application duplicate detection.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Document', 'Document.cfCopyID', 'TrueMatch Copy ID' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Document', 'Document.cfCopyID', 'Unique ID used by the TrueMatch application.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Version', 'Version.version_number', 'Version Number' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Version', 'Version.version_number', 'The number assigned to the document version.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Version', 'Version.revision_comments', 'Version Comments' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Version', 'Version.revision_comments', 'A description associated with this version, commonly a short description of the changes.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Version', 'Version.abstract', 'Abstract' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Version', 'Version.abstract', 'A summary of the version content, generated and added immediately after the version is indexed for search.  The abstract is available only for versions whose content type supports text capture and analysis.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Rendition', 'Rendition.rendition_type', 'Rendition Type' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Rendition', 'Rendition.rendition_type', 'The version''s display format as specified by its MIME Type. For example, a Microsoft Word document maps to the MIME Type application/msword.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Rendition', 'Rendition.size', 'Size' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Rendition', 'Rendition.size', 'Size, in bytes, of the content file(s) for this rendition.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Rendition', 'Rendition.generated', 'Generated' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Rendition', 'Rendition.generated.true', 'Yes' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Rendition', 'Rendition.generated.false', 'No' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Rendition', 'Rendition.generated', 'Indicates whether or not DocuShare generated the rendition. For example, clicking the <b>View</b> icon generates an HTML rendition of a document.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Rendition', 'Rendition.rendition_detail', 'Rendition Detail' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Rendition', 'Rendition.rendition_detail', 'Additional characteristics about the rendition.  Characteristics kept may differ according to the application creating the rendition, or according to rendition type.  Renditions of the same MIME type may have different values for the Rendition Detail property.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.external_recipients', 'External Recipients' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Subscription', 'Subscription.external_recipients', 'The list of email addresses for recipients who are not registered users on the DocuShare server. When the subscribed event occurs, an email message is sent to each recipient. Separate email addresses with a comma.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.events', 'Events of Interest' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.events.anyChange', 'Any Change' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.events.add', 'Something added' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.events.addNewVersion', 'New Document Version added' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.events.remove', 'Something deleted' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.events.changeProps', 'Properties edited' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.events.changeACL', 'Permissions edited' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.events.changeOwner', 'Change in ownership' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.events.changeLocation', 'Location edited' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.events.lockCheckout', 'Document locked or checked out' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.events.unlock', 'Document unlocked' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Subscription', 'Subscription.events', 'The DocuShare events to which to subscribe. When a subscribed event occurs, DocuShare sends an email message, runs a script, or launches a workflow, depending on the choice selected in the notification_action property.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.period', 'Period' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.period.Immediate', 'Immediate' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.period.Daily', 'Daily' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.period.Weekly', 'Weekly' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Subscription', 'Subscription.period', 'The time period at which to provide notification when an event of interest occurs: Immediate provides notification immediately after the event occurs. Daily provides notification in a daily summary report. Weekly provides notification in a weekly summary report.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.recipient_activity', 'Include Recipient Activity' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.recipient_activity.true', 'Yes' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.recipient_activity.false', 'No' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Subscription', 'Subscription.recipient_activity', 'Notifies the user whose action caused the subscription notification. Setting this property to No prevents the user from receiving notification about an action he or she made.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.notification_action', 'Notification Action' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.notification_action.email', 'Send Email' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.notification_action.script', 'Run Script' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.notification_action.workflow', 'Launch Workflow' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Subscription', 'Subscription.notification_action', 'Specifies whether the action to be taken when the subscribed event occurs should be send email, run a script, or launch a workflow.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.script', 'Script' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Subscription', 'Subscription.script', 'The name of the script file or the string that invokes the script. If you are using a script file, it must be located on the server in the central site extensions directory defined by com.xerox.docushare.extensions.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.script_data', 'Script Data' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Subscription', 'Subscription.script_data', 'Any string value to be passed to the Subscription script when it is called.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.sender', 'Sender' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.sender.true', 'Admin' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.sender.false', 'Owner' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Subscription', 'Subscription.sender', 'The username that appears in the email message From field.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.subscription_scope', 'Notification Applies To' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.subscription_scope.allLevels', 'This container and all levels of contents' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.subscription_scope.oneLevel', 'This container and immediate contents' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Subscription', 'Subscription.subscription_scope', 'Specifies how to apply the notification to the collection and its contents. <b>This container and all levels of contents</b> applies the notification to the collection and all of the objects under it. When the subscribed-to change occurs to any one of the collection''s objects, DocuShare performs the notification''s chosen action, sending email, running a script, or initiating a workflow. <b>This container and immediate contents</b> applies the notification to the collection and only its first nested level of objects. For example, if a collection contains several objects and a subcollection, DocuShare performs the notification action when a change occurs to any of the objects and the subcollection; it does not when a change occurs to an object in the subcollection.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.workflow_name', 'Workflow Name' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Subscription', 'Subscription.workflow_name', 'A unique name that identifies the workflow to be run.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.workflow_data', 'Workflow Data' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Subscription', 'Subscription.workflow_data', 'Instance data to be used by the workflow when it is initiated by this subscription.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.rulesEnabled', 'Enabled' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.rulesEnabled.true', 'Yes' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.rulesEnabled.false', 'No' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Subscription', 'Subscription.rulesEnabled', 'Indicates whether this content rule or notification is enabled to run.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.rulesStarts', 'Content Rule Recent Starts' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Subscription', 'Subscription.rulesStarts', 'The most recent starting times for content rules run by this subscription.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'SavedQuery', 'SavedQuery.query_string', 'Query String' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'SavedQuery', 'SavedQuery.query_string', 'An XML representation of the query presented by SavedQuery.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Event', 'Event.year', 'Year' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Event', 'Event.year', 'Specify the year for this event.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Event', 'Event.month', 'Month' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Event', 'Event.month', 'Specify the month for this event.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Event', 'Event.day', 'Day' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Event', 'Event.day', 'Specify the day for this event.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Event', 'Event.has_time', 'Has Time' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Event', 'Event.has_time', 'Specify whether this Event is for a certain time on this day.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Event', 'Event.has_time.true', 'Yes' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Event', 'Event.has_time.false', 'No' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Event', 'Event.start_time', 'Start Time' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Event', 'Event.start_time', 'Specify the start time for this event.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Event', 'Event.end_time', 'End Time' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Event', 'Event.end_time', 'Specify the end time for this event.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Event', 'Event.num_repeat', 'Number of Repeats' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Event', 'Event.num_repeat', 'For an event that occurs more than once, the number of occurrences.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Event', 'Event.repeat', 'Repeat' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Event', 'Event.repeat.None', 'None' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Event', 'Event.repeat.Daily', 'Daily' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Event', 'Event.repeat.Weekly', 'Weekly' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Event', 'Event.repeat.Every_2_Weeks', 'Every 2 Weeks' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Event', 'Event.repeat.Monthly_By_Date', 'Monthly By Date' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Event', 'Event.repeat.Yearly', 'Yearly' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Event', 'Event.repeat', 'For an event that occurs more than once, the frequency of occurrences.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Event', 'Event.exclusions', 'Exclusions' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Event', 'Event.exclusions', '(Internal property) Which ordinal events in a series Event have been deleted.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Calendar', 'Calendar.default_scale', 'Default View' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Calendar', 'Calendar.default_scale.true', 'Month' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Calendar', 'Calendar.default_scale.false', 'Week' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Calendar', 'Calendar.default_scale', 'Displays the calendar as a series of individual months or individual weeks each time the calendar is opened. Once open, the calendar view can be changed.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'MailMessage', 'MailMessage.from', 'From' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'MailMessage', 'MailMessage.from', 'The sender of the message.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'MailMessage', 'MailMessage.subject', 'Subject' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'MailMessage', 'MailMessage.subject', 'The subject line of the message.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'MailMessage', 'MailMessage.body', 'Message' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'MailMessage', 'MailMessage.body', 'The body of the message.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'MailMessage', 'MailMessage.postedDate', 'Sent' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'MailMessage', 'MailMessage.postedDate', 'The date and time the message was posted.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'MailMessage', 'MailMessage.received', 'Received' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'MailMessage', 'MailMessage.received', 'The date and time the message was received.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'MailMessage', 'MailMessage.messageID', 'Message-ID' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'MailMessage', 'MailMessage.messageID', 'A unique identifier for the message, formatted according to the RFC822 standard.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'MailMessage', 'MailMessage.contentType', 'Content-Type Header' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'MailMessage', 'MailMessage.contentType', 'Header that describes the MIME type and content encoding of the message body. For example, Content-Type: text/plain; charset=ISO-8859-1.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'MailMessage', 'MailMessage.to', 'To' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'MailMessage', 'MailMessage.to', 'One or more primary recipients of the message.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'MailMessage', 'MailMessage.cc', 'Cc' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'MailMessage', 'MailMessage.cc', 'One or more additional recipients of the message.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'MailMessage', 'MailMessage.references', 'References' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'MailMessage', 'MailMessage.references', 'The sequence of references, usually Message-IDs of the other mail messages to which this message refers.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'MailMessage', 'MailMessage.headers', 'Internet Headers' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'MailMessage', 'MailMessage.headers', 'The sequence of all of the message headers, formatted according to the RFC822 standard. The headers specify the message recipient, the message subject, the sent date, and other information about the message or its handling.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'MailMessage', 'MailMessage.size', 'Size' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'MailMessage', 'MailMessage.size', 'Size, in bytes, of the message body.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'MailMessage', 'MailMessage.inReplyTo', 'In-Reply-To' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'MailMessage', 'MailMessage.inReplyTo', 'If the mail message is a reply to another message, optionally the Message-ID of the replied-to message.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'MailMessage', 'MailMessage.replyTo', 'Reply-To' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'MailMessage', 'MailMessage.replyTo', 'Email address to which a reply should be sent.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'MailMessage', 'MailMessage.originally_signed', 'Originally Signed' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'MailMessage', 'MailMessage.originally_signed', 'Indicates whether or not the original mail message was digitally signed.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'MailMessage', 'MailMessage.originally_signed.true', 'Yes' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'MailMessage', 'MailMessage.originally_signed.false', 'No' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'MailMessage', 'MailMessage.originally_encrypted', 'Originally Encrypted' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'MailMessage', 'MailMessage.originally_encrypted', 'Indicates whether or not the original mail message was encrypted' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'MailMessage', 'MailMessage.originally_encrypted.true', 'Yes' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'MailMessage', 'MailMessage.originally_encrypted.false', 'No' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Workspace', 'Workspace.layout', 'Layout specification' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Workspace', 'Workspace.layout', 'A specification of the layout of the workspace display, in XML format' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Workspace', 'Workspace.emailAlias', 'Email Alias' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Workspace', 'Workspace.emailAlias', 'A unique name that can be used as the recipient of an email message.  The name must follow your email application''s conventions; for example, no spaces between words.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Workspace', 'Workspace.iconFilename', 'Icon Filename' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Workspace', 'Workspace.iconFilename', 'The filename of the icon to be used for this workspace.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Weblog', 'Weblog.xmlFields', 'XML Fields' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Weblog', 'Weblog.xmlFields', 'A specification of the fields of the weblog display, in XML format' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Weblog', 'Weblog.xmlTemplates', 'XML Templates' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Weblog', 'Weblog.xmlTemplates', 'Initial start templates' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Weblog', 'Weblog.emailAlias', 'Email Alias' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Weblog', 'Weblog.emailAlias', 'A unique name that can be used as the recipient of an email message.  The name must follow your email application''s conventions; for example, no spaces between words.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Weblog', 'Weblog.isModerated', 'Moderated' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Weblog', 'Weblog.isModerated.true', 'Yes' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Weblog', 'Weblog.isModerated.false', 'No' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Weblog', 'Weblog.isModerated', 'Indicates whether this weblog is moderated.  Additions to a moderated weblog must be approved before they appear in the contents.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'WeblogEntry', 'WeblogEntry.xmlFields', 'Weblog Entry' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'WeblogEntry', 'WeblogEntry.xmlFields', 'A specification of the fields of the weblog entry display, in XML format' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'WeblogEntry', 'WeblogEntry.approval_state', 'Approval Status' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'WeblogEntry', 'WeblogEntry.approval_state.toBeApproved', 'Not Yet Approved' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'WeblogEntry', 'WeblogEntry.approval_state.rejected', 'Rejected' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'WeblogEntry', 'WeblogEntry.approval_state.resubmitted', 'Resubmitted' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'WeblogEntry', 'WeblogEntry.approval_state.approved', 'Approved' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'WeblogEntry', 'WeblogEntry.approval_state', 'Indicates the approval status of this weblog entry.  Additions to an unmoderated weblog are automatically ''Approved''.  Additions to a moderated weblog must be approved by a weblog moderator.  The entry starts as ''Not Yet Approved'', may be ''Rejected'', and may subsequently be ''Resubmitted'' for approval again.  When approved, its status becomes ''Approved''.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Wiki', 'Wiki.xmlFields', 'XML Fields' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Wiki', 'Wiki.xmlFields', 'A specification of the fields of the wiki display, in XML format' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Wiki', 'Wiki.xmlTemplates', 'XML Templates' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Wiki', 'Wiki.xmlTemplates', 'Initial start templates' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'WikiPage', 'WikiPage.xmlFields', 'Wiki Page' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'WikiPage', 'WikiPage.xmlFields', 'A specification of the fields of the wiki page display, in XML format' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Space', 'Space.spaceName', 'Space Name' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Space', 'Space.spaceName', 'The name of the space. Since the space name can appear in URLs, it should contain only characters which are valid in a URL.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Space', 'Space.spaceSettings', 'Space Settings' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Space', 'Space.spaceSettings', 'An XML document containing settings defined for the space.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Space', 'Space.classNames', 'Class Names' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Space', 'Space.classNames', 'The object classes from which objects may be created in this space.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'DocAnnotation', 'DocAnnotation.annotationBody', 'Annotation Body' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'DocAnnotation', 'DocAnnotation.annotationBody', 'The annotation data, in XML format' );

INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '0', 'Content Accessed' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '0', 'The tracking operation performed when the content of a document is retrieved.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '1', 'Property Changed' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '1', 'The tracking operation performed when properties of an object are changed.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '2', 'Collection Content Viewed' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '2', 'The tracking operation performed when the contents of a Collection or Collection clone are enumerated.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '3', 'Owner Changed' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '3', 'The tracking operation performed when the owner of a document is changed.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '5', 'Login' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '5', 'The tracking operation performed when a user or application logs in to DocuShare.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '6', 'Object Deleted' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '6', 'The tracking operation performed when an object is deleted.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '7', 'Object Expunged' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '7', 'The tracking operation performed when an object is expunged.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '8', 'Document Locked' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '8', 'The tracking operation performed when a Document or Document clone is locked.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '9', 'Document Version Added' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '9', 'The tracking operation performed when a version is added to a Document or Document clone.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '10', 'Object Created' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '10', 'The tracking operation performed when a new object is created, for example a new Collection or User or Document.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '11', 'Object Added to Container' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '11', 'The tracking operation performed when an object is added to a container, for example a Document which was added to a Collection during a copy or move.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '12', 'Object Removed from Container' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '12', 'The tracking operation performed when an object is removed from a container, for example a Document which was removed from a Collection as part of a move.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '13', 'Operation Failed' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '13', 'The tracking operation marking the failure of an operation.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '14', 'Permissions Changed by Modify' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '14', 'The tracking operation performed when an object''s ACL is modified to add or remove access for a user or group, or to add or remove permissions for a user or group already in the ACL.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '15', 'Permissions Changed by Replace' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '15', 'The tracking operation performed when an object''s ACL is replaced.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '16', 'Permissions Changed by Link Change' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '16', 'The tracking operation performed when an object''s ACL is modified as a result of a link with another object in a link relationship which affects ACL.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '17', 'Permissions Changed by Change Owner' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '17', 'The tracking operation performed when an object''s ACL is modified as a result of an owner change operation.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '18', 'Permissions Changed by Merge User' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '18', 'The tracking operation performed when an object''s ACL is modified as a result of a merge user operation which merged one of the users in the ACL.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '19', 'Permissions Changed by Declare Record' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '19', 'The tracking operation performed when an object''s ACL is modified as a result of having the object declared as a record.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '20', 'Permissions Changed by Undeclare Record' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '20', 'The tracking operation performed when an object''s ACL is modified as a result of having the object undeclared, making it no longer a record.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '21', 'WikiPage History Added' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '21', 'The tracking operation performed when properties of a WikiPage object which are kept in its history are changed.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '22', 'Object Published' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '22', 'The tracking operation performed when a draft is published or and object added to a moderated container is approved.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '23', 'Document Exported' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '23', 'The tracking operation performed when a Document is exported.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '24', 'Member Added to Group' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '24', 'The tracking operation performed when a principal is added to a Group.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '25', 'Member Removed from Group' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '25', 'The tracking operation performed when a principal is removed from a Group.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '26', 'History Tracking Option Changed' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '26', 'The tracking operation performed when a the site configuration was changed to enable or disable tracking operations.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '27', 'Container Had Object Added' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '27', 'The tracking operation performed when a container has an object added, such as a Collection having a Document added to it.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '28', 'Container Had Object Removed' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '28', 'The tracking operation performed when a container has an object removed, such as a Collection having a Document removed from it.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '29', 'Custom Event' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '29', 'The tracking operation performed when an application program performs a custom action.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '30', 'Failed Login' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '30', 'The user tried to log in but failed.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '500', 'Logout' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '500', 'The tracking operation performed when a user or application logs out of DocuShare.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '501', 'Email Sent' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '501', 'The tracking operation performed when email is posted.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '502', 'Workflow Started' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '502', 'The tracking operation performed when when a workflow is initiated.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '503', 'Content Rule Triggered' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '503', 'The tracking operation performed when when a content rule is triggered.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '504', 'Workflow Changed' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '504', 'The tracking operation performed when a workflow is changed or deleted.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Collection', 'Collection.attachmentsOnly', 'Attachments Only' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Collection', 'Collection.attachmentsOnly', 'For email messages that include attachments, uploads each attachment as a separate document. The email message is not added to DocuShare.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Collection', 'Collection.attachmentsOnly.true', 'True' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Collection', 'Collection.attachmentsOnly.false', 'False' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Workspace', 'Workspace.attachmentsOnly', 'Attachments Only' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Workspace', 'Workspace.attachmentsOnly', 'For email messages that include attachments, uploads each attachment as a separate document. The email message is not added to DocuShare.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Workspace', 'Workspace.attachmentsOnly.true', 'True' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Workspace', 'Workspace.attachmentsOnly.false', 'False' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'MailMessage', 'MailMessage.signed_by', 'Signed By' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'MailMessage', 'MailMessage.signed_by', 'The email address designated in the digital certificate which was used to sign the original email.' );

