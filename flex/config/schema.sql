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

CREATE TABLE AclID_table(acl_id			BIGINT NOT NULL,
					 principal_id       BIGINT NOT NULL,
					 reader             NUMERIC(1) NOT NULL,
					 writer             NUMERIC(1) NOT NULL,
					 manager            NUMERIC(1) NOT NULL,
					 readLinked         NUMERIC(1) NOT NULL,
					 readHistory        NUMERIC(1) NOT NULL,
					 writeLinked        NUMERIC(1) NOT NULL
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
                              Object_title              NVARCHAR(256),
                              Object_webdav_title       NVARCHAR(356),    
                              Object_summary            NVARCHAR(1024),
                              Object_description        ntext,
                              Object_create_date        DATETIME, 
                              Object_modified_date      DATETIME,
                              Object_keywords           NVARCHAR( 1024 ),
                              Object_space              NVARCHAR( 64 ),
                              Object_Locale             NVARCHAR( 32 ),
                              Object_readyForDeclare    NUMERIC(1),
                              Document_author           NVARCHAR( 128 ),
                              Document_highest_version_used     INTEGER,
                              Document_original_file_name NVARCHAR( 256 ),
                              Document_add_as_draft     NUMERIC(1),
                              Document_canAddVersions   NUMERIC(1),
                              Document_isInteract       NUMERIC(1),
                              Docum_autoMovePreferredVersion NUMERIC(1),
                              Document_max_versions     INTEGER,
                              content_size              NUMERIC( 19, 0 ),
                              Version_revision_comments NVARCHAR( 1024 ),
                              Version_version_number    INTEGER,
                              Rendition_generated       NUMERIC(1),
                              Rendition_rendition_type  NVARCHAR( 512 ),
                              Remote_DN                 NVARCHAR( 256 ),
                              domain_name               NVARCHAR( 128 ),
                              User_username             NVARCHAR( 128 ),
                              User_last_name            NVARCHAR( 64 ),
                              User_first_name           NVARCHAR( 64 ),
                              User_userLevel            NVARCHAR( 32 ),
                              User_isActive             NUMERIC(1),
                              User_changePasswordAtLogin NUMERIC(1),
                              User_passwordExpiration   DATETIME,
                              User_failedLoginCount     INTEGER,
                              Space_spaceName           NVARCHAR( 64 )
                              );

CREATE TABLE DSProp_table( handle_class NUMERIC(6), handle_index INTEGER,
                           handle_id BIGINT, 
                           isPrivate NUMERIC(1), 
                           user_handle_class NUMERIC(6), user_handle_index INTEGER, 
                           propName NVARCHAR( 64 ), 
                           type NUMERIC(4), 
                           propdesc_ID NUMERIC(6),
                           ordering INTEGER, 
                           intBoolVal INTEGER, 
                           textVal ntext, 
                           floatVal FLOAT, 
                           dateVal DATETIME, 
                           stringVal NVARCHAR( 4000 ),
						   bigDecimalVal NUMERIC( 26, 7 ),
						   referenceVal BIGINT );

CREATE TABLE CE_table ( ce_key                  BIGINT NOT NULL, 
                        ce_order                INTEGER NOT NULL,
                        originalName            NVARCHAR( 512 ),
                        contentRepoHandle       NVARCHAR( 128 ),
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

CREATE TABLE userInfo_table( handle_id  BIGINT        NOT NULL,
                             username   NVARCHAR( 128 ) NOT NULL, 
                             domain     NVARCHAR( 128 ) NOT NULL, 
                             userLevel  NVARCHAR( 32 ) NOT NULL,
                             isActive   NUMERIC(1) );

CREATE TABLE careAboutTable( feature VARCHAR( 32 ), active NUMERIC(1) NOT NULL );

CREATE TABLE accessTable( handle_id   BIGINT, 
                          user_id     BIGINT, 
                          op          NUMERIC(4),
                          opDate      DATETIME,
                          commentText NTEXT,
                          changeData  NTEXT );

CREATE TABLE NextID_table ( class_name  VARCHAR( 64 ) UNIQUE,
                           next_handle  INTEGER );
CREATE TABLE StringTable ( locale           VARCHAR( 32 ),
                           stringType       VARCHAR( 32 ),
                           applicableClass  VARCHAR( 64 ),
                           stringKey        VARCHAR( 128 ),
                           stringValue      NVARCHAR( 3850 )
                         );
CREATE TABLE InstanceStringTable ( locale   VARCHAR( 64 ),
                           stringType       VARCHAR( 32 ),
                           handle_id        BIGINT,
                           isPrivate        INTEGER, 
                           user_handle_id   BIGINT, 
                           stringKey        VARCHAR( 64 ),
                           stringValue      NVARCHAR( 3850 )
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
CREATE TABLE Propdesc_table( name       VARCHAR( 130 ),
                             type       INTEGER,
                             className  VARCHAR( 64 ),
                             mixinName  VARCHAR( 64 ),
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
                             validationString ntext, 
                             height     INTEGER,
                             inputStyle VARCHAR( 32 ),
                             defaultValue ntext,
                             minValue   VARCHAR( 32 ),
                             maxValue   VARCHAR( 32 ),
                             valPrecision  INTEGER,
                             valScale      INTEGER,
                             possibleValues ntext,
                             alwaysWellFormedXML NUMERIC(1),
                             propdesc_ID NUMERIC(6),
                             isInstanceProperty INTEGER,
                             propdesc_ID_refCount NUMERIC(6),
                             xmlIndexableValuePath text,
                             isPrivate  INTEGER,
                             dateAccuracy VARCHAR( 32 )
                          );
CREATE TABLE Linkdesc_table( name                   VARCHAR( 64 ),
                             link_id                INTEGER, 
                             system                 INTEGER,
                             readOnly               INTEGER,
                             requiredBySource       INTEGER,
                             multiSources           INTEGER,
                             multiDestinations      INTEGER,
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

CREATE TABLE mixinClassMap( mixinName VARCHAR( 64 ),
                            className VARCHAR( 64 ) );

CREATE TABLE cameFromTable ( localHandleID  BIGINT NOT NULL,
                             remoteHandleID BIGINT NOT NULL,
                             serverIndex    NUMERIC(6) NOT NULL,
                             lastRefresh    DATETIME
                           );

CREATE TABLE siteIndexTable ( serverIDString NVARCHAR( 2000 ),
                              siteType VARCHAR( 32 ), 
                              friendlyName NVARCHAR( 256 ),
                              baseResource NVARCHAR( 1024 ),
                              connectionInfo NTEXT, 
                              serverIndex    NUMERIC(6) NOT NULL,
                              moderatorIndex NUMERIC(6) NOT NULL
                            );

CREATE TABLE FedPropMap( localClassName VARCHAR( 32 ),   
						 localPropName VARCHAR( 32 ), 
						 serverIDString VARCHAR( 512 ), 
						 remoteClassName VARCHAR( 256 ), 
						 remotePropNameSearch VARCHAR( 256 ),
						 remotePropNameField VARCHAR( 256 ) );

CREATE TABLE federationApplicants ( serverIDString  NVARCHAR( 2000 ) NOT NULL,
                                    moderatorIndex  NUMERIC(6) NOT NULL,
                                    passcode        NVARCHAR( 32 ) NOT NULL,
                                    applicationTime DATETIME
                                  );

CREATE TABLE backgroundJob_table( JobID BIGINT,       
                                  JobParameters ntext, 
                                  createTime DATETIME,   
                                  stateTime DATETIME,    
                                  lastException ntext,
                                  state INTEGER,   
								  stateDetail INTEGER,    
                                  jobType INTEGER,
                                  description ntext,
                                  userHandle BIGINT );

CREATE TABLE nxscope ( handle_class NUMERIC(6),
                       handle_index INTEGER,
                       scope_class NUMERIC(6),
                       scope_index INTEGER
                     );

CREATE TABLE Ingester_Recovery( name VARCHAR( 1024 ), batchID VARCHAR( 1024 ), uniqueID VARCHAR( 1024 ), refCount INTEGER );

CREATE TABLE indexRecovery( handleString VARCHAR( 120 ), messageString VARCHAR( 1024 ), stackTraceString VARCHAR( 1024 ), longDate BIGINT );

CREATE TABLE simpleDocClassMappings( docClassName VARCHAR( 32 ), simpleVersionClassName VARCHAR( 64 ), simpleRenditionClassName VARCHAR( 64 ) );

CREATE TABLE eventTable ( queueName  VARCHAR( 128 ),       
                          eventOrder bigint,           
                          batchID    VARCHAR( 128 ),
                          seqNo      NUMERIC( 6 )
                        );

CREATE TABLE eventObjectTable ( eventObj   NTEXT,
                          batchID    VARCHAR( 128 ),
                          seqNo      NUMERIC( 6 ),
                          refCount   INTEGER
                        );

CREATE TABLE NamedListeners( queueName  VARCHAR( 128 ), 
                             eventTypes NUMERIC( 10 ) );

CREATE TABLE forwardedEventTable ( queueName  VARCHAR( 128 ),       
                          eventObj   NTEXT,                 
                          eventOrder bigint,           
                          batchID    VARCHAR( 128 ),
                          seqNo      NUMERIC( 6 ),
                          isDaily    NUMERIC( 1 )
                        );

CREATE TABLE forwardedSubsTable ( queueName  VARCHAR( 128 ),
                                  batchID VARCHAR( 128 ),
                                  subscription_id BIGINT,
                                  isDaily NUMERIC( 1 )
                                );

CREATE TABLE subscription_table( subscription BIGINT,
                                 publisher BIGINT,
                                 immediateOnly NUMERIC(1),
                                 eventTypes BIGINT,
                                 addVersionOnly NUMERIC(1)
                               );

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
        
create table classpreferences(applicationName varchar( 512 ), className varchar(32), preferenceName varchar(512), preferenceValue NTEXT, user_id BIGINT);

CREATE TABLE instancePreferenceTable( 
	handle_id BIGINT NOT NULL, 
	applicationName VARCHAR( 512 ), 
	preferenceName VARCHAR( 512 ), 
	isPrivate NUMERIC(1),
	user_id BIGINT,
	preferenceValue NTEXT
 );

CREATE TABLE contentChangeTable(
	change_id BIGINT UNIQUE IDENTITY NOT NULL,
	handle_id BIGINT NOT NULL,
	propName VARCHAR( 256 ) NOT NULL,
	changeType NUMERIC( 1 ) NOT NULL,
	uri VARCHAR( 1024 ) NOT NULL,
	modified_date DATETIME NOT NULL 
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

INSERT INTO Propdesc_table VALUES( 'title',              10, 'Object', null,        1, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0, 1, 256, N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'webdav_title',       10, 'Object', null,        1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 356, N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'description',        11, 'Object', null,        1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0,   N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'summary',            10, 'Object', null,        1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 1024,N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'isRoot',              3, 'Object', null,        1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0,   '', '', 0, N'RADIO_BUTTONS', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'isRecord',            3, 'Object', null,        1, 0, 0, 0, 1, 0, 1, 1, 0, 0, 1, 1, 0,   '', '', 0, N'RADIO_BUTTONS', N'false', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'readyForDeclare',     3, 'Object', null,        1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0,   '', '', 0, N'RADIO_BUTTONS', N'false', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'rm_instance_handle', 10, 'Object', null,        1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1024,N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'keywords',           10, 'Object', null,        1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 1024,N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'create_date',         4, 'Object', null,        1, 1, 0, 0, 1, 0, 1, 1, 0, 0, 0, 1, 0,   '', '', 0, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, N'DATE_TIME' );
INSERT INTO Propdesc_table VALUES( 'modified_date',       4, 'Object', null,        1, 1, 0, 0, 1, 0, 1, 1, 0, 0, 0, 1, 0,   '', '', 0, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, N'DATE_TIME' );
INSERT INTO Propdesc_table VALUES( 'expiration_date',     4, 'Object', null,        1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, N'DATE_TIME' );
INSERT INTO Propdesc_table VALUES( 'locale',             10, 'Object', null,        1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 32,  N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'client_data',        10, 'Object', null,        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1024,N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'routing_template_id', 1, 'Object', null,        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'copiedFrom',         10, 'Object', null,        1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 512, N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'lastSynchronized',    4, 'Object', null,        1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, N'DATE_TIME' );
INSERT INTO Propdesc_table VALUES( 'space',              10, 'Object', null,        1, 1, 0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 64,  N'TEXT', '', 1, '', ' ','', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'domain',             10, 'User', null,          1, 0, 0, 1, 1, 0, 1, 0, 0, 0, 1, 1, 128, N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'username',           10, 'User', null,          1, 0, 0, 1, 1, 0, 1, 0, 0, 0, 1, 1, 128, N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'password',           13, 'User', null,          1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 72,  N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'last_name',          10, 'User', null,          1, 0, 0, 1, 1, 0, 1, 0, 1, 0, 0, 1, 64,  N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'last_whats_new',      4, 'User', null,          1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0,   '', '', 0, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, N'DATE_TIME' );
INSERT INTO Propdesc_table VALUES( 'first_name',         10, 'User', null,          1, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 1, 64,  N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'email',              14, 'User', null,          1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 128, N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'email_format',        3, 'User', null,          1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, N'RADIO_BUTTONS', N'true', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'last_login',          4, 'User', null,          1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, N'DATE_TIME' );
INSERT INTO Propdesc_table VALUES( 'mailstop',           10, 'User', null,          0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 128, N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'phone',              10, 'User', null,          0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 128, N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'home_page',          15, 'User', null,          0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 256, N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'isActive',            3, 'User', null,          1, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 1, 0,   '', '', 0, N'RADIO_BUTTONS', N'true', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'remote_DN',          10, 'User', null,          1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 256, N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'routing_choice',     20, 'User', null,          1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, N'SELECT_MENU', N'email','', '', 0, 0, 'none,email', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'routingIDs',         11, 'User', null,          1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,   N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'pagingIncrement',     1, 'User', null,          1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, '', '20', '1', '1000', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'javascriptOn',        3, 'User', null,          1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, N'RADIO_BUTTONS', N'true', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'attachmentAsURL',     3, 'User', null,          1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, N'RADIO_BUTTONS', N'false', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'isInteractEnabled',   3, 'User', null,          1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0,   '', '', 0, N'RADIO_BUTTONS', N'false', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'isRMContributorEnabled', 3, 'User', null,       1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0,   '', '', 0, N'RADIO_BUTTONS', N'false', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'isRMCoordinatorEnabled', 3, 'User', null,       1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0,   '', '', 0, N'RADIO_BUTTONS', N'false', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'isRMAdminEnabled',       3, 'User', null,       1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0,   '', '', 0, N'RADIO_BUTTONS', N'false', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'canDeclareIfContributor',3, 'User', null,       1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0,   '', '', 0, N'RADIO_BUTTONS', N'false', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'changePasswordAtLogin',  3, 'User', null,       1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0,   '', '', 0, N'RADIO_BUTTONS', N'false', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'failedLoginCount',    1, 'User', null,          1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0,   '', '', 0, '', '0', '0', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'passwordExpiration',  4, 'User', null,          1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0,   '', '', 0, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, N'DATE_TIME' );
INSERT INTO Propdesc_table VALUES( 'language',           10, 'User', null,          1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 32,  N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'characterCode',      10, 'User', null,          1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 32,  N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'noSubscriptionNotifyFor',20,'User', null,       1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, N'SELECT_MENU', '', '', '', 0, 0, N'anyChange,add,addNewVersion,remove,changeProps,changeACL,changeOwner,changeLocation,lockCheckout,unlock', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'noEmailAgentNotifyFor',  20,'User', null,       1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, N'SELECT_MENU', '', '', '', 0, 0, N'uploadSuccess,uploadFailure,forwarded', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'alternateEmail',     10, 'User', null,          1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 256, N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'layoutDefaults',     21, 'User', null,          1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,   N'TEXT', '', 1, '', '', '', '', 0, 0, '', 1,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'userLevel',          20, 'User', null,          1, 0, 0, 1, 1, 0, 1, 1, 0, 0, 1, 1, 0,   '', '', 0, N'SELECT_MENU', N'cpx', '', '', 0, 0, N'anonymous,minimum,dsLimited,imageManager,dsFull,cpx', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'homeSpace',          10, 'User', null,          1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 64,  N'TEXT', '', 1, '', ' ', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'useRichTextEdit',     3, 'User', null,          1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, N'RADIO_BUTTONS', N'true', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'docCountQuota',       1, 'User', null,          1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0,   '', '', 0, '', '-2', '-2', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'contentSizeMBQuota',  1, 'User', null,          1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0,   '', '', 0, '', '-2', '-2', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'domain',             10, 'Group', null,         1, 0, 0, 1, 1, 0, 1, 0, 0, 0, 1, 1, 128, N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'remote_DN',          10, 'Group', null,         1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 256, N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'emailAlias',         10, 'Group', null,         1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 128, N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'replyToGroup',        3, 'Group', null,         1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, N'RADIO_BUTTONS', N'false', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'confirmEmailReceipt', 3, 'Group', null,         1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, N'RADIO_BUTTONS', N'false', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'external_recipients',10, 'Group', null,         1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 2000,N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'spamControl',        20, 'Group', null,         1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, N'SELECT_MENU', N'anyone', '', '', 0, 0, N'anyone,onlyDSUser,onlyGroupMember', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'docCountQuota',       1, 'Group', null,         1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0,   '', '', 0, '', '-2', '-2', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'contentSizeMBQuota',  1, 'Group', null,         1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0,   '', '', 0, '', '-2', '-2', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'logo',               10, 'Collection', null,    1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 256, N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'bg_image',           10, 'Collection', null,    1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 256, N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'sort_order',         20, 'Collection', null,    1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, N'SELECT_MENU', N'TypeAndTitle', '', '', 0, 0, N'TypeAndTitle,TypeAndDate,Date,Title,TitleReversed,DateAscending', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'view_format',        20, 'Collection', null,    1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, N'SELECT_MENU', N'DetailedListing', '', '', 0, 0, N'DetailedListing,Images,Email', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'add_as_draft',        3, 'Collection', null,    1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0,   '', '', 0, N'RADIO_BUTTONS', 'false', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'emailAlias',         10, 'Collection', null,    1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 128, N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'spamControl',        20, 'Collection', null,    1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, N'SELECT_MENU', N'anyone', '', '', 0, 0, N'anyone,onlyDSUser', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'logo',               10, 'BulletinBoard', null, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 256, N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'bg_image',           10, 'BulletinBoard', null, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 256, N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'expire',             20, 'BulletinBoard', null, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, N'SELECT_MENU', '10', '', '', 0, 0, '0,1,2,3,4,5,6,7,8,9,10', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'showHierarchy',       3, 'BulletinBoard', null, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, N'RADIO_BUTTONS', N'true', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'url',                15, 'URL', null,           1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 500, N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'displayInNewWindow',  3, 'URL', null,           1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, N'RADIO_BUTTONS', N'false', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'author',             10, 'Document', null,      0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 128, N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'content_type',       10, 'Document', null,      1, 0, 0, 0, 1, 0, 1, 1, 0, 0, 0, 1, 512, N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'size',               23, 'Document', null,      1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0,   '', '', 0, '', '0', '0', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'max_versions',        1, 'Document', null,      1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0,   '', '', 0, '', '4', '1', '10000', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'highest_version_used',1, 'Document', null,      1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0,   '', '', 0, '', '0', '0', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'abstract',           11, 'Document', null,      1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,   N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'original_file_name', 10, 'Document', null,      1, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 256, N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'add_as_draft',        3, 'Document', null,      1, 0, 0, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0,   '', '', 0, N'RADIO_BUTTONS', N'false', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'canAddVersions',      3, 'Document', null,      1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0,   '', '', 0, N'RADIO_BUTTONS', N'true', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'isInteract',          3, 'Document', null,      1, 0, 0, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0,   '', '', 0, N'RADIO_BUTTONS', N'false', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'autoMovePreferredVersion', 3,'Document', null,  1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0,   '', '', 0, N'RADIO_BUTTONS', N'true', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'isPlaceholder',       3, 'Document', null,      1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, N'RADIO_BUTTONS', N'false', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'cfSpecialWords',     10, 'Document', null,      1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 2000,N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0,'', 0, '' );
INSERT INTO Propdesc_table VALUES( 'cfCopyID',           10, 'Document', null,      1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 256, N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0,'', 0, '' );
INSERT INTO Propdesc_table VALUES( 'version_number',      1, 'Version', null,       1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0,   '', '', 0, '', '0', '0', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'revision_comments',  10, 'Version', null,       1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 1024,N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'abstract',           11, 'Version', null,       1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,   N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'rendition_type',     10, 'Rendition', null,     1, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0, 1, 512, N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'rendition_detail',   10, 'Rendition', null,     1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1024,N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'size',               23, 'Rendition', null,     1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0,   '', '', 0, '', '0', '0', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'generated',           3, 'Rendition', null,     1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, N'RADIO_BUTTONS', N'false', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'external_recipients',10, 'Subscription', null,  1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2000,N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'events',             20, 'Subscription', null,  1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, N'SELECT_MENU', N'anyChange', '', '', 0, 0, N'anyChange,add,addNewVersion,remove,changeProps,changeACL,changeOwner,changeLocation,lockCheckout,unlock', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'period',             20, 'Subscription', null,  1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, N'SELECT_MENU', N'Immediate', '', '', 0, 0, N'Immediate,Daily,Weekly', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'recipient_activity',  3, 'Subscription', null,  1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, N'RADIO_BUTTONS', N'true', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'notification_action',20, 'Subscription', null,  1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0,   '', '', 0, N'SELECT_MENU', N'email', '', '', 0, 0, N'email,script,workflow', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'script',             10, 'Subscription', null,  1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 256, N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'script_data',        10, 'Subscription', null,  1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 256, N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'sender',              3, 'Subscription', null,  1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, N'RADIO_BUTTONS', N'false', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'subscription_scope', 20, 'Subscription', null,  1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, N'SELECT_MENU', N'oneLevel', '', '', 0, 0, N'allLevels,oneLevel', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'workflow_name',      10, 'Subscription', null,  1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 256, N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'workflow_data',      11, 'Subscription', null,  1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,   N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'rulesEnabled',        3, 'Subscription', null,  1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0,   '', '', 0, N'RADIO_BUTTONS', N'true', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'rulesStarts',         4, 'Subscription', null,  1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, N'DATE_TIME' );
INSERT INTO Propdesc_table VALUES( 'query_string',       11, 'SavedQuery', null,    1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0,   N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'year',                1, 'Event', null,         1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'month',               1, 'Event', null,         1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'day',                 1, 'Event', null,         1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'has_time',            3, 'Event', null,         1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, N'RADIO_BUTTONS', N'true', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'start_time',          1, 'Event', null,         1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, '', '420', '0', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'end_time',            1, 'Event', null,         1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, '', '480', '0', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'num_repeat',          1, 'Event', null,         1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0,   '', '', 0, '', '1', '1', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'repeat',             20, 'Event', null,         1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, N'SELECT_MENU', N'None', '', '', 0, 0, N'None,Daily,Weekly,Every_2_Weeks,Monthly_By_Date,Yearly', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'exclusions',         10, 'Event', null,         1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 64,  N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'default_scale',       3, 'Calendar', null,      1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0,   '', '', 0, N'RADIO_BUTTONS', N'true', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'from',               10, 'MailMessage', null,   1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 256, N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'subject',            10, 'MailMessage', null,   1, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 256, N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'body',               11, 'MailMessage', null,   1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0,   N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'postedDate',          4, 'MailMessage', null,   1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, N'DATE_TIME' );
INSERT INTO Propdesc_table VALUES( 'received',            4, 'MailMessage', null,   1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, N'DATE_TIME' );
INSERT INTO Propdesc_table VALUES( 'messageID',          10, 'MailMessage', null,   1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 256, N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'contentType',        10, 'MailMessage', null,   1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 256, N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'size',                1, 'MailMessage', null,   1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, '', '0', '0', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'to',                 10, 'MailMessage', null,   1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 256, N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'cc',                 10, 'MailMessage', null,   1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 256, N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'references',         10, 'MailMessage', null,   1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 256, N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'headers',            10, 'MailMessage', null,   1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 512, N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'inReplyTo',          10, 'MailMessage', null,   1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 256, N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'replyTo',            10, 'MailMessage', null,   1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 256, N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'originally_signed',   3, 'MailMessage', null,   1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, N'RADIO_BUTTONS', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'originally_encrypted',3, 'MailMessage', null,   1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, N'RADIO_BUTTONS', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'layout',             21, 'Workspace', null,     1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,   N'TEXT', '', 1, '', '', '', '', 0, 0, '', 1,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'emailAlias',         10, 'Workspace', null,     1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 128, N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'iconFilename',       10, 'Workspace', null,     1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 256, N'TEXT', '', 1, '', N'workspace.png', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'xmlFields',          21, 'Weblog', null,        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,   N'TEXT', '', 1, '', '', '', '', 0, 0, '', 1,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'xmlTemplates',       21, 'Weblog', null,        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,   N'TEXT', '', 1, '', '', '', '', 0, 0, '', 1,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'emailAlias',         10, 'Weblog', null,        1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 128, N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'isModerated',         3, 'Weblog', null,        1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0,   '', '', 0, N'RADIO_BUTTONS', N'false', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'xmlFields',          21, 'WeblogEntry', null,   1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,   N'TEXT', '', 1, '', '', '', '', 0, 0, '', 1,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'approval_state',     20, 'WeblogEntry', null,   1, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0,   '', '', 0, N'SELECT_MENU', N'approved', '', '', 0, 0, N'toBeApproved,rejected,resubmitted,approved', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'xmlFields',          21, 'Wiki', null,          1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,   N'TEXT', '', 1, '', '', '', '', 0, 0, '', 1,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'xmlTemplates',       21, 'Wiki', null,          1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,   N'TEXT', '', 1, '', '', '', '', 0, 0, '', 1,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'xmlFields',          21, 'WikiPage', null,      1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,   N'TEXT', '', 1, '', '', '', '', 0, 0, '', 1,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'spaceName',          10, 'Space', null,         1, 1, 0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 2000,N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'spaceSettings',      21, 'Space', null,         1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,   N'TEXT', '', 1, '', '', '', '', 0, 0, '', 1,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'classNames',         10, 'Space', null,         1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 64,  N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'annotationBody',     21, 'DocAnnotation', null, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0,   N'TEXT', '', 1, '', '', '', '', 0, 0, '', 1,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'signed_by',          10, 'MailMessage', null,   0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 256, N'TEXT', '', 1, '', '', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'attachmentsOnly',     3, 'Collection', null,    0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, N'RADIO_BUTTONS', N'false', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );
INSERT INTO Propdesc_table VALUES( 'attachmentsOnly',     3, 'Workspace', null,     0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0,   '', '', 0, N'RADIO_BUTTONS', N'false', '', '', 0, 0, '', 0,0,0,0, '', 0, '' );

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
INSERT INTO NextID_table VALUES( 'db version', 8040 );
INSERT INTO NextID_table VALUES( 'site index', 0 );
INSERT INTO NextID_table VALUES( 'propdesc ID', 0 );
INSERT INTO NextID_table VALUES( 'Job ID', 0 );

INSERT INTO DSObject_table( handle_class, handle_index, handle_id, Object_create_date,        Object_modified_date,      Object_title, User_username, Object_isSystemObj, Object_isDeleted, Object_isRecord, domain_name, User_last_name, User_first_name, User_isActive, User_userLevel, Object_space, Object_Locale )
                     VALUES(           3,            1, 10003,     '2011-05-19 08:10:00.000', '2011-05-19 08:10:00.000', N'Guest',     N'Guest',      1,                  0,                0,               N'DocuShare',N'Guest',       '',              1,             'anonymous',    ' ',          'en' );
INSERT INTO DSObject_table( handle_class, handle_index, handle_id, Object_create_date,        Object_modified_date,      Object_title, User_username, Object_isSystemObj, Object_isDeleted, Object_isRecord, domain_name, User_last_name,       User_first_name, User_isActive, User_changePasswordAtLogin, User_failedLoginCount, User_userLevel, Object_space, Object_Locale )
                     VALUES(           3,            2, 20003,     '2011-05-19 08:10:00.000', '2011-05-19 08:10:00.000', N'admin',     N'admin',      1,                  0,                0,               N'DocuShare',N'Site Administrator','',              1,             0,                          0,                     'cpx',          ' ',          'en' );
INSERT INTO DSObject_table( handle_class, handle_index, handle_id, Object_create_date,        Object_modified_date,      Object_title,          Object_isSystemObj, Object_isDeleted,  Object_isRecord, domain_name, Object_space, Object_Locale )
                     VALUES(           4,            1, 10004,     '2011-05-19 08:10:00.000', '2011-05-19 08:10:00.000', N'Site Administrators',1,                  0,                 0,               N'DocuShare',' ',          'en' );
INSERT INTO DSObject_table( handle_class, handle_index, handle_id, Object_create_date,        Object_modified_date,      Object_title,             Object_isSystemObj, Object_isDeleted, Object_isRecord, domain_name, Object_space, Object_Locale )
                     VALUES(           4,            2, 20004,     '2011-05-19 08:10:00.000', '2011-05-19 08:10:00.000', N'Content Administrators',1,                  0,                0,               N'DocuShare',' ',          'en' );
INSERT INTO DSObject_table( handle_class, handle_index, handle_id, Object_create_date,        Object_modified_date,      Object_title,             Object_isSystemObj, Object_isDeleted, Object_isRecord, domain_name, Object_space, Object_Locale )
                     VALUES(           4,            3, 30004,     '2011-05-19 08:10:00.000', '2011-05-19 08:10:00.000', N'Account Administrators',1,                  0,                0,               N'DocuShare',' ',          'en' );
INSERT INTO DSObject_table( handle_class, handle_index, handle_id, Object_create_date,        Object_modified_date,      Object_title,          Object_isSystemObj, Object_isDeleted, Object_isRecord, domain_name, Object_space, Object_Locale )
                     VALUES(           4,            4, 40004,     '2011-05-19 08:10:00.000', '2011-05-19 08:10:00.000', N'All Users and Guest',1,                  0,                0,               N'DocuShare',' ',          'en' );
INSERT INTO DSObject_table( handle_class, handle_index, handle_id, Object_create_date,        Object_modified_date,      Object_title,             Object_isSystemObj, Object_isDeleted, Object_isRecord, domain_name, Object_space, Object_Locale )
                     VALUES(           4,            5, 50004,     '2011-05-19 08:10:00.000', '2011-05-19 08:10:00.000', N'All Users Except Guest',1,                  0,                0,               N'DocuShare',' ',          'en' );
INSERT INTO DSObject_table( handle_class, handle_index, handle_id, Object_create_date,        Object_modified_date,      Object_title,       Object_isSystemObj, Object_isDeleted, Object_isRecord, domain_name, Object_space, Object_Locale )
                     VALUES(           4,            6, 60004,     '2011-05-19 08:10:00.000', '2011-05-19 08:10:00.000', N'Read-Only Users', 1,                  0,                0,               N'DocuShare',' ',          'en' );
INSERT INTO DSObject_table( handle_class, handle_index, handle_id, Object_create_date,        Object_modified_date,      Object_title,                   Object_isSystemObj, Object_isDeleted, Object_isRecord, domain_name, Object_space, Object_Locale )
                     VALUES(           4,            7, 70004,     '2011-05-19 08:10:00.000', '2011-05-19 08:10:00.000', N'All Users Except Read-Only',  1,                  0,                0,               N'DocuShare',' ',          'en' );

INSERT INTO DSObject_table( handle_class, handle_index, handle_id, Object_create_date,        Object_modified_date,         Object_title,                     Object_isSystemObj, Object_isDeleted, Object_isRecord, Object_isRootElement, Object_webdav_title,              Object_space, Object_Locale, Document_add_as_draft )
                    VALUES(            1,           10, 100001,    '2011-05-19 08:10:00.000', '2011-05-19 08:10:00.000',    N'Initial Top Level Collection A',0,                  0,                0,               1,                    N'Initial Top Level Collection A',' ',          'en',          0 );
INSERT INTO DSObject_table( handle_class, handle_index, handle_id, Object_create_date,        Object_modified_date,         Object_title,                     Object_isSystemObj, Object_isDeleted, Object_isRecord, Object_isRootElement, Object_webdav_title,              Object_space, Object_Locale, Document_add_as_draft )
                    VALUES(            1,           11, 110001,    '2011-05-19 08:10:00.000', '2011-05-19 08:10:00.000',    N'Initial Top Level Collection B',0,                  0,                0,               1,                    N'Initial Top Level Collection B',' ',          'en',          0 );
INSERT INTO DSObject_table( handle_class, handle_index, handle_id, Object_create_date,        Object_modified_date,         Object_title,                     Object_isSystemObj, Object_isDeleted, Object_isRecord, Object_isRootElement, Object_webdav_title,              Object_space, Object_Locale, Document_add_as_draft )
                    VALUES(            1,           12, 120001,    '2011-05-19 08:10:00.000', '2011-05-19 08:10:00.000',    N'Initial Top Level Collection C',0,                  0,                0,               1,                    N'Initial Top Level Collection C',' ',          'en',          0 );
INSERT INTO DSObject_table( handle_class, handle_index, handle_id, Object_create_date,        Object_modified_date,         Object_title,                     Object_isSystemObj, Object_isDeleted, Object_isRecord, Object_isRootElement, Object_webdav_title,              Object_space, Object_Locale, Document_add_as_draft )
                    VALUES(            1,           13, 130001,    '2011-05-19 08:10:00.000', '2011-05-19 08:10:00.000',    N'Initial Top Level Collection D',0,                  0,                0,               1,                    N'Initial Top Level Collection D',' ',          'en',          0 );

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
                  VALUES( 3,            1,            10003,     0,         'password', 13,   0,           0,        N'   ' );
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
                  VALUES( 3,            1,            10003,     0,         'routing_choice', 20,   0,           0,        N'none' );
INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName,      type, propdesc_ID, ordering, intBoolVal ) 
                  VALUES( 3,            1,            10003,     0,         'useRichTextEdit', 3,    0,           0,        1 );

INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName,   type, propdesc_ID, ordering, stringVal ) 
                  VALUES( 3,            2,            20003,     0,         'password', 13,   0,           0,        N'5FA0836F50D7B9775812D831113AE66832A935606E47AD90C928F0A3B5C7F21AF3BF9FB8' );
INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName, type, propdesc_ID, ordering, stringVal ) 
                  VALUES( 3,            2,            20003,     0,         'email',  10,   0,           0,        N'please_set_admin_email' );
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
                  VALUES( 3,            2,            20003,     0,         'routing_choice', 20,   0,           0,        N'none' );
INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName,      type, propdesc_ID, ordering, intBoolVal ) 
                  VALUES( 3,            2,            20003,     0,         'useRichTextEdit', 3,    0,           0,        1 );

INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName,     type, propdesc_ID, ordering, stringVal ) 
                  VALUES( 1,            10,           100001,    0,         'sort_order', 20,   0,           0,        N'TypeAndTitle' );
INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName,      type, propdesc_ID, ordering, stringVal ) 
                  VALUES( 1,            10,           100001,    0,         'view_format', 20,   0,           0,        N'DetailedListing' );

INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName,     type, propdesc_ID, ordering, stringVal ) 
                  VALUES( 1,            11,           110001,    0,         'sort_order', 20,   0,           0,        N'TypeAndTitle' );
INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName,      type, propdesc_ID, ordering, stringVal ) 
                  VALUES( 1,            11,           110001,    0,         'view_format', 20,   0,           0,        N'DetailedListing' );

INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName,     type, propdesc_ID, ordering, stringVal ) 
                  VALUES( 1,            12,           120001,    0,         'sort_order', 20,   0,           0,        N'TypeAndTitle' );
INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName,      type, propdesc_ID, ordering, stringVal ) 
                  VALUES( 1,            12,           120001,    0,         'view_format', 20,   0,           0,        N'DetailedListing' );

INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName,     type, propdesc_ID, ordering, stringVal ) 
                  VALUES( 1,            13,           130001,    0,         'sort_order', 20,   0,           0,        N'TypeAndTitle' );
INSERT INTO DSProp_table( handle_class, handle_index, handle_id, isPrivate, propName,      type, propdesc_ID, ordering, stringVal ) 
                  VALUES( 1,            13,           130001,    0,         'view_format', 20,   0,           0,        N'DetailedListing' );

INSERT INTO rootObjectTable ( handle_id ) VALUES( 100001 );
INSERT INTO rootObjectTable ( handle_id ) VALUES( 110001 );
INSERT INTO rootObjectTable ( handle_id ) VALUES( 120001 );
INSERT INTO rootObjectTable ( handle_id ) VALUES( 130001 );

INSERT INTO userInfo_table ( handle_id, username, domain, userLevel, isActive ) VALUES( 10003, N'Guest', N'DocuShare', N'anonymous', 1 );
INSERT INTO userInfo_table ( handle_id, username, domain, userLevel, isActive ) VALUES( 20003, N'admin', N'DocuShare', N'cpx', 1 );
                         
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

INSERT INTO StringTable VALUES ( 'en', 'class name', 'BulletinBoard', 'BulletinBoard', N'Discussion' );
INSERT INTO StringTable VALUES ( 'en', 'class name plural', 'BulletinBoard', 'BulletinBoard', N'Discussions' );
INSERT INTO StringTable VALUES ( 'en', 'class name', 'Bulletin', 'Bulletin', N'Topic' );
INSERT INTO StringTable VALUES ( 'en', 'class name plural', 'Bulletin', 'Bulletin', N'Topics' );
INSERT INTO StringTable VALUES ( 'en', 'class name', 'Calendar', 'Calendar', N'Calendar' );
INSERT INTO StringTable VALUES ( 'en', 'class name plural', 'Calendar', 'Calendar', N'Calendars' );
INSERT INTO StringTable VALUES ( 'en', 'class name', 'Event', 'Event', N'Event' );
INSERT INTO StringTable VALUES ( 'en', 'class name plural', 'Event', 'Event', N'Events' );
INSERT INTO StringTable VALUES ( 'en', 'class name', 'Collection', 'Collection', N'Collection' );
INSERT INTO StringTable VALUES ( 'en', 'class name plural', 'Collection', 'Collection', N'Collections' );
INSERT INTO StringTable VALUES ( 'en', 'class name', 'Document', 'Document', N'Document' );
INSERT INTO StringTable VALUES ( 'en', 'class name plural', 'Document', 'Document', N'Documents' );
INSERT INTO StringTable VALUES ( 'en', 'class name', 'Version', 'Version', N'Version' );
INSERT INTO StringTable VALUES ( 'en', 'class name plural', 'Version', 'Version', N'Versions' );
INSERT INTO StringTable VALUES ( 'en', 'class name', 'Rendition', 'Rendition', N'Rendition' );
INSERT INTO StringTable VALUES ( 'en', 'class name plural', 'Rendition', 'Rendition', N'Renditions' );
INSERT INTO StringTable VALUES ( 'en', 'class name', 'Subscription', 'Subscription', N'Subscription' );
INSERT INTO StringTable VALUES ( 'en', 'class name plural', 'Subscription', 'Subscription', N'Subscriptions' );
INSERT INTO StringTable VALUES ( 'en', 'class name', 'SavedQuery', 'SavedQuery', N'SavedQuery' );
INSERT INTO StringTable VALUES ( 'en', 'class name plural', 'SavedQuery', 'SavedQuery', N'SavedQueries' );
INSERT INTO StringTable VALUES ( 'en', 'class name', 'URL', 'URL', N'URL' );
INSERT INTO StringTable VALUES ( 'en', 'class name plural', 'URL', 'URL', N'URLs' );
INSERT INTO StringTable VALUES ( 'en', 'class name', 'User', 'User', N'User' );
INSERT INTO StringTable VALUES ( 'en', 'class name plural', 'User', 'User', N'Users' );
INSERT INTO StringTable VALUES ( 'en', 'class name', 'Group', 'Group', N'Group' );
INSERT INTO StringTable VALUES ( 'en', 'class name plural', 'Group', 'Group', N'Groups' );
INSERT INTO StringTable VALUES ( 'en', 'class name', 'MailMessage', 'MailMessage', N'MailMessage' );
INSERT INTO StringTable VALUES ( 'en', 'class name plural', 'MailMessage', 'MailMessage', N'MailMessages' );
INSERT INTO StringTable VALUES ( 'en', 'class name', 'Workspace', 'Workspace', N'Workspace' );
INSERT INTO StringTable VALUES ( 'en', 'class name plural', 'Workspace', 'Workspace', N'Workspaces' );
INSERT INTO StringTable VALUES ( 'en', 'class name', 'Weblog', 'Weblog', N'Weblog' );
INSERT INTO StringTable VALUES ( 'en', 'class name plural', 'Weblog', 'Weblog', N'Weblogs' );
INSERT INTO StringTable VALUES ( 'en', 'class name', 'WeblogEntry', 'WeblogEntry', N'WeblogEntry' );
INSERT INTO StringTable VALUES ( 'en', 'class name plural', 'WeblogEntry', 'WeblogEntry', N'WeblogEntries' );
INSERT INTO StringTable VALUES ( 'en', 'class name', 'Wiki', 'Wiki', N'Wiki' );
INSERT INTO StringTable VALUES ( 'en', 'class name plural', 'Wiki', 'Wiki', N'Wikis' );
INSERT INTO StringTable VALUES ( 'en', 'class name', 'WikiPage', 'WikiPage', N'WikiPage' );
INSERT INTO StringTable VALUES ( 'en', 'class name plural', 'WikiPage', 'WikiPage', N'WikiPages' );
INSERT INTO StringTable VALUES ( 'en', 'class name', 'Space', 'Space', N'Space' );
INSERT INTO StringTable VALUES ( 'en', 'class name plural', 'Space', 'Space', N'Spaces' );
INSERT INTO StringTable VALUES ( 'en', 'class name', 'DocAnnotation', 'DocAnnotation', N'DocAnnotation' );
INSERT INTO StringTable VALUES ( 'en', 'class name plural', 'DocAnnotation', 'DocAnnotation', N'DocAnnotations' );

INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'containment', N'containment' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'draftContainment', N'draftContainment' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'bulletin', N'bulletin' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'event', N'event' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'membership', N'membership' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'subscription', N'subscription' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'subscriber', N'subscriber' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'lockedBy', N'lockedBy' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'version', N'version' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'draftVersion', N'draftVersion' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'rendition', N'rendition' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'owner', N'owner' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'modifiedBy', N'modifiedBy' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'preferredVersion', N'preferredVersion' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'preferredRendition', N'preferredRendition' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'originalRendition', N'originalRendition' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'attachment', N'attachment' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'nativeMessage', N'nativeMessage' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'messageThread', N'messageThread' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'favorite', N'favorite' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'associatedCollection', N'associatedCollection' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'recordSuccessor', N'recordSuccessor' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'jobTicket', N'jobTicket' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'workspace', N'workspace' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'membershipGroup', N'membershipGroup' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'weblog', N'weblog' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'annotation', N'annotation' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'wikiPage', N'wikiPage' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'draftWeblog', N'draftWeblog' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'attach', N'attach' );
INSERT INTO StringTable VALUES ( 'en', 'link type name', '', 'docAnnotation', N'docAnnotation' );

INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'containment', N'Appears In' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'containment', N'Contains' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'draftContainment', N'Appears In' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'draftContainment', N'Contains Drafts' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'bulletin', N'Appears In' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'bulletin', N'Contains' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'event', N'Appears In' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'event', N'Contains' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'membership', N'Member Of' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'membership', N'Members' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'subscription', N'Subscribed To' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'subscription', N'Subscriptions' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'subscriber', N'Subscribed To' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'subscriber', N'Subscribed By' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'lockedBy', N'Locks' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'lockedBy', N'Locked By' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'version', N'Version Of' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'version', N'Versions' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'draftVersion', N'Draft Version Of' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'draftVersion', N'Draft Versions' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'rendition', N'Rendition Of' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'rendition', N'Renditions' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'owner', N'Owns' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'owner', N'Owner' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'modifiedBy', N'Modified' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'modifiedBy', N'Modified By' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'preferredVersion', N'Preferred Version Of' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'preferredVersion', N'Preferred Version' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'preferredRendition', N'Preferred Rendition Of' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'preferredRendition', N'Preferred Rendition' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'originalRendition', N'Original Rendition Of' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'originalRendition', N'Original Rendition' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'attachment', N'Attachment In' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'attachment', N'Attachments' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'nativeMessage', N'Native Message For' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'nativeMessage', N'Native Message' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'messageThread', N'Previous Thread' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'messageThread', N'Next Thread' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'favorite', N'Favorite For' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'favorite', N'Favorites:' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'associatedCollection', N'Associated Collection For' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'associatedCollection', N'Associated Collection' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'recordSuccessor', N'Intended Record Predecessor' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'recordSuccessor', N'Intended Record Successor' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'jobTicket', N'Job Ticket For' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'jobTicket', N'Job Tickets' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'workspace', N'Appears In' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'workspace', N'Contains' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'membershipGroup', N'Membership Group' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'membershipGroup', N'Membership Group For' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'weblog', N'Appears In' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'weblog', N'Contains' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'annotation', N'Appears On' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'annotation', N'Annotations' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'wikiPage', N'Appears In' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'wikiPage', N'Contains' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'draftWeblog', N'Appears In' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'draftWeblog', N'Contains Pre-approved' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'attach', N'Attached to' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'attach', N'Attach links' );
INSERT INTO StringTable VALUES ( 'en', 'link source name', '', 'docAnnotation', N'Annotation On' );
INSERT INTO StringTable VALUES ( 'en', 'link destination name', '', 'docAnnotation', N'Annotations' );

INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'containment', N'The container end of the link' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'containment', N'The containee end of the link' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'draftContainment', N'The container end of the link' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'draftContainment', N'The containee end of the link' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'bulletin', N'The Discussion container, or previous thread Topic end of the link' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'bulletin', N'The Topic containee end of the link' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'event', N'The Calendar container end of the link' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'event', N'The Calendar Event containee end of the link' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'membership', N'The Group container end of the link' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'membership', N'The member elements end of the link' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'subscription', N'The object which is subscribed to' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'subscription', N'The Subscription object' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'subscriber', N'The Subscription held by a subscriber.' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'subscriber', N'The User or Group which holds a subscription' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'lockedBy', N'The object which is locked' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'lockedBy', N'The User object which holds the lock' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'version', N'The Document object which has the destination Version' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'version', N'The Version object which is held by the source Document' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'draftVersion', N'The Document object which has the destination draft Version' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'draftVersion', N'The draft Version object which is held by the source Document' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'rendition', N'The Version object which has the destination Rendition' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'rendition', N'The Rendition object which is held by the source Version' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'owner', N'The owned object' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'owner', N'The User which owns the source object' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'modifiedBy', N'The object which was modified' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'modifiedBy', N'The user who last changed the object' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'preferredVersion', N'The Document for which the destination Version is the preferred version' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'preferredVersion', N'The Version which is the preferred version for the source Document' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'preferredRendition', N'The Version for which the destination Rendition is the preferred rendition' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'preferredRendition', N'The Rendition which is the preferred rendition for the source Version' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'originalRendition', N'The Version for which the destionation Rendition is the original rendition' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'originalRendition', N'The Rendition which is the original rendition for the source Version' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'attachment', N'The mail message end of the link' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'attachment', N'The attachment end of the link' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'nativeMessage', N'The mail message end of the link' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'nativeMessage', N'The native message end of the link' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'messageThread', N'The prededing item in the thread' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'messageThread', N'The following item in the thread' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'favorite', N'The user''s end of the link' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'favorite', N'The favorite item end of the link' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'associatedCollection', N'The user or group with which this collection is associated.' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'associatedCollection', N'The collection that is linked to a group or a user. For a collection linked to a group, it is the collection into which the DocuShare email application copies email messages sent to the group members.  For a collection linked to a user, it is the user''s personal collection, displayed in the DocuShare web UI in My DocuShare.' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'recordSuccessor', N'The object which will be the record predecessor to the destination object in the IRM when the successor relationship is established at the IRM' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'recordSuccessor', N'The object which will be a record successor to the source object in the IRM when the successor relationship is established at the IRM' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'jobTicket', N'The Document which holds a job ticket' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'jobTicket', N'The Document which is a job ticket for another Document' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'workspace', N'The containing object' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'workspace', N'The object which is contained' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'membershipGroup', N'The object which holds a membership group' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'membershipGroup', N'The group which is membership group for a particular object' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'weblog', N'The weblog container for this object' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'weblog', N'The entry in a weblog' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'annotation', N'The object to which the annotation has been made' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'annotation', N'The annotation end of the link' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'wikiPage', N'The wiki, which may hold wiki pages' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'wikiPage', N'The page in a wiki' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'draftWeblog', N'The weblog container for this object' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'draftWeblog', N'A pre-approved entry in a weblog' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'attach', N'The object to which this object is attached' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'attach', N'Objects attached to this object' );
INSERT INTO StringTable VALUES ( 'en', 'link source help', '', 'docAnnotation', N'The document which has been annotated' );
INSERT INTO StringTable VALUES ( 'en', 'link destination help', '', 'docAnnotation', N'The annotation on a document' );

INSERT INTO StringTable VALUES ( 'en', 'property name', 'Object', 'Object.title', N'Title' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Object', 'Object.title', N'The title of the object. The title should be short, but descriptive, and can contain spaces and punctuation marks.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Object', 'Object.webdav_title', N'WebDAV Title' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Object', 'Object.webdav_title', N'The internally-managed title of the object, used just for WebDAV. Your application should not access this non-visible property.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Object', 'Object.description', N'Description' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Object', 'Object.description', N'A detailed description of the object. You can include HTML tags in the object''s description. For container objects, the description appears below the title.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Object', 'Object.summary', N'Summary' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Object', 'Object.summary', N'A short description of the object. The summary appears below the object''s title.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Object', 'Object.isRoot', N'Appears on Home Page' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Object', 'Object.isRoot.true', N'Yes' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Object', 'Object.isRoot.false', N'No' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Object', 'Object.isRoot', N'True if this object is a root object.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Object', 'Object.isRecord', N'Record' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Object', 'Object.isRecord.true', N'Yes' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Object', 'Object.isRecord.false', N'No' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Object', 'Object.isRecord', N'Indicates whether this is a Record.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Object', 'Object.rm_instance_handle', N'Record Instance Handle' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Object', 'Object.rm_instance_handle', N'Used internally by DocuShare to handle data for DS Objects that have been declared to be records.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Object', 'Object.keywords', N'Keywords' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Object', 'Object.keywords', N'One or more words to associate with the object. Keywords help to categorize objects and can be used to find objects in a search. Separate keywords with a comma.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Object', 'Object.create_date', N'Create Date' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Object', 'Object.create_date', N'The date and time when the object was added to DocuShare.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Object', 'Object.modified_date', N'Modified Date' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Object', 'Object.modified_date', N'The date and time when the object was last changed.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Object', 'Object.expiration_date', N'Expiration Date' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Object', 'Object.expiration_date', N'The date on which the object is no longer needed. You can search for expired objects and delete or archive them.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Object', 'Object.locale', N'Locale' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Object', 'Object.locale', N'The language that was specified for this object.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Object', 'Object.client_data', N'Client Data' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Object', 'Object.client_data', N'Internal, non-visible property used by the Windows Client for its operation.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Object', 'Object.readyForDeclare', N'Ready for Declare' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Object', 'Object.readyForDeclare.true', N'Yes' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Object', 'Object.readyForDeclare.false', N'No' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Object', 'Object.readyForDeclare', N'Indicates that the object has at least one complete classification and can be declared as a record. This is an indication that a user has finished classification, but it does not guarantee that all required for declare is complete.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Object', 'Object.routing_template_id', N'Routing Template ID' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Object', 'Object.routing_template_id', N'The internal ID of the template that will be run when documents are added to this object' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Object', 'Object.copiedFrom', N'Copied From' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Object', 'Object.copiedFrom', N'Unique identifier of the object from which this object was copied' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Object', 'Object.lastSynchronized', N'Last Synchronized' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Object', 'Object.lastSynchronized', N'Date on which this copied object was last synchronized from the original object from which it was copied.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Object', 'Object.space', N'Space' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Object', 'Object.space', N'The space in which this object exists.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Object', 'Object.archivedAncestors', N'Archived Ancestors' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Object', 'Object.archivedAncestors', N'Internal property used to archive an object''s scope' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Object', 'Object.archivedParents', N'Archived Parents' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Object', 'Object.archivedParents', N'Internal property used to archive an object''s scope' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Object', 'Object.archivedDate', N'Archived Date' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Object', 'Object.archivedDate', N'Date on which an object was archived' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.domain', N'Domain' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.domain', N'The organization or entity to which the user belongs.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.username', N'Username' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.username', N'The name used to log into DocuShare.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.password', N'Password' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.password', N'The password used to log into DocuShare.  The password is case sensitive and can be any non-zero length, though it is stored as a fixed length encrypted value.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.last_name', N'Last Name' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.last_name', N'The user''s last name. Users are listed on the DocuShare site by their first and last names.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.first_name', N'First Name' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.first_name', N'The user''s first name. Users are listed on the DocuShare site by their first and last names.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.email', N'Email Address' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.email', N'The user''s complete email address. User email addresses are available to all DocuShare users, allowing a user to easily contact another user.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.email_format', N'Email Format' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.email_format.true', N'HTML' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.email_format.false', N'Plain Text' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.email_format', N'The email format DocuShare uses to send mail messages to the user: HTML or Plain Text.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.last_login', N'Last Login' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.last_login', N'The date and time when the user last logged into DocuShare.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.mailstop', N'Mail Stop' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.mailstop', N'The user''s mailing address or mail stop.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.phone', N'Phone' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.phone', N'The user''s phone number.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.home_page', N'Home Page' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.home_page', N'The URL of the user''s home page, if one is available.  This home page is different from the personal home page provided through My DocuShare.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.last_whats_new', N'Last What''s New' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.last_whats_new', N'Last time the user ran What''s New.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.isActive', N'Active User' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.isActive', N'Active/inactive status of the user account.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.isActive.true', N'Yes' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.isActive.false', N'No' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.remote_DN', N'Remote Distinguished Name' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.remote_DN', N'Define the name by which external user information is retrieved.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.routing_choice', N'Routing Task Notification' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.routing_choice.none', N'None' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.routing_choice.email', N'Email' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.routing_choice', N'How to notify the user of an assigned routing task. Email sends a mail message with a URL to the newly assigned task. None displays the task in the My Tasks window only.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.routingIDs', N'Routing IDs' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.routingIDs', N'Internal user data for workflow.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.pagingIncrement', N'Page Size' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.pagingIncrement', N'For paged displays such as favorites, collection contents, and search results, the maximum number of lines to display per page.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.javascriptOn', N'Enable Javascript' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.javascriptOn', N'Enables DocuShare to use Javascript to enhance the performance and appearance of DocuShare web pages. When disabled, DocuShare displays pages using HTML. <b>Yes</b> to enable, <b>No</b> to disable. For 508C compliance, set to disable.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.javascriptOn.true', N'Yes' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.javascriptOn.false', N'No' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.attachmentAsURL', N'Attachment as URL' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.attachmentAsURL.true', N'Yes' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.attachmentAsURL.false', N'No' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.attachmentAsURL', N'If you are a member of the group to whom an email message is sent, specifies how attachments are handled. Yes includes a URL to the attachment in the message; No includes the attachment in the message.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.isInteractEnabled', N'Interact Enabled' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.isInteractEnabled.true', N'Yes' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.isInteractEnabled.false', N'No' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.isInteractEnabled', N'Indicates whether this user is enabled to use the Interact feature.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.isRMContributorEnabled', N'RM Contributor' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.isRMContributorEnabled.true', N'Yes' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.isRMContributorEnabled.false', N'No' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.isRMContributorEnabled', N'Indicates whether the user is a records management Contributor. Contributors can classify objects, designate the objects that are ready to be declared as records, and create personal presets.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.isRMCoordinatorEnabled', N'RM Coordinator' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.isRMCoordinatorEnabled.true', N'Yes' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.isRMCoordinatorEnabled.false', N'No' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.isRMCoordinatorEnabled', N'Indicates whether the user is a records management Coordinator. Coordinators can classify objects, declare objects as records, add successor records, create personal, group, and collection presets, assign user roles, and access the IRM system' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.isRMAdminEnabled', N'RM Administrator' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.isRMAdminEnabled.true', N'Yes' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.isRMAdminEnabled.false', N'No' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.isRMAdminEnabled', N'Indicates whether the user is a records management Administrator. Administrators can access the IRM system. In addition, Administrators can do any action allowed to RM Contributors or RM Coordinators.' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.isInteractEnabled', N'Indicates whether this user is enabled to use the Interact feature.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.canDeclareIfContributor', N'Contributor Declare' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.canDeclareIfContributor.true', N'Yes' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.canDeclareIfContributor.false', N'No' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.canDeclareIfContributor', N'If the user is a records management Contributor, indicates whether the user can declare objects as records.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.changePasswordAtLogin', N'Must Change Password at Login' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.changePasswordAtLogin.true', N'Yes' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.changePasswordAtLogin.false', N'No' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.changePasswordAtLogin', N'Indicates that the system will require the password to be changed at next login.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.failedLoginCount', N'Failed Login Count' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.failedLoginCount', N'Internal property which tracks the number of failed logins since the last successful login, or user create.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.passwordExpiration', N'Password Expire Date' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.passwordExpiration', N'The date on which the current password will no longer be valid and must be changed.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.language', N'Language' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.language', N'The user''s preferred display language. This is available for anything which needs to provide user-visible display, though browser applications normally use the browser language settings.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.characterCode', N'Character Code' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.characterCode', N'The user''s preferred display character encoding.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.noSubscriptionNotifyFor', N'Suppress Notification Messages' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.noSubscriptionNotifyFor.anyChange', N'Any Change' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.noSubscriptionNotifyFor.add', N'Something added' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.noSubscriptionNotifyFor.addNewVersion', N'New Document Version added' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.noSubscriptionNotifyFor.remove', N'Something deleted' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.noSubscriptionNotifyFor.changeProps', N'Properties edited' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.noSubscriptionNotifyFor.changeACL', N'Permissions edited' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.noSubscriptionNotifyFor.changeOwner', N'Change in ownership' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.noSubscriptionNotifyFor.changeLocation', N'Location edited' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.noSubscriptionNotifyFor.lockCheckout', N'Document locked or checked out' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.noSubscriptionNotifyFor.unlock', N'Document unlocked' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.noSubscriptionNotifyFor', N'The DocuShare notification events for which email messages to this user should be suppressed.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.noEmailAgentNotifyFor', N'Suppress Email Agent Messages' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.noEmailAgentNotifyFor.uploadSuccess', N'Upload success' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.noEmailAgentNotifyFor.uploadFailure', N'Upload failure' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.noEmailAgentNotifyFor.forwarded', N'Forwarded' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.noEmailAgentNotifyFor', N'The DocuShare Email Agent events for which email notification to this user should be suppressed.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.alternateEmail', N'Alternate Email Addresses' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.alternateEmail', N'Additional email addresses for this user. Separate email addresses with a comma.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.layoutDefaults', N'Layout Defaults' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.layoutDefaults', N'The user''s choices for display layout defaults, in XML format' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.userLevel', N'User Level' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.userLevel.anonymous', N'Guest' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.userLevel.minimum', N'Read-Only' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.userLevel.dsLimited', N'DocuShare Limited' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.userLevel.imageManager', N'Image Manager' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.userLevel.dsFull', N'DocuShare' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.userLevel.cpx', N'CPX' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.userLevel', N'User level determines the level of access to site content and functions.  User levels are Guest, Read-Only, DocuShare Limited, Image Manager, DocuShare, or CPX.  Your site license determines the available user levels.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.homeSpace', N'Home Space' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.homeSpace', N'The space initially selected for a user after login.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.useRichTextEdit', N'Text Composition Format' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.useRichTextEdit.true', N'Rich Text' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.useRichTextEdit.false', N'Plain Text' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.useRichTextEdit', N'Indicates the user''s preference for rich text or plain text editing for text input, for example in Wiki or Weblog entries or the description property.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.docCountQuota', N'Document Count Quota' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.docCountQuota', N'The maximum number of documents this user can own. The value may also be unlimited or not set. The number includes email attachments and documents attached to wiki pages.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'User', 'User.contentSizeMBQuota', N'Document Content Size Quota (MB)' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'User', 'User.contentSizeMBQuota', N'The maximum size, in megabytes, of document content owned by this user. The value may also be unlimited or not set. Document content size includes content in all renditions of all versions of documents.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Group', 'Group.remote_DN', N'Remote Distinguished Name' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Group', 'Group.remote_DN', N'Define the name by which external group information is retrieved.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Group', 'Group.domain', N'Domain' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Group', 'Group.domain', N'The organization or entity to which the group belongs.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Group', 'Group.emailAlias', N'Email Alias' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Group', 'Group.emailAlias', N'A unique name that can be used as the recipient of an email message.  The name must follow your email application''s conventions; for example, no spaces between words.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Group', 'Group.replyToGroup', N'Reply To' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Group', 'Group.replyToGroup.true', N'Group' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Group', 'Group.replyToGroup.false', N'Sender' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Group', 'Group.replyToGroup', N'Specifies to whom an email reply is sent when any member of the group sends a message. Sender emails a reply only to the user who sent the message; Group emails a reply to all the group members regardless of who sent the message. If the group includes another group as a member, the reply includes that group as well.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Group', 'Group.confirmEmailReceipt', N'Confirm Email Receipt' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Group', 'Group.confirmEmailReceipt.true', N'Yes' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Group', 'Group.confirmEmailReceipt.false', N'No' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Group', 'Group.confirmEmailReceipt', N'Confirms receiving the email message sent to a collection or group by sending an email to the message sender.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Group', 'Group.external_recipients', N'External Recipients' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Group', 'Group.external_recipients', N'The email addresses for people who are not registered users on the DocuShare server.  When the Group is used by the DocuShare Email agent, these email addresses are included along with those of group members.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Group', 'Group.spamControl', N'Spam Control' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Group', 'Group.spamControl', N'Indicates who may send email to the Group email alias.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Group', 'Group.spamControl.anyone', N'No Restriction' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Group', 'Group.spamControl.onlyDSUser', N'Registered Users Only' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Group', 'Group.spamControl.onlyGroupMember', N'Group Members Only' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Group', 'Group.docCountQuota', N'Document Count Quota' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Group', 'Group.docCountQuota', N'The maximum number of documents a member of this group can own. The value may also be unlimited or not set. The number includes email attachments and documents attached to wiki pages. This limit applies if the user does not have an explicit quota defined. If the user belongs to more than one group with a quota, the highest group quota applies.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Group', 'Group.contentSizeMBQuota', N'Document Content Size Quota (MB)' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Group', 'Group.contentSizeMBQuota', N'The maximum size, in megabytes, of document content owned by any member of this group. The value may also be unlimited or not set. Document content size includes content in all renditions of all versions of documents. This limit applies if the user does not have an explicit quota defined. If the user belongs to more than one group with a quota, the highest group quota applies.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Collection', 'Collection.logo', N'Logo' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Collection', 'Collection.logo', N'The URL or handle of a GIF or JPEG image. The URL is any valid Internet address for an image file (for example, http://www.mycompany.com/images/image.gif) and the handle is the handle number of an image in a DocuShare repository (for example, Document-12). The image displays at the top of the collection listing.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Collection', 'Collection.bg_image', N'Background Image' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Collection', 'Collection.bg_image', N'The URL or handle of a GIF or JPEG image. The URL is any valid Internet address for an image file (for example, http://www.mycompany.com/images/image.gif) and the handle is the handle number of an image in a DocuShare repository (for example, Document-12). The image displays in the background of the collection listing.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Collection', 'Collection.sort_order', N'Sort Order' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Collection', 'Collection.sort_order.TypeAndTitle', N'Type and Title' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Collection', 'Collection.sort_order.TypeAndDate', N'Type and Date' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Collection', 'Collection.sort_order.Date', N'Date' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Collection', 'Collection.sort_order.Title', N'Title' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Collection', 'Collection.sort_order.TitleReversed', N'Title Reversed' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Collection', 'Collection.sort_order.DateAscending', N'Date Ascending' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Collection', 'Collection.sort_order', N'The order in which objects are displayed in the collection: Type and Title groups objects by type and orders objects alphabetically by title. Type and Date groups objects by type and orders objects in reverse chronological order, with most recently modified objects displayed first. Date displays objects in reverse chronological order, with most recently modified objects displayed first. Title displays objects alphabetically by title. Title Reversed displays objects in reverse alphabetical order by title. Date Ascending displays objects chronologically, with most recently modified objects displayed last.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Collection', 'Collection.view_format', N'View Format' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Collection', 'Collection.view_format.DetailedListing', N'Detailed Listing' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Collection', 'Collection.view_format.Images', N'Images' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Collection', 'Collection.view_format.Email', N'Email' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Collection', 'Collection.view_format', N'The format in which objects are displayed in the collection. Detailed Listing displays objects in a list. Images displays image files as thumbnails and all other object types as large icons. Email displays the properties associated with mail messages.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Collection', 'Collection.add_as_draft', N'Route Before Publishing' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Collection', 'Collection.add_as_draft.true', N'Yes' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Collection', 'Collection.add_as_draft.false', N'No' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Collection', 'Collection.add_as_draft', N'Requires each document added to the collection to be routed.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Collection', 'Collection.emailAlias', N'Email Alias' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Collection', 'Collection.emailAlias', N'A unique name that can be used as the recipient of an email message.  The name must follow your email application''s conventions; for example, no spaces between words.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Collection', 'Collection.spamControl', N'Spam Control' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Collection', 'Collection.spamControl', N'Indicates who may send email to the Collection email alias.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Collection', 'Collection.spamControl.anyone', N'No Restriction' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Collection', 'Collection.spamControl.onlyDSUser', N'Registered Users Only' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'BulletinBoard', 'BulletinBoard.logo', N'Logo' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'BulletinBoard', 'BulletinBoard.logo', N'The URL or handle of a GIF or JPEG image. The URL is any valid Internet address for an image file (for example, http://www.mycompany.com/images/image.gif) and the handle is the handle number of an image in a DocuShare repository (for example, Document-12). The image displays at the top of the discussion listing.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'BulletinBoard', 'BulletinBoard.bg_image', N'Background Image' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'BulletinBoard', 'BulletinBoard.bg_image', N'The URL or handle of a GIF or JPEG image. The URL is any valid Internet address for an image file (for example, http://www.mycompany.com/images/image.gif) and the handle is the handle number of an image in a DocuShare repository (for example, Document-12). The image displays in the background of the discussion listing.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'BulletinBoard', 'BulletinBoard.expire', N'Topics Expire In' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'BulletinBoard', 'BulletinBoard.expire.0', N'1 hour' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'BulletinBoard', 'BulletinBoard.expire.1', N'1 day' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'BulletinBoard', 'BulletinBoard.expire.2', N'2 days' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'BulletinBoard', 'BulletinBoard.expire.3', N'3 days' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'BulletinBoard', 'BulletinBoard.expire.4', N'4 days' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'BulletinBoard', 'BulletinBoard.expire.5', N'5 days' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'BulletinBoard', 'BulletinBoard.expire.6', N'1 week' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'BulletinBoard', 'BulletinBoard.expire.7', N'2 weeks' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'BulletinBoard', 'BulletinBoard.expire.8', N'1 month' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'BulletinBoard', 'BulletinBoard.expire.9', N'2 months' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'BulletinBoard', 'BulletinBoard.expire.10', N'Never' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'BulletinBoard', 'BulletinBoard.expire', N'The length of time to retain bulletins in the discussion after they are added. When a topic becomes older than the selected duration, it no longer appears in the discussion. Expired topics can be viewed and deleted separately.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'BulletinBoard', 'BulletinBoard.showHierarchy', N'Display Hierarchy' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'BulletinBoard', 'BulletinBoard.showHierarchy.true', N'Indented' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'BulletinBoard', 'BulletinBoard.showHierarchy.false', N'Flat' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'BulletinBoard', 'BulletinBoard.showHierarchy', N'Specifies how topic threads are displayed in the discussion. <b>Indented</b> indents each reply to a topic or reply. <b>Flat</b> displays all topics and replies at the same level.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'URL', 'URL.url', N'URL' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'URL', 'URL.url', N'The complete Internet address of a Web page. For example: http://www.website.com. While viewing the Web page in a browser, you can copy the URL from the Address or Location field and paste it into the URL field.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'URL', 'URL.displayInNewWindow', N'Display in New Window' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'URL', 'URL.displayInNewWindow.true', N'Yes' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'URL', 'URL.displayInNewWindow.false', N'No' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'URL', 'URL.displayInNewWindow', N'Indicates whether DocuShare should display the URL in a new browser, or in the same browser as DocuShare.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Document', 'Document.author', N'Author' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Document', 'Document.author', N'The document''s author or authors. An author can be someone other than the document''s owner.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Document', 'Document.content_type', N'Content Type' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Document', 'Document.content_type', N'The format of the document, as defined by its MIME Type. For example, a Microsoft Word document would map to the MIME Type application/msword. DocuShare uses the MIME Type to open a document in the appropriate editor. When a document is uploaded to the server, DocuShare tries to determine the content type. If the type cannot be determined, you can enter the appropriate MIME Type for the document. If you are uncertain about the correct value to enter, see your administrator. ' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Document', 'Document.size', N'Size' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Document', 'Document.size', N'Size, in bytes, of the document''s content file.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Document', 'Document.max_versions', N'Max Versions' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Document', 'Document.max_versions', N'The maximum number of versions to save. When a new version of a document is added to DocuShare, the oldest version is deleted.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Document', 'Document.highest_version_used', N'Highest Version' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Document', 'Document.highest_version_used', N'The highest version number assigned so far for this document.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Document', 'Document.abstract', N'Abstract' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Document', 'Document.abstract', N'A summary of the document content, generated and added immediately after the document is indexed for search.  The abstract is available only for documents whose content type supports text capture and analysis.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Document', 'Document.original_file_name', N'File name' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Document', 'Document.original_file_name', N'The document''s original filename.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Document', 'Document.add_as_draft', N'Routing Required' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Document', 'Document.add_as_draft.true', N'Yes' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Document', 'Document.add_as_draft.false', N'No' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Document', 'Document.add_as_draft', N'Specifies whether new versions for this document are automatically routed.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Document', 'Document.canAddVersions', N'Add Versions' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Document', 'Document.canAddVersions.true', N'Allowed' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Document', 'Document.canAddVersions.false', N'Not Allowed' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Document', 'Document.canAddVersions', N'Indicates whether additional versions may be added to the original document.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Document', 'Document.isInteract', N'Interact Document' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Document', 'Document.isInteract.true', N'Yes' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Document', 'Document.isInteract.false', N'No' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Document', 'Document.isInteract', N'Indicates whether this is an Interact document.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Document', 'Document.autoMovePreferredVersion', N'Update Preferred Version' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Document', 'Document.autoMovePreferredVersion.true', N'Yes' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Document', 'Document.autoMovePreferredVersion.false', N'No' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Document', 'Document.autoMovePreferredVersion', N'If ''Yes'', a new version automatically becomes the preferred (main) version.  If ''No'', the preferred version remains the same version until another version is designated.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Document', 'Document.isPlaceholder', N'Is Placeholder' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Document', 'Document.isPlaceholder', N'Indicates whether this object is a placeholder for something else' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Document', 'Document.isPlaceholder.true', N'Yes' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Document', 'Document.isPlaceholder.false', N'No' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Document', 'Document.cfSpecialWords', N'TrueMatch Special Words' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Document', 'Document.cfSpecialWords', N'Words used by the TrueMatch application duplicate detection.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Document', 'Document.cfCopyID', N'TrueMatch Copy ID' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Document', 'Document.cfCopyID', N'Unique ID used by the TrueMatch application.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Version', 'Version.version_number', N'Version Number' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Version', 'Version.version_number', N'The number assigned to the document version.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Version', 'Version.revision_comments', N'Version Comments' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Version', 'Version.revision_comments', N'A description associated with this version, commonly a short description of the changes.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Version', 'Version.abstract', N'Abstract' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Version', 'Version.abstract', N'A summary of the version content, generated and added immediately after the version is indexed for search.  The abstract is available only for versions whose content type supports text capture and analysis.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Rendition', 'Rendition.rendition_type', N'Rendition Type' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Rendition', 'Rendition.rendition_type', N'The version''s display format as specified by its MIME Type. For example, a Microsoft Word document maps to the MIME Type application/msword.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Rendition', 'Rendition.size', N'Size' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Rendition', 'Rendition.size', N'Size, in bytes, of the content file(s) for this rendition.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Rendition', 'Rendition.generated', N'Generated' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Rendition', 'Rendition.generated.true', N'Yes' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Rendition', 'Rendition.generated.false', N'No' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Rendition', 'Rendition.generated', N'Indicates whether or not DocuShare generated the rendition. For example, clicking the <b>View</b> icon generates an HTML rendition of a document.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Rendition', 'Rendition.rendition_detail', N'Rendition Detail' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Rendition', 'Rendition.rendition_detail', N'Additional characteristics about the rendition.  Characteristics kept may differ according to the application creating the rendition, or according to rendition type.  Renditions of the same MIME type may have different values for the Rendition Detail property.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.external_recipients', N'External Recipients' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Subscription', 'Subscription.external_recipients', N'The list of email addresses for recipients who are not registered users on the DocuShare server. When the subscribed event occurs, an email message is sent to each recipient. Separate email addresses with a comma.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.events', N'Events of Interest' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.events.anyChange', N'Any Change' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.events.add', N'Something added' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.events.addNewVersion', N'New Document Version added' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.events.remove', N'Something deleted' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.events.changeProps', N'Properties edited' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.events.changeACL', N'Permissions edited' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.events.changeOwner', N'Change in ownership' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.events.changeLocation', N'Location edited' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.events.lockCheckout', N'Document locked or checked out' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.events.unlock', N'Document unlocked' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Subscription', 'Subscription.events', N'The DocuShare events to which to subscribe. When a subscribed event occurs, DocuShare sends an email message, runs a script, or launches a workflow, depending on the choice selected in the notification_action property.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.period', N'Period' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.period.Immediate', N'Immediate' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.period.Daily', N'Daily' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.period.Weekly', N'Weekly' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Subscription', 'Subscription.period', N'The time period at which to provide notification when an event of interest occurs: Immediate provides notification immediately after the event occurs. Daily provides notification in a daily summary report. Weekly provides notification in a weekly summary report.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.recipient_activity', N'Include Recipient Activity' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.recipient_activity.true', N'Yes' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.recipient_activity.false', N'No' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Subscription', 'Subscription.recipient_activity', N'Notifies the user whose action caused the subscription notification. Setting this property to No prevents the user from receiving notification about an action he or she made.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.notification_action', N'Notification Action' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.notification_action.email', N'Send Email' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.notification_action.script', N'Run Script' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.notification_action.workflow', N'Launch Workflow' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Subscription', 'Subscription.notification_action', N'Specifies whether the action to be taken when the subscribed event occurs should be send email, run a script, or launch a workflow.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.script', N'Script' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Subscription', 'Subscription.script', N'The name of the script file or the string that invokes the script. If you are using a script file, it must be located on the server in the central site extensions directory defined by com.xerox.docushare.extensions.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.script_data', N'Script Data' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Subscription', 'Subscription.script_data', N'Any string value to be passed to the Subscription script when it is called.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.sender', N'Sender' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.sender.true', N'Admin' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.sender.false', N'Owner' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Subscription', 'Subscription.sender', N'The username that appears in the email message From field.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.subscription_scope', N'Notification Applies To' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.subscription_scope.allLevels', N'This container and all levels of contents' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.subscription_scope.oneLevel', N'This container and immediate contents' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Subscription', 'Subscription.subscription_scope', N'Specifies how to apply the notification to the collection and its contents. <b>This container and all levels of contents</b> applies the notification to the collection and all of the objects under it. When the subscribed-to change occurs to any one of the collection''s objects, DocuShare performs the notification''s chosen action, sending email, running a script, or initiating a workflow. <b>This container and immediate contents</b> applies the notification to the collection and only its first nested level of objects. For example, if a collection contains several objects and a subcollection, DocuShare performs the notification action when a change occurs to any of the objects and the subcollection; it does not when a change occurs to an object in the subcollection.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.workflow_name', N'Workflow Name' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Subscription', 'Subscription.workflow_name', N'A unique name that identifies the workflow to be run.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.workflow_data', N'Workflow Data' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Subscription', 'Subscription.workflow_data', N'Instance data to be used by the workflow when it is initiated by this subscription.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.rulesEnabled', N'Enabled' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.rulesEnabled.true', N'Yes' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.rulesEnabled.false', N'No' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Subscription', 'Subscription.rulesEnabled', N'Indicates whether this content rule or notification is enabled to run.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Subscription', 'Subscription.rulesStarts', N'Content Rule Recent Starts' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Subscription', 'Subscription.rulesStarts', N'The most recent starting times for content rules run by this subscription.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'SavedQuery', 'SavedQuery.query_string', N'Query String' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'SavedQuery', 'SavedQuery.query_string', N'An XML representation of the query presented by SavedQuery.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Event', 'Event.year', N'Year' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Event', 'Event.year', N'Specify the year for this event.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Event', 'Event.month', N'Month' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Event', 'Event.month', N'Specify the month for this event.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Event', 'Event.day', N'Day' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Event', 'Event.day', N'Specify the day for this event.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Event', 'Event.has_time', N'Has Time' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Event', 'Event.has_time', N'Specify whether this Event is for a certain time on this day.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Event', 'Event.has_time.true', N'Yes' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Event', 'Event.has_time.false', N'No' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Event', 'Event.start_time', N'Start Time' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Event', 'Event.start_time', N'Specify the start time for this event.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Event', 'Event.end_time', N'End Time' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Event', 'Event.end_time', N'Specify the end time for this event.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Event', 'Event.num_repeat', N'Number of Repeats' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Event', 'Event.num_repeat', N'For an event that occurs more than once, the number of occurrences.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Event', 'Event.repeat', N'Repeat' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Event', 'Event.repeat.None', N'None' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Event', 'Event.repeat.Daily', N'Daily' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Event', 'Event.repeat.Weekly', N'Weekly' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Event', 'Event.repeat.Every_2_Weeks', N'Every 2 Weeks' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Event', 'Event.repeat.Monthly_By_Date', N'Monthly By Date' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Event', 'Event.repeat.Yearly', N'Yearly' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Event', 'Event.repeat', N'For an event that occurs more than once, the frequency of occurrences.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Event', 'Event.exclusions', N'Exclusions' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Event', 'Event.exclusions', N'(Internal property) Which ordinal events in a series Event have been deleted.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Calendar', 'Calendar.default_scale', N'Default View' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Calendar', 'Calendar.default_scale.true', N'Month' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Calendar', 'Calendar.default_scale.false', N'Week' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Calendar', 'Calendar.default_scale', N'Displays the calendar as a series of individual months or individual weeks each time the calendar is opened. Once open, the calendar view can be changed.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'MailMessage', 'MailMessage.from', N'From' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'MailMessage', 'MailMessage.from', N'The sender of the message.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'MailMessage', 'MailMessage.subject', N'Subject' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'MailMessage', 'MailMessage.subject', N'The subject line of the message.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'MailMessage', 'MailMessage.body', N'Message' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'MailMessage', 'MailMessage.body', N'The body of the message.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'MailMessage', 'MailMessage.postedDate', N'Sent' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'MailMessage', 'MailMessage.postedDate', N'The date and time the message was posted.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'MailMessage', 'MailMessage.received', N'Received' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'MailMessage', 'MailMessage.received', N'The date and time the message was received.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'MailMessage', 'MailMessage.messageID', N'Message-ID' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'MailMessage', 'MailMessage.messageID', N'A unique identifier for the message, formatted according to the RFC822 standard.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'MailMessage', 'MailMessage.contentType', N'Content-Type Header' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'MailMessage', 'MailMessage.contentType', N'Header that describes the MIME type and content encoding of the message body. For example, Content-Type: text/plain; charset=ISO-8859-1.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'MailMessage', 'MailMessage.to', N'To' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'MailMessage', 'MailMessage.to', N'One or more primary recipients of the message.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'MailMessage', 'MailMessage.cc', N'Cc' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'MailMessage', 'MailMessage.cc', N'One or more additional recipients of the message.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'MailMessage', 'MailMessage.references', N'References' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'MailMessage', 'MailMessage.references', N'The sequence of references, usually Message-IDs of the other mail messages to which this message refers.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'MailMessage', 'MailMessage.headers', N'Internet Headers' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'MailMessage', 'MailMessage.headers', N'The sequence of all of the message headers, formatted according to the RFC822 standard. The headers specify the message recipient, the message subject, the sent date, and other information about the message or its handling.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'MailMessage', 'MailMessage.size', N'Size' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'MailMessage', 'MailMessage.size', N'Size, in bytes, of the message body.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'MailMessage', 'MailMessage.inReplyTo', N'In-Reply-To' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'MailMessage', 'MailMessage.inReplyTo', N'If the mail message is a reply to another message, optionally the Message-ID of the replied-to message.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'MailMessage', 'MailMessage.replyTo', N'Reply-To' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'MailMessage', 'MailMessage.replyTo', N'Email address to which a reply should be sent.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'MailMessage', 'MailMessage.originally_signed', N'Originally Signed' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'MailMessage', 'MailMessage.originally_signed', N'Indicates whether or not the original mail message was digitally signed.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'MailMessage', 'MailMessage.originally_signed.true', N'Yes' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'MailMessage', 'MailMessage.originally_signed.false', N'No' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'MailMessage', 'MailMessage.originally_encrypted', N'Originally Encrypted' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'MailMessage', 'MailMessage.originally_encrypted', N'Indicates whether or not the original mail message was encrypted' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'MailMessage', 'MailMessage.originally_encrypted.true', N'Yes' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'MailMessage', 'MailMessage.originally_encrypted.false', N'No' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Workspace', 'Workspace.layout', N'Layout Specification' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Workspace', 'Workspace.layout', N'A specification of the layout of the workspace display, in XML format' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Workspace', 'Workspace.emailAlias', N'Email Alias' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Workspace', 'Workspace.emailAlias', N'A unique name that can be used as the recipient of an email message.  The name must follow your email application''s conventions; for example, no spaces between words.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Workspace', 'Workspace.iconFilename', N'Icon Filename' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Workspace', 'Workspace.iconFilename', N'The filename of the icon to be used for this workspace.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Weblog', 'Weblog.xmlFields', N'XML Fields' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Weblog', 'Weblog.xmlFields', N'A specification of the fields of the weblog display, in XML format' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Weblog', 'Weblog.xmlTemplates', N'XML Templates' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Weblog', 'Weblog.xmlTemplates', N'Initial start templates' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Weblog', 'Weblog.emailAlias', N'Email Alias' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Weblog', 'Weblog.emailAlias', N'A unique name that can be used as the recipient of an email message.  The name must follow your email application''s conventions; for example, no spaces between words.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Weblog', 'Weblog.isModerated', N'Moderated' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Weblog', 'Weblog.isModerated.true', N'Yes' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Weblog', 'Weblog.isModerated.false', N'No' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Weblog', 'Weblog.isModerated', N'Indicates whether this weblog is moderated.  Additions to a moderated weblog must be approved before they appear in the contents.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'WeblogEntry', 'WeblogEntry.xmlFields', N'Weblog Entry' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'WeblogEntry', 'WeblogEntry.xmlFields', N'A specification of the fields of the weblog entry display, in XML format' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'WeblogEntry', 'WeblogEntry.approval_state', N'Approval Status' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'WeblogEntry', 'WeblogEntry.approval_state.toBeApproved', N'Not Yet Approved' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'WeblogEntry', 'WeblogEntry.approval_state.rejected', N'Rejected' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'WeblogEntry', 'WeblogEntry.approval_state.resubmitted', N'Resubmitted' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'WeblogEntry', 'WeblogEntry.approval_state.approved', N'Approved' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'WeblogEntry', 'WeblogEntry.approval_state', N'Indicates the approval status of this weblog entry.  Additions to an unmoderated weblog are automatically ''Approved''.  Additions to a moderated weblog must be approved by a weblog moderator.  The entry starts as ''Not Yet Approved'', may be ''Rejected'', and may subsequently be ''Resubmitted'' for approval again.  When approved, its status becomes ''Approved''.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Wiki', 'Wiki.xmlFields', N'XML Fields' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Wiki', 'Wiki.xmlFields', N'A specification of the fields of the wiki display, in XML format' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Wiki', 'Wiki.xmlTemplates', N'XML Templates' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Wiki', 'Wiki.xmlTemplates', N'Initial start templates' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'WikiPage', 'WikiPage.xmlFields', N'Wiki Page' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'WikiPage', 'WikiPage.xmlFields', N'A specification of the fields of the wiki page display, in XML format' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Space', 'Space.spaceName', N'Space Name' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Space', 'Space.spaceName', N'The name of the space. Since the space name can appear in URLs, it should contain only characters which are valid in a URL.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Space', 'Space.spaceSettings', N'Space Settings' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Space', 'Space.spaceSettings', N'An XML document containing settings defined for the space.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Space', 'Space.classNames', N'Class Names' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Space', 'Space.classNames', N'The object classes from which objects may be created in this space.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'DocAnnotation', 'DocAnnotation.annotationBody', N'Annotation Body' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'DocAnnotation', 'DocAnnotation.annotationBody', N'The annotation data, in XML format' );

INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '0', N'Content Accessed' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '0', N'The tracking operation performed when the content of a document is retrieved.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '1', N'Property Changed' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '1', N'The tracking operation performed when properties of an object are changed.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '2', N'Collection Content Viewed' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '2', N'The tracking operation performed when the contents of a Collection or Collection clone are enumerated.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '3', N'Owner Changed' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '3', N'The tracking operation performed when the owner of a document is changed.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '5', N'Login' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '5', N'The tracking operation performed when a user or application logs in to DocuShare.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '6', N'Object Deleted' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '6', N'The tracking operation performed when an object is deleted.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '7', N'Object Expunged' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '7', N'The tracking operation performed when an object is expunged.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '8', N'Document Locked' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '8', N'The tracking operation performed when a Document or Document clone is locked.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '9', N'Document Version Added' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '9', N'The tracking operation performed when a version is added to a Document or Document clone.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '10', N'Object Created' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '10', N'The tracking operation performed when a new object is created, for example a new Collection or User or Document.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '11', N'Object Added to Container' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '11', N'The tracking operation performed when an object is added to a container, for example a Document which was added to a Collection during a copy or move.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '12', N'Object Removed from Container' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '12', N'The tracking operation performed when an object is removed from a container, for example a Document which was removed from a Collection as part of a move.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '13', N'Operation Failed' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '13', N'The tracking operation marking the failure of an operation.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '14', N'Permissions Changed by Modify' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '14', N'The tracking operation performed when an object''s ACL is modified to add or remove access for a user or group, or to add or remove permissions for a user or group already in the ACL.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '15', N'Permissions Changed by Replace' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '15', N'The tracking operation performed when an object''s ACL is replaced.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '16', N'Permissions Changed by Link Change' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '16', N'The tracking operation performed when an object''s ACL is modified as a result of a link with another object in a link relationship which affects ACL.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '17', N'Permissions Changed by Change Owner' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '17', N'The tracking operation performed when an object''s ACL is modified as a result of an owner change operation.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '18', N'Permissions Changed by Merge User' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '18', N'The tracking operation performed when an object''s ACL is modified as a result of a merge user operation which merged one of the users in the ACL.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '19', N'Permissions Changed by Declare Record' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '19', N'The tracking operation performed when an object''s ACL is modified as a result of having the object declared as a record.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '20', N'Permissions Changed by Undeclare Record' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '20', N'The tracking operation performed when an object''s ACL is modified as a result of having the object undeclared, making it no longer a record.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '21', N'WikiPage History Added' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '21', N'The tracking operation performed when properties of a WikiPage object which are kept in its history are changed.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '22', N'Object Published' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '22', N'The tracking operation performed when a draft is published or an object added to a moderated container is approved.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '23', N'Document Exported' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '23', N'The tracking operation performed when a Document is exported.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '24', N'Member Added to Group' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '24', N'The tracking operation performed when a principal is added to a Group.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '25', N'Member Removed from Group' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '25', N'The tracking operation performed when a principal is removed from a Group.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '26', N'History Tracking Option Changed' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '26', N'The tracking operation performed when a the site configuration was changed to enable or disable tracking operations.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '27', N'Container Had Object Added' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '27', N'The tracking operation performed when a container has an object added, such as a Collection having a Document added to it.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '28', N'Container Had Object Removed' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '28', N'The tracking operation performed when a container has an object removed, such as a Collection having a Document removed from it.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '29', N'Custom Event' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '29', N'The tracking operation performed when an application program performs a custom action.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '30', N'Failed Login' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '30', N'The user tried to log in but failed.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '500', N'Logout' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '500', N'The tracking operation performed when a user or application logs out of DocuShare.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '501', N'Email Sent' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '501', N'The tracking operation performed when email is posted.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '502', N'Workflow Started' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '502', N'The tracking operation performed when when a workflow is initiated.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '503', N'Content Rule Triggered' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '503', N'The tracking operation performed when when a content rule is triggered.' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp label', '__OpLabels', '504', N'Workflow Changed' );
INSERT INTO StringTable VALUES ( 'en', 'accessOp help', '__OpLabels', '504', N'The tracking operation performed when a workflow is changed or deleted.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Collection', 'Collection.attachmentsOnly', N'Attachments Only' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Collection', 'Collection.attachmentsOnly', N'For email messages that include attachments, uploads each attachment as a separate document. The email message is not added to DocuShare.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Collection', 'Collection.attachmentsOnly.true', N'True' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Collection', 'Collection.attachmentsOnly.false', N'False' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Workspace', 'Workspace.attachmentsOnly', N'Attachments Only' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'Workspace', 'Workspace.attachmentsOnly', N'For email messages that include attachments, uploads each attachment as a separate document. The email message is not added to DocuShare.' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Workspace', 'Workspace.attachmentsOnly.true', N'True' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'Workspace', 'Workspace.attachmentsOnly.false', N'False' );
INSERT INTO StringTable VALUES ( 'en', 'property name', 'MailMessage', 'MailMessage.signed_by', N'Signed By' );
INSERT INTO StringTable VALUES ( 'en', 'property help', 'MailMessage', 'MailMessage.signed_by', N'The email address designated in the digital certificate which was used to sign the original email.' );


CREATE TABLE DWE_Max_Id(Id NUMERIC(22) NOT NULL, PRIMARY KEY(Id));
CREATE TABLE DWE_Workflows(Id NUMERIC(22) NOT NULL, Activated BIT NOT NULL, Wake_Up_Time NUMERIC(22) NULL, Class_Type VARCHAR(128) NOT NULL, Template_Id NUMERIC(22) NULL, Unique_Key VARCHAR(50) NULL, Engine_Id VARCHAR(50) NULL, Priority NUMERIC(10) NULL, Template BIT NULL, Date_Estimation BIT NULL, Template_UID VARCHAR(50) NULL, Version VARCHAR(50) NULL, Thumbprint VARCHAR(50) NULL, Version_Timestamp NUMERIC(22) NULL, PRIMARY KEY(Id));
CREATE TABLE DWE_Tasks( Id NUMERIC(22) NOT NULL,Class_Type VARCHAR(128) NOT NULL, Name VARCHAR(50) NULL, Workflow_Id NUMERIC(22) NOT NULL, Parent NUMERIC(22) NULL, Resource_Id VARCHAR(50) NULL, State NUMERIC(10) NOT NULL, Progress NUMERIC(10) NOT NULL, Earliest_Start_Date NUMERIC(22) NULL, Start_Date NUMERIC(22) NOT NULL, End_Date NUMERIC(22) NOT NULL, Notes VARCHAR(250) NULL, Role_Name VARCHAR(50) NULL, Template_Id NUMERIC(22) NULL, Scoped_Id NUMERIC(22) NULL, Priority NUMERIC(10) NULL, X_Pos NUMERIC(10) NULL, Y_Pos NUMERIC(10) NULL, PRIMARY KEY(Id));
CREATE TABLE DWE_Predecessors( Task_Id NUMERIC(22) NOT NULL, Pred_Id NUMERIC(22) NOT NULL, PRIMARY KEY (Task_Id, Pred_Id));
CREATE TABLE DWE_WF_Attributes(Workflow_Id NUMERIC(22) NOT NULL, Name VARCHAR(50) NOT NULL, Value IMAGE NULL, Type VARCHAR(50) NULL, String_Value VARCHAR(4000) NULL, Is_Shared BIT NULL, PRIMARY KEY(Workflow_Id, Name));
CREATE TABLE DWE_Internal_WF_Attributes(Workflow_Id NUMERIC(22) NOT NULL, Name VARCHAR(50) NOT NULL, Value IMAGE NULL, Type VARCHAR (50) NULL, String_Value TEXT NULL, Is_Shared BIT NULL, PRIMARY KEY(Workflow_Id, Name));
CREATE TABLE DWE_Task_Attributes(Task_Id NUMERIC(22) NOT NULL, Name VARCHAR(50) NOT NULL, Value IMAGE NULL, Type VARCHAR(50) NULL, String_Value TEXT NULL, Is_Shared BIT NULL, PRIMARY KEY(Task_Id, Name));
CREATE TABLE DWE_Internal_Task_Attributes(Task_Id NUMERIC(22) NOT NULL, Name VARCHAR(50) NOT NULL, Value IMAGE NULL, Type VARCHAR (50) NULL, String_Value TEXT NULL, Is_Shared BIT NULL, PRIMARY KEY(Task_Id, Name));
CREATE TABLE DWE_Delay_Timers(Task_Id NUMERIC(22) NOT NULL, End_Time NUMERIC(22) NULL, PRIMARY KEY(Task_Id));
CREATE TABLE DWE_Workflow_Documents(Workflow_Id NUMERIC(22) NOT NULL, Doc_Name VARCHAR(50) NOT NULL, Doc_Type VARCHAR(50) NULL, Document IMAGE NULL, PRIMARY KEY(Workflow_Id, Doc_Name));
CREATE TABLE DWE_Corr_Sets(Task_Id NUMERIC(22) NOT NULL, Name VARCHAR(50) NOT NULL, Initiated BIT NOT NULL, PRIMARY KEY(Task_Id, Name));
CREATE TABLE DWE_Corr_Tokens( Task_Id NUMERIC(22) NOT NULL, Set_Name VARCHAR(50) NOT NULL, Prop_Name VARCHAR(50) NOT NULL, Prop_Value VARCHAR(255) NULL, PRIMARY KEY(Task_Id, Set_Name, Prop_Name));
CREATE TABLE DWE_Meta_Data( Id VARCHAR(64) NOT NULL, Val1 VARCHAR(64) NULL, Val2 VARCHAR(256) NULL, PRIMARY KEY(Id));
CREATE TABLE DWE_Subscriptions(Task_Id NUMERIC(22) NOT NULL, Event_Type VARCHAR(255) NULL, PRIMARY KEY(Task_Id));
CREATE TABLE DWE_Resources(Id VARCHAR(50) NOT NULL, UserId VARCHAR(50) NULL, Password VARCHAR(32) NOT NULL, Name_Last VARCHAR(32) NOT NULL, Name_First VARCHAR(32) NULL, Email VARCHAR(50) NULL, Registration_Date NUMERIC(22) NULL, Last_Login_Date NUMERIC(22) NULL, Active NUMERIC(10) NULL, PRIMARY KEY(Id));
CREATE TABLE DWE_Organizations(Prefix VARCHAR(250) NOT NULL, Name VARCHAR(50) NOT NULL, PRIMARY KEY(Prefix, Name));
CREATE TABLE DWE_Org_Resources(Org_Prefix VARCHAR(250) NOT NULL, Org_Name VARCHAR(50) NOT NULL, Resource_Id VARCHAR(50) NOT NULL, PRIMARY KEY(Org_Prefix, Org_Name, Resource_Id));
CREATE TABLE DWE_Roles(Org_Prefix VARCHAR(250) NOT NULL, Org_Name VARCHAR(50) NOT NULL, Name VARCHAR(50) NOT NULL, PRIMARY KEY(Org_Prefix, Org_Name, Name));
CREATE TABLE DWE_Resource_Roles(Resource_Id VARCHAR(50) NOT NULL, Role_Name VARCHAR(50) NOT NULL, Org_Prefix VARCHAR(250)  NOT NULL, Org_Name VARCHAR(50) NOT NULL, PRIMARY KEY(Resource_Id, Role_Name, Org_Prefix, Org_Name));
CREATE TABLE DWE_Resource_Attributes(Resource_Id VARCHAR(50) NOT NULL, Name VARCHAR(50) NOT NULL, Value IMAGE NULL, Type VARCHAR (50) NULL, String_Value TEXT NULL, PRIMARY KEY(Resource_Id, Name));
