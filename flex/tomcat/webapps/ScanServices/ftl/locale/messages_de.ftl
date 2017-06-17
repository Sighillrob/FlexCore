<#-------------------------------------->
<#-------- Admin UI Messages ----------->
<#-------------------------------------->

<#-- StandAlone Menu -->
<#assign standalone_menu_title = "Scan Services-Menü"/>
<#assign link_configBtnsLabel="Schaltflächen konfigurieren"/>
<#assign link_configBtnsTip="Scan Services-Schaltflächen für Multifunktionsdrucker hinzufügen und konfigurieren."/>
<#assign link_configDevicesLabel="Geräte konfigurieren"/>
<#assign link_configDevicesTip="Multifunktionsdrucker für DocuShare Scan Services konfigurieren und die Geräteschaltflächen verwalten."/>
<#assign link_scanLogLabel="Scanprotokoll"/>
<#assign link_scanLogTip="Aktuelle Scanaufträge anzeigen und das Scanprotokoll herunterladen"/>
<#assign link_logSettingsLabel="Serverprotokoll"/>
<#assign link_logSettingsTip="Protokollierungsebene des Serverprotokolls ändern und Serverprotokoll herunterladen"/>
<#assign link_emailServiceLabel="E-Mail-Einrichtung"/>
<#assign link_emailServiceTip="Konfigurieren Sie den E-Mail-Dienst."/>
<#assign link_configureServerLabel="Server-Einrichtung" />
<#assign link_configureServerTip="Einstellungen für den DocuShare Scan Services-Server konfigurieren." />
<#assign link_autoFillProfileLabel = "Autofill-Profile"/>
<#assign link_autoFillProfileTip = "Verwenden Sie diese Seite, um Autofill-Profile für Dokumenttypen hinzuzufügen. Ein Autofill-Profil hinzufügen, um zusätzliche Eigenschaftswerte mit gescannten Dokumenten zu speichern, die auf Eigenschaftswerten basieren, die Benutzer über den Touchscreen des Multifunktionsdruckers eingeben."/>
<#assign link_dataSourceMenusLabel = "ODBC-Menüs"/>
<#assign link_dataSourceMenusTip = "Auf dieser Seite können Sie ODBC-Menüs hinzufügen. Ein ODBC-Menü dient dazu, Werte aus einer Datenquelle abzurufen und in einem Menü zu verwenden, wobei die Werte einer DocuShare-Dokumenteigenschaft zugewiesen sind. Zwei Arten von Menüs können hinzugefügt werden: einfache oder abhängige Menügruppen."/>
<#assign link_dataSourceDependentMenusLabel = "ODBC-abhängige Menügruppen"/>
<#assign link_dataSourceDependentMenusTip = "Verwenden Sie diese Seite, um eine ODBC-abhängige Menügruppe hinzuzufügen, indem Sie ein oder mehrere abhängige ODBC-Menüs miteinander verknüpfen."/>
<#assign link_heading_serverconfig = "Serverkonfiguration"/>
<#assign link_heading_logs = "Protokolle"/>
<#assign link_heading_odbc = "ODBC-Connectors"/>
<#assign link_heading_Emulator = "Geräteemulator"/>
<#assign link_EmulatorTip = "Auf dieser Seite können Sie das Gerät emulieren."/>
<#assign link_EmulatorLabel="Emulator"/>

<#-- Form validation general strings -->
<#assign validationErrorGeneralMsg="Die folgenden Fehler müssen korrigiert werden."/>
<#assign fieldErrorTitle="Fehler:"/>
<#assign fielderror_empty="Dieses Feld darf nicht leer sein."/>


<#-- Configure Buttons List Page -->
<#assign deleteAction_confirm="Diese Schaltfläche wirklich löschen? Dieser Vorgang kann nicht rückgängig gemacht werden. Fortfahren?"/>
<#assign deleteAction_error="Fehler: Die Schaltfläche konnte nicht gelöscht werden."/>
<#assign deleteAction_success="Die Schaltfläche wurde erfolgreich gelöscht."/>

<#assign configBtnPage_title="Konfigurieren von Schaltflächen"/>
<#assign configBtnPage_subtitle="Auf dieser Seite können Sie DocuShare Scan Services-Schaltflächen für Multifunktionsdrucker hinzufügen und konfigurieren. Zunächst müssen Sie eine neue Schaltfläche für DocuShare Scan Services hinzufügen. Fügen Sie dann untergeordnete Scanschaltflächen und untergeordnete Ordnerschaltflächen (um Scanschaltflächen zu ordnen) unter der Schaltfläche für DocuShare Scan Services hinzu."/>
<#assign link_addScanButtonLabel="Neue Schaltfläche für Scan Services&#8230;"/>
<#assign emptyBtnListMsg="Es wurden noch keine Schaltflächen erstellt."/>
<#assign link_emptyBtnListNewLink="Klicken Sie hier, um eine neue Schaltfläche zu erstellen."/>
<#assign listheading_button="Schaltfläche"/>
<#assign listheading_type="Typ"/>
<#assign listheading_access="Zugriff"/>
<#assign listheading_actions="Aktionen"/>

<#assign buttonTip="Schaltfläche anzeigen/bearbeiten..."/>
<#assign btnTreeBtn_collapse_label="Reduzieren"/>
<#assign btnTreeBtn_expand_label="Erweitern"/>
<#assign btnTreeBtn_collapse_tooltip="Liste der untergeordneten Schaltflächen ausblenden"/>
<#assign btnTreeBtn_expand_tooltip="Liste der untergeordneten Schaltflächen anzeigen"/>

<#assign btnType_service="DocuShare Scan Services-Schaltfläche"/>
<#assign btnType_folder="Ordnerschaltfläche"/>
<#assign btnType_scan="Scanschaltfläche"/>
<#assign groupAccessOnlyLabel="Nur Gruppenzugriff"/>
<#macro groupAccessOnlyTip handle>Auf DocuShare-Gruppe beschränkt (${handle})</#macro>

<#assign action_addFolderBtnLabel="Untergeordnete Ordnerschaltfläche hinzufügen"/>
<#assign action_addFolderBtnTip="Untergeordnete Ordnerschaltfläche hinzufügen"/>
<#assign action_addScanBtnLabel="Untergeordnete Scanschaltfläche hinzufügen"/>
<#assign action_addScanBtnTip="Untergeordnete Scanschaltfläche hinzufügen"/>
<#assign action_editPropsBtnLabel="Einstellungen anzeigen/bearbeiten"/>
<#assign action_editPropsBtnTip="Einstellungen anzeigen/bearbeiten"/>
<#assign action_editPermissionsBtnLabel="Berechtigungen ändern"/>
<#assign action_editPermissionsBtnTip="Berechtigungen ändern"/>
<#assign action_deleteBtnLabel="Schaltfläche löschen"/>
<#assign action_deleteBtnTip="Schaltfläche löschen"/>
<#assign btn_expandtree_label="Alle erweitern"/>
<#assign btn_expandtree_help="Alle untergeordneten Schaltflächen anzeigen"/>
<#assign btn_collapsetree_label="Alle reduzieren"/>
<#assign btn_collapsetree_help="Alle untergeordneten Schaltflächen ausblenden"/>
<#assign colhead_tip_accessLevel="Zugriffsebene (Gast oder DocuShare-Gruppe)"/>
<#assign colhead_tip_scanType="Scanziel (DocuShare-Ordner, Netzwerkordner oder E-Mail)"/>
<#assign scantype_tip_DocuShare="Scanziel: DocuShare-Ordner"/>
<#assign scantype_tip_NetworkFolder="Scanziel: Netzwerkordner"/>
<#assign scantype_tip_Email="Scanausgabe: E-Mail"/>


<#-- Edit Button Settings, Edit Button Permissions, Add Buttons Pages -->
<#macro title_editsettings buttontypelabel buttonlabel>Einstellungen für ${buttontypelabel} bearbeiten: <span class="quiet">${buttonlabel}</span></#macro>
<#assign subtitle_editsettings="Auf dieser Seite können Sie die Schaltflächeneinstellungen bearbeiten."/>
<#macro title_editpermissions buttontypelabel buttonlabel>Berechtigungen für ${buttontypelabel} bearbeiten: <span class="quiet">${buttonlabel}</span></#macro>
<#assign subtitle_editpermissions="Auf dieser Seite können Sie den Zugriff auf die Schaltfläche am Gerät festlegen."/>
<#macro title_add buttontypelabel>Hinzufügen ${buttontypelabel}</#macro>
<#macro subtitle_add buttontypelabel>Auf dieser Seite können Sie eine neue ${buttontypelabel} hinzufügen.</#macro>


<#macro fielderror_userHandleNotFound handle>Der Benutzer mit dem Handle <code>${handle}</code> ist nicht mehr auf der Site verfügbar. Wählen Sie einen anderen Benutzer aus.</#macro>
<#macro fielderror_groupHandleNotFound handle>Die Gruppe mit dem Handle <code>${handle}</code> ist nicht mehr auf der Site verfügbar. Wählen Sie eine andere Gruppe aus.</#macro>
<#macro fielderror_CollectionHandleNotFound handle>Der Ordner mit dem Handle <code>${handle}</code> ist nicht mehr auf der Site verfügbar. Wählen Sie einen anderen Ordner aus.</#macro>
<#assign editbtn_formsubmit_success = "Die Schaltflächeneinstellungen wurden erfolgreich aktualisiert."/>
<#assign editbtn_formsubmit_error = "Fehler. Die Schaltflächenänderungen konnte nicht gespeichert werden."/>

<#assign btn_apply="Übernehmen"/>
<#assign btn_addButton="Schaltfläche hinzufügen"/>
<#assign btn_deleteButton="Schaltfläche löschen"/>
<#assign link_returnToButtonList="Zurück zur Liste der Schaltflächen"/>
<#assign btntitle_Scan="Scanschaltfläche"/>
<#assign btntitle_Service="Funktionsschaltfläche"/>
<#assign btntitle_Folder="Ordnerschaltfläche"/>

<#assign scanOwner_title = "Schaltflächenbesitzer"/>
<#assign scanOwner_description = "Wählen Sie einen DocuShare-Benutzer als Scanschaltflächenbesitzer aus. Wenn der Benutzer noch nicht für das Scan Services-System authentifiziert wurde, wird ein Kennwort benötigt."/>
<#assign scanSettings_title = "Scaneinstellungen"/>
<#assign propLabel_ButtonLabel="Schaltflächenbezeichnung:"/>
<#assign propHelp_ButtonLabel="Auf dem Gerätetouchscreen angezeigter Schaltflächenname"/>

<#assign propLabel_ScanType = "Scanziel:"/>
<#assign propHelp_ScanType = "Ablagebereich zur Speicherung gescannter Dokumente"/>
<#assign optionLabel_ScanType_DocuShare = "DocuShare-Ordner"/>
<#assign optionLabelHint_ScanType_DocuShare = "Gescannte Dokumente werden an einen DocuShare-Ordner gesendet."/>
<#assign optionLabel_ScanType_Folder = "Netzwerkordner"/>
<#assign optionLabelHint_ScanType_Folder = "Gescannte Dokumente an einen Netzwerkordner gesendet."/>
<#assign optionLabel_ScanType_Email = "E-Mail"/>
<#assign optionLabelHint_ScanType_Email = "Sendet gescannte Dokumente an eine E-Mail-Adresse."/>
<#assign optionLabel_ScanType_Email_ServerNotConfiguredLabel = "(Server nicht konfiguriert)"/>
<#assign optionLabel_ScanType_Email_ServerNotConfiguredTip = "Der E-Mail-Server ist nicht konfiguriert. Navigieren Sie zur Seite „E-Mail-Einrichtung“; und kontrollieren Sie, ob die E-Mail-Verbindungseinstellungen korrekt sind."/>

<#assign propLabel_ScanToCollection="Scanziel: DocuShare-Ordner:"/>
<#assign propHelp_ScanToCollection="DocuShare-Zielordner für gescannte Dokumente."/>
<#assign propNote_ScanToCollection="Geben Sie zum Suchen eines Ordners den Ordnertitel ein. WICHTIGER HINWEIS: Nur Ordner, für die der Besitzer eine Schreibberechtigung hat, werden aufgelistet."/>
<#assign noCollectionFoundPlaceholder="Weisen Sie oben einen Schaltflächenbesitzer zu, bevor Sie den Ordner eingeben."/>
<#assign propLabel_ScanToPerCollEnable="Scanziel: Persönlicher Ordner:"/>
<#assign propHelp_ScanToPerCollEnable="Wenn diese Option markiert ist, wird der im Feld „Scanziel: DocuShare-Ordner“ eingegebene Ordner ignoriert, und die gescannten Dokumente werden im persönlichen Ordner des angemeldeten Benutzers abgelegt. Die gescannten Dokumente eines Gastbenutzers werden an den im Feld „Scanziel: DocuShare-Ordner“ definierten Ordner gesendet."/>
<#assign folderNotFound_msg = "Ordner in DocuShare nicht gefunden."/>

<#assign propLabel_Owner="Besitzer:"/>
<#assign propHelp_Owner="Benutzer, der den gescannten Dokumenten zugeordnet ist"/>
<#assign propNote_Owner>Geben Sie zum Suchen den Benutzernamen eines Benutzers ein (z. B. <code>jdoe</code>). WICHTIGER HINWEIS: Nur Benutzer der Ebene Koordinator verwenden.</#assign>
<#assign propLabel_OwnerPassword="Besitzer-Kennwort:"/>
<#assign ownerAuthenticated_msg = "Besitzer authentifiziert"/>
<#assign ownerNotAuthenticated_msg = "Besitzer nicht authentifiziert. Geben Sie ein Kennwort ein, und klicken Sie auf die Schaltfläche „Besitzer authentifizieren“."/>
<#assign btn_AuthenticateOwner_label="Besitzer authentifizieren"/>
<#assign ownerNotFound_msg = "Besitzer im System nicht gefunden. Bitte wiederholen Sie die Suche."/>

<#assign propLabel_folderPath="Scanzielordner:"/>
<#assign propHelp_folderPath="Zielordner im Netzwerk für gescannte Dokumente"/>
<#assign propNote_folderPath>Geben Sie einen Netzwerkordnerpfad im UNC-Format ein. (z. B. <code>\\server\share</code>)</#assign>
<#assign propLabel_folderUser="Ordnerbenutzername:"/>
<#assign propHelp_folderUser="Benutzername des ausgewählten Netzwerkordners"/>
<#assign propLabel_folderPassword="Ordnerkennwort:"/>
<#assign propHelp_folderPassword="Kennwort des ausgewählten Netzwerkordners"/>
<#assign folderTestConnBtn_label="Verbindung testen"/>
<#assign folderTestConn_pleasewait = "Test wird ausgeführt. Bitte warten..."/>
<#assign folderTestConnBtn_success="Die Verbindung wurde hergestellt."/>
<#assign folderTestConnBtn_failure_authenticate="Anmeldefehler: Benutzername oder Kennwort unbekannt."/>
<#assign folderTestConnBtn_failure_unknownDomain="Verbindungsfehler: Domäne unbekannt."/>
<#assign folderTestConnBtn_failure_badNetworkPath="Verbindungsfehler: Netzwerkordner nicht gefunden."/>
<#assign folderTestConnBtn_failure_others="Verbindungsfehler: Die Verbindung zum ausgewählten Netzwerkordner konnte nicht hergestellt werden."/>
<#assign propLabel_exportMeta = "Metadaten exportieren:"/>
<#assign propNote_exportMeta = "Exportieren Sie ausgewählte Metadateneigenschaften (in der folgenden Tabelle mit den Eigenschaftenfeldern) als xml-Datei."/>
<#assign propLabel_browseCollection = "Unterordner während des Scanvorgangs durchsuchen:"/>
<#assign propNote_browseCollection = "Wählen Sie diese Option, um Unterordner auf der Seite für den Gerätescan zu durchsuchen. (Gilt nur für Netzwerkordner oder Scans vom Typ „DocuShare-Ordner“.)"/>
<#assign propLabel_defaultEmailAddress = "Eintrag im Feld „An:“ Adresse:"/>
<#assign propNote_defaultEmailAddress = "Die E-Mail-Adresse, an die der Scan gesendet wird. Bleibt dieses Feld leer, wird die E-Mail-Adresse des angemeldeten Benutzers verwendet, falls verfügbar."/>
<#assign propLabel_scanConfirmation = "Scanbestätigung anzeigen:"/>
<#assign propNote_scanConfirmation = "Diese Option auswählen, um eine Bestätigungsmeldung auf dem Touchscreen des Geräts anzuzeigen, sobald das gescannte Dokument am vorgegebenen Speicherort abgelegt wurde. Je nach Dokumentgröße und erforderlicher Verarbeitung dauert es möglicherweise länger, bis die Bestätigungsmeldung angezeigt wird."/>

<#assign propLabel_DefaultFormat="Standardformat:"/>
<#assign propHelp_DefaultFormat="Standardformat für Dokumentdateien"/>
<#assign optionLabel_DefaultFormat_pdf="Portable Document Format (PDF)"/>
<#assign optionLabelHint_DefaultFormat_pdf="Dokumente werden im PDF-Format gespeichert."/>
<#assign optionLabel_PDF_A = "Portable Document Archive Format (PDF/A)"/>
<#assign optionLabelHint_PDF_A = "Dokumente werden im PDF/A-Format gespeichert, einem auf dem PDF-Standard basierenden Archivierungsformat für die Langzeitarchivierung digitaler Dokumente. Diese Option kann nur ausgewählt werden, sofern sie vom Gerät bzw. vom DocuShare-Server unterstützt wird."/>
<#assign optionLabel_MRC_PDF = "PDF MRC (Mixed Raster Content)" />
<#assign optionLabelHint_MRC_PDF = "Dokumente werden hoch komprimiert im PDF-Format gespeichert. Die auf diese Weise erstellten Dateien zeichnen sich durch sehr gute Lesbarkeit und gute visuelle Qualität bei geringer Größe aus. Diese Option kann nur ausgewählt werden, sofern sie vom Gerät bzw. vom DocuShare-Server unterstützt wird."/>
<#assign optionLabel_MRC_PDF_A = "PDF/A MRC (Mixed Raster Content)"/>
<#assign optionLabelHint_MRC_PDF_A = "Dokumente werden hoch komprimiert im PDF/A-Format für die Langzeitarchivierung gespeichert. Die auf diese Weise erstellten Dateien zeichnen sich durch sehr gute Lesbarkeit und gute visuelle Qualität bei geringer Größe aus. Diese Option kann nur ausgewählt werden, sofern sie vom Gerät bzw. vom DocuShare-Server unterstützt wird."/>

<#assign propLabel_DefaultOCR="Standard-OCR:"/>
<#assign propHelp_DefaultOCR="Standardeinstellung für die optische Zeichenerkennung (OCR)"/>
<#assign optionLabel_DefaultOCR_imageonly="Nur Bild"/>
<#assign optionLabelHint_DefaultOCR_imageonly="Das gescannte Dokument wird in eine Datei im Bildformat umgewandelt."/>

<#assign optionLabel_DefaultOCR_searchable="Durchsuchbar"/>
<#assign optionLabelHint_DefaultOCR_searchable="Das gescannte Dokument wird in eine durchsuchbare Textdatei umgewandelt."/>

<#assign optionLabel_DefaultOCR_searchableByServer="Durchsuchbar (DocuShare-Konvertierung)"/>
<#assign optionLabelHint_DefaultOCR_searchableByServer="Das gescannte Dokument wird mithilfe der Zeichenerkennungssoftware (OCR) von DocuShare in eine durchsuchbare Textdatei umgewandelt."/>
<#assign optionLabel_DefaultOCR_searchableByDevice="Durchsuchbar (Druckerkonvertierung)"/>
<#assign optionLabelHint_DefaultOCR_searchableByDevice="Das gescannte Dokument wird mithilfe der Zeichenerkennungssoftware (OCR) des Multifunktionsdruckers in eine durchsuchbare Textdatei umgewandelt."/>

<#assign optionLabel_SEARCHABLE_IMAGE="Durchsuchbar"/>
<#assign optionLabel_IMAGE_ONLY="Nur Bild"/>

<#assign propLabel_DefaultResolution="Standardauflösung:"/>
<#assign propHelp_DefaultResolution="Standardscanauflösung"/>
<#assign optionLabel_DefaultResolution_300x300="Hohe Qualität (300 x 300 dpi)"/>
<#assign optionLabelHint_DefaultResolution_300x300="Scan mit hoher Auflösung"/>
<#assign optionLabel_DefaultResolution_200x200="Normale Qualität (200 x 200 dpi)"/>
<#assign optionLabelHint_DefaultResolution_200x200="Scan mit normaler Auflösung"/>

<#assign propLabel_scanColor = "Standard-Scanfarbe:"/>
<#assign propHelp_scanColor = "Die Einstellung der Scanfarbe für das Dokument."/>
<#assign scanColorOption_AUTO ="Auto"/>
<#assign scanColorOption_FULL_COLOR ="Vollfarbe"/>
<#assign scanColorOption_GRAYSCALE ="Graustufen"/>
<#assign scanColorOption_BLACK_AND_WHITE ="Schwarz und weiß"/>

<#assign propLabel_ScanOrientation="Scanausrichtung:"/>
<#assign propHelp_ScanOrientation="Dies ist die Scanausrichtung der Vorlage."/>
<#assign scanOrientationOption_Portrait="Hochformat"/>
<#assign scanOrientationOption_Landscape="Querformat"/>
<#assign scanSizeOption_Auto="Auto"/>
<#assign scanSizeOption_Mixed="Gemischt"/>

<#assign propLabel_ExportScanSettings="Scaneinstellungen exportieren:"/>
<#assign propHelp_ExportScanSettings="Ist dieses Kontrollkästchen aktiviert, können die Benutzer des Multifunktionsdruckers vor dem Scannen die Einstellungen für OCR, Dateiformat, Auflösung und Scanfarbe ändern."/>

<#assign propLabel_MfpScanPage="Scanmodus"/>
<#assign optionLabel_OneSided="1-seitig"/>
<#assign optionLabel_TwoSided="2-seitig"/>
<#assign optionLabel_SecondSideRotation="2-seitig, Rückseite gedreht"/>

<#assign label_MfpScanSettings="Scaneinstellungen..."/>
<#assign propLabel_MfpAdv_OCR="Scannen und OCR"/>
<#assign propLabel_MfpAdv_Format="Scanformat"/>
<#assign propLabel_MfpAdv_Resolution="Scanauflösung"/>
<#assign propLabel_MfpAdv_Color="Scanfarbe"/>
<#assign propLabel_MfpAdv_Orientation="Scanausrichtung"/>
<#assign propLabel_MfpAdv_Size="Scanmaterialformat"/>

<#assign networkfilenamesettings_title = "Dateiname einrichten"/>
<#assign networkfilenamesettings_desc = "Geben Sie einen Dateinamen für die gescannten Dokumente und bei Bedarf weitere Informationen ein."/>
<#assign propLabel_networkfilename = "Dateiname"/>
<#assign propLabel_emailfilename = "E-Mail-Betreff"/>
<#assign propLabelHint_networkfilename = "Basisdateiname für gescannte Dokumente"/>

<#assign fieldsettings_title = "Dokumenteigenschaft (Metadaten) einrichten"/>
<#assign fieldsettings_desc = "Geben Sie das Dateiformat zum Speichern gescannter Dokumente an, und wählen Sie aus, welche Eigenschaftenfelder von den Benutzern beim Scannen angezeigt und bearbeitet werden können. Zur Änderung automatisch generierter Eigenschaftenwerte sind Benutzer nicht berechtigt."/>

<#assign fieldsettings_desc = "Geben Sie den Dokumenttyp an, und wählen Sie aus, welche Eigenschaftenfelder von den Benutzern beim Scannen angezeigt und bearbeitet werden können. Zur Änderung automatisch generierter Eigenschaftenwerte sind Benutzer nicht berechtigt."/>

<#assign fieldsettings_desc_networkfolder = "Geben Sie den Dokumenttyp an, und wählen Sie aus, welche Eigenschaftenfelder von den Benutzern beim Scannen angezeigt und bearbeitet werden können. Zur Änderung automatisch generierter Eigenschaftenwerte sind Benutzer nicht berechtigt. Bei Netzwerkordner-Scans wird der Wert des Titelfelds als Dateiname des Dokuments verwendet. Alle anderen Felder werden in eine begleitende XML-Datei exportiert, sofern die Option „Metadaten exportieren“ aktiviert ist."/>

<#assign fieldsettings_desc_email = "Geben Sie den Dokumenttyp an, und wählen Sie aus, welche Eigenschaftenfelder von den Benutzern beim Scannen angezeigt und bearbeitet werden können. Zur Änderung automatisch generierter Eigenschaftenwerte sind Benutzer nicht berechtigt. Bei E-Mail-Scans wird der Wert des Titelfelds als Dateiname der E-Mail-Anlage verwendet. Alle anderen Felder werden in eine angehängte XML-Datei exportiert, sofern die Option „Metadaten exportieren“ aktiviert ist."/>


<#assign propLabel_doctype = "Dokumenttyp:"/>
<#assign propLabelHint_doctype = "Dateiformat, in dem die gescannten Dateien gespeichert werden"/>
<#assign doctype_change_confirm = "Möchten Sie den Dokumenttyp wirklich ändern?  Hierdurch werden die aktuellen Feldeinstellungen entfernt."/>
<#assign propLabel_autoFillProfile = "Autofill-Profil:"/>
<#assign propLabelHint_autoFillProfile = "Wählen Sie ein Profil für diesen Dokumenttyp aus. Das Profil gibt an, dass bestimmte Felder, die einmal während des Scanvorgangs ausgefüllt wurden, andere Eigenschaftenfelder automatisch mit entsprechenden Werten aus einer bestimmten Datenquelle ausfüllen."/>
<#assign optionLabel_autoFillProfile_noProfile ="Kein Profil"/>
<#assign afp_missingfields_error = "Die folgenden Autofill-Profilfelder müssen zur Tabelle mit den Metadatenfeldern hinzugefügt werden:"/>
<#assign dms_missingfields_error = "Die folgenden abhängigen Menügruppenfelder müssen zur Tabelle mit den Metadatenfeldern hinzugefügt werden:"/>
<#assign afp_mappedfield_defaultval_hint = "Der Wert in diesem Feld wird vom Autofill-Profil gesteuert und kann nicht manuell bearbeitet werden. Er wird dynamisch eingetragen, nachdem die für Autofill erforderlichen Felder ausgefüllt wurden."/>

<#assign propLabel_propName="Feld"/>
<#assign propLabelHint_propName="Eigenschaftenfeld, das Benutzern während des Scanvorgangs angezeigt wird. Felder, für die ein Wert eingegeben werden muss, sind mit „(erforderlich)“ gekennzeichnet und können nicht entfernt werden."/>
<#assign propLabel_defaultValue="Standardwert"/>
<#assign propLabelHint_defaultValue="Standardwert für das Eigenschaftenfeld"/>

<#assign propLabel_displayOptions="Anzeigeoptionen"/>
<#assign propLabelHint_displayOptions="Legen fest, wie das Eigenschaftenfeld Benutzern während des Scanvorgangs angezeigt wird."/>
<#assign optionLabel_displayOptions_readonly="Schreibgeschützt"/>
<#assign optionLabelHint_displayOptions_readonly="Das Feld kann während des Scanvorgangs angezeigt, aber nicht bearbeitet werden."/>
<#assign optionLabel_displayOptions_editable="Bearbeitbar"/>
<#assign optionLabelHint_displayOptions_editable="Das Feld kann während des Scanvorgangs bearbeitet werden."/>
<#assign optionLabel_displayOptions_editablerequired="Bearbeitbar und erforderlich"/>
<#assign optionLabelHint_displayOptions_editablerequired="Das Feld kann während des Scanvorgangs bearbeitet werden und ist erforderlich."/>
<#assign optionLabel_displayOptions_hidden="Ausgeblendet"/>
<#assign optionLabelHint_displayOptions_hidden="Das Feld kann während des Scanvorgangs weder angezeigt noch bearbeitet werden."/>

<#assign propLabel_AppendInfo="Zusätzliche Informationen"/>
<#assign propLabelHint_AppendInfo_networkfile="Es können weitere Informationen zum Dateinamen hinzugefügt werden."/>
<#assign optionLabelHint_AppendInfo_networkfile_none="Es können keine Informationen zum Dateinamen hinzugefügt werden."/>

<#assign propLabelHint_AppendInfo="Es können Informationen zum Standardwert hinzugefügt werden."/>
<#assign optionLabel_AppendInfo_none="Keine Informationen hinzufügen"/>
<#assign optionLabelHint_AppendInfo_none="Es können keine Informationen zum Standardwert hinzugefügt werden."/>
<#assign optionLabel_AppendInfo_none_folder="Eindeutige Kennung"/>
<#assign optionLabelHint_AppendInfo_none_folder="Fügt eine Zeichenfolge mit einer eindeutigen Kennung zum Standardwert hinzu. (Nur Netzwerkordner-Scans)"/>
<#assign optionLabel_AppendInfo_timestamp="Zeitstempel"/>
<#assign optionLabelHint_AppendInfo_timestamp>Datum und Uhrzeit werden zum Standardwert hinzugefügt. Beispiel: <code>ScanDok-10.22.13</code></#assign>
<#assign optionLabel_AppendInfo_number="Inkrementelle Nummer"/>
<#assign optionLabelHint_AppendInfo_number>Eine inkrementelle Nummer wird zum Standardwert hinzugefügt. Beispiel: <code>ScanDok-00312</code></#assign>
<#assign optionLabel_AppendInfo_CurrentYear="Aktuelles Jahr"/>
<#assign optionLabelHint_AppendInfo_CurrentYear="Das aktuelle Jahr wird zum Standardwert hinzugefügt."/>
<#assign optionLabel_AppendInfo_CurrentMonth="Aktueller Monat"/>
<#assign optionLabelHint_AppendInfo_CurrentMonth="Der aktuelle Monat wird zum Standardwert hinzugefügt."/>
<#assign optionLabel_AppendInfo_CurrentDayOfMonth="Aktueller Tag des Monats"/>
<#assign optionLabelHint_AppendInfo_CurrentDayOfMonth="Der aktuelle Tag des Monats wird zum Standardwert hinzugefügt, z B. „20“."/>
<#assign optionLabel_AppendInfo_CurrentDayOfWeek="Aktueller Wochentag"/>
<#assign optionLabelHint_AppendInfo_CurrentDayOfWeek="Der aktuelle Wochentag wird zum Standardwert hinzugefügt, z. B. „Montag“."/>
<#assign optionLabel_AppendInfo_Username="Benutzername"/>
<#assign optionLabelHint_AppendInfo_Username="Der Benutzername wird zum Standardwert hinzugefügt."/>
<#assign optionLabel_AppendInfo_Firstname="Vorname"/>
<#assign optionLabelHint_AppendInfo_Firstname="Der Vorname des angemeldeten Benutzers wird zum Standardwert hinzugefügt."/>
<#assign optionLabel_AppendInfo_Lastname="Nachname"/>
<#assign optionLabelHint_AppendInfo_Lastname="Der Nachname des angemeldeten Benutzers wird zum Standardwert hinzugefügt."/>
<#assign optionLabel_AppendInfo_Fullname="Vollständiger Name"/>
<#assign optionLabelHint_AppendInfo_Fullname="Vor- und Nachname des angemeldeten Benutzers werden zum Standardwert hinzugefügt."/>

<#assign propLabel_appendLoc="Einfügen an Stelle"/>
<#assign propLabelHint_appendLoc="Gibt an, wo die Informationen eingefügt werden sollen."/>
<#assign optionLabel_appendLoc_after="Nach dem Standardwert"/>
<#assign optionLabelHint_appendLoc_after="Die Informationen werden nach dem Standardwert eingefügt."/>
<#assign optionLabel_appendLoc_before="Vor dem Standardwert"/>
<#assign optionLabelHint_appendLoc_before="Die Informationen werden vor dem Standardwert eingefügt."/>

<#assign optionLabel_appendLoc_networkfolder_after="Nach dem Dateinamen"/>
<#assign optionLabelHint_appendLoc_networkfolder_after="Die Informationen werden nach dem Dateinamen eingefügt."/>
<#assign optionLabel_appendLoc_networkfolder_before="Vor dem Dateinamen"/>
<#assign optionLabelHint_appendLoc_networkfolder_before="Die Informationen werden vor dem Dateinamen eingefügt."/>
<#assign menuAgentLabel = "ODBC-Menü verwenden:"/>
<#assign menuAgentTip = "Wählen Sie ein vordefiniertes Menü aus, dessen Werte aus einer ODBC-Datenquelle abgerufen werden."/>
<#assign menuAgent_none = "Keine Zuweisung"/>
<#assign odbcMenu_optgrouplabel_simplemenu = "ODBC-Menüs"/>
<#assign odbcMenu_optgrouplabel_dmsets = "Abhängige Menügruppen"/>
<#assign autofillProfile_isMappedField = "Diese Eigenschaft wird vom ausgewählten Autofill-Profil verwendet und automatisch ausgefüllt, wenn ein oder mehrere erforderliche Felder des Autofill-Profils ausgefüllt werden."/>
<#assign autofillProfile_isMappedFieldRequired = "Diese Eigenschaft wird vom ausgewählten Autofill-Profil verwendet und ist für Felder erforderlich, die für Autofill vorgesehen sind."/>
<#assign menuAgent_optionsRequestError = "Fehler: Bei dem Versuch, die Liste der Optionen von der Datenquelle abzurufen, ist ein Fehler aufgetreten."/>

<#assign fieldlist_requiredtag="(erforderlich)"/>
<#assign btn_addfield="Feld hinzufügen"/>
<#assign btn_removefield="Entfernen"/>

<#assign propLabel_accessMethod ="Zugriffsebene:"/>
<#assign propLabelHint_accessMethod ="Ebene für den Zugriff auf die Schaltfläche: Gast oder DocuShare-Gruppe."/>
<#assign optionLabel_accessMethod_guest = "Gast"/>
<#assign optionLabelHint_accessMethod_guest = "Alle Benutzer haben Zugriff auf die Schaltfläche."/>
<#assign optionLabel_accessMethod_group = "DocuShare-Gruppe"/>
<#assign optionLabelHint_accessMethod_group>Nur Mitglieder der jeweiligen DocuShare-Gruppe haben Zugriff auf die Schaltfläche (z. B. <code>Gruppe-123</code>).</#assign>

<#assign optionLabel_inherit = "Vom übergeordneten Element übernehmen:"/>
<#assign optionLabelHint_inherit = "Es wird die Gruppenzugriffseinstellung der übergeordneten Schaltfläche verwendet."/>

<#assign optionLabel_specificgroup = "Gruppe auswählen:"/>
<#assign optionLabelHint_specificgroup = "Geben Sie zur Auswahl einer DocuShare-Gruppe den jeweiligen Titel ein (z. B. „Vertrieb“)."/>
<#assign fieldnote_usergroup = "Geben Sie zum Suchen einer Gruppe den Gruppentitel ein (z. B. „Vertrieb“)."/>

<#assign subFolderSection_title = "Unterordnereinrichtung"/>
<#assign subFolderSection_subtitle = "Legen Sie die Parameter für die automatische Generierung von Unterordnern fest. Wählen Sie aus den unten angezeigten Menüs die Eigenschaften für den Titel von Unterordnern aus. Der Titel des jeweiligen Unterordners ergibt sich aus den beim Scannen eingegebenen Eigenschaftenwerten."/>

<#assign subFolderCollectionLabel_none = "Stammordner auswählen..."/>
<#assign subFolderOptgroup_label_reqfield = "Erforderliche Eigenschaften"/>
<#assign subFolderOptgroup_label_optionalfield = "Optionale Eigenschaften"/>
<#assign subFolderOptgroup_label_userdata = "Eigenschaften des Scanbenutzers"/>
<#assign subFolderOptgroup_label_datadata = "Datumseigenschaften"/>
<#assign subFolderSelectOption_label_none = "Keine"/>

<#assign subFolderSelectOption_label_day = "Aktueller Tag"/>
<#assign subFolderSelectOption_label_week = "Aktueller Wochentag"/>
<#assign subFolderSelectOption_label_month = "Aktueller Monat"/>
<#assign subFolderSelectOption_label_year = "Aktuelles Jahr"/>

<#assign subFolderSelectOption_label_username = "Benutzername"/>
<#assign subFolderSelectOption_label_lname = "Nachname"/>
<#assign subFolderSelectOption_label_fname = "Vorname"/>
<#assign subFolderSelectOption_label_fullname = "Vollständiger Name"/>
<#assign propRequiredbySubFolder ="(für Unterordnereinrichtung erforderlich)"/>

<#assign propRequiredbyAFP = "(Erforderlich für Autofill)"/>

<#assign svcbtnicon_label = "Schaltflächensymbol:"/>
<#assign svcbtnicon_hint = "Auf der Schaltfläche angezeigtes Symbol. Sie können das Standardsymbol verwenden oder ein anderes Symbol auswählen."/>
<#assign btn_editicon_label = "Symbol bearbeiten..."/>
<#assign btn_customizeicon_label = "Anpassen..."/>
<#assign customizeicon_dialog_title = "Schaltflächensymbol anpassen"/>
<#assign customizeicon_newval_uploadicon = "Neues Symbol hochladen:"/>
<#assign customizeicon_newval_default = "Standardsymbol verwenden:"/>
<#assign customizeicon_newval_useexisting = "Vorhandenes Symbol verwenden:"/>

<#assign editsvcbtndialog_title = "Schaltflächensymbol bearbeiten"/>
<#assign editsvcbtndialog_subtitle = "Sie können das Standardsymbol verwenden, eine Bilddatei hochladen oder ein vorhandenes Symbol auf dem Server auswählen."/>
<#assign icon_upload_label = "Neues Symbol hochladen:"/>
<#assign icon_upload_visiblehint>Wählen Sie ein webkonformes Bilddateiformat aus: <code>.gif</code>,<code>.png</code>, or<code>.jpg</code>. Maximale Größe: 128x128 Pixel.</#assign>
<#assign icon_filetypein_label = "Vorhandenes Symbol auswählen:"/>
<#assign icon_resetdefault_label = "Standardsymbol verwenden:"/>
<#assign icon_resetdefault_hint = "Standard-Schaltflächensymbol verwenden"/>
<#assign icon_update_success = "Das Schaltflächensymbol wurde erfolgreich aktualisiert."/>
<#assign icon_update_failure = "Fehler: Das Schaltflächensymbol konnte nicht aktualisiert werden."/>
<#assign editsvcbtndialog_subtitle_noexistingicons = "Es wurden keine Symbole auf dem Server gefunden."/>


<#-- Configure Devices Page -->
<#assign btn_cancelLabel = "Abbrechen"/>
<#assign btn_closeTip = "Schließen"/>

<#assign action_viewDeviceLabel="Geräteeinstellungen bearbeiten&#8230;"/>
<#assign action_viewDeviceTip="Geräteeinstellungen bearbeiten"/>

<#assign action_reassignButtonsFailureMsg="Fehler: Die Schaltflächen konnten nicht für alle Geräte neu zugewiesen werden."/>
<#assign action_reassignButtonsSuccessMsg="Die Schaltflächenzuweisungen für die ausgewählten Geräte wurden erfolgreich aktualisiert."/>
<#assign action_deleteSingleDeviceLabel="Dieses Gerät aus der Liste entfernen"/>
<#assign action_deleteSingleDeviceTip="Gerät entfernen"/>
<#assign action_deleteSingleDeviceConfirmMsg="Dieses Gerät wirklich löschen? Kann nicht rückgängig gemacht werden."/>
<#assign action_deleteSingleDeviceSuccessMsg="Das Gerät wurde erfolgreich gelöscht."/>
<#assign action_deleteSingleDeviceFailureMsg="Fehler: Das Gerät konnte nicht gelöscht werden."/>

<#assign action_deleteMultiDeviceConfirmMsg="Möchten Sie die ausgewählten Geräte wirklich löschen?  Kann nicht rückgängig gemacht werden."/>
<#assign action_deleteMultiDeviceSuccessMsg="Die ausgewählten Geräte wurden erfolgreich gelöscht."/>
<#assign action_deleteMultiDeviceFailureMsg="Fehler: Die ausgewählten Geräte konnten nicht gelöscht werden."/>

<#assign configDevices_title = "Geräte konfigurieren"/>
<#assign configDevices_subtitle = "Auf dieser Seite können Sie Multifunktionsdrucker für DocuShare Scan Services konfigurieren und die Geräteschaltflächen verwalten."/>
<#assign btn_reassignBtnsLabel = "Schaltflächen für ausgewählte Geräte zuweisen/Zuweisung aufheben&#8230;"/>
<#assign btn_reassignBtnsTip = "Schaltflächen für die ausgewählten Geräte zuweisen/Zuweisung aufheben"/>
<#assign btn_deleteSelDevices = "Ausgewählte Geräte löschen&#8230;"/>
<#assign btn_registerDevice = "Neues Gerät hinzufügen&#8230;"/>
<#assign btn_importDevices = "Geräte aus CSV-Datei importieren&#8230;"/>
<#assign devicetable_cbx_selectAll_tip = "Alle Geräte auswählen/Auswahl aufheben"/>
<#assign devicetable_colLabel_name = "Gerätename"/>
<#assign devicetable_colLabel_address = "Host-/IP-Adresse"/>
<#assign devicetable_colLabel_buttons = "Scan Services-Schaltflächen"/>
<#assign devicetable_colLabel_actions = "Aktionen"/>
<#assign devicetable_deviceLabel_tip = "Geräteeinstellungen bearbeiten"/>
<#assign devicetable_nobuttonsassigned = "Keine Schaltflächen zugewiesen"/>
<#assign devicetable_emptytablemsg = "Es wurden noch keine Multifunktionsdrucker registriert."/>
<#assign devicetable_emptytablemsg_registerlinklabel = "Klicken Sie hier, um ein neues Gerät hinzuzufügen."/>
<#assign devicetable_deviceBehindFirewallTip = "Dieses Gerät befindet sich hinter einer Firewall"/>
<#assign devicetable_deviceBehindFirewallColHeadingTip = "Befindet sich das Gerät hinter einer Firewall?"/>

<#assign btn_updateAssignmentsLabel = "Zuweisungen aktualisieren"/>
<#assign editSelectedBtns_dialogtitle = "Scan Services-Schaltflächen auf ausgewählten Geräten bearbeiten"/>
<#assign editSelectedBtns_dialogsubtitle = "Scan Services-Schaltflächen für die ausgewählten Geräte zuweisen/Zuweisung aufheben. Hierdurch wird die Liste der aktuell zugewiesenen Schaltflächen für alle Geräte überschrieben. Durch die Deaktivierung einer Schaltfläche wird diese von allen ausgewählten Geräten entfernt."/>
<#assign link_configurebuttons_label="Seite „Schaltflächen konfigurieren“" />
<#macro nobuttonsinsystemmsg link>Es wurden keine Schaltflächen hinzugefügt. Wechseln Sie zu ${link}, um Schaltflächen hinzuzufügen.</#macro>

<#assign btn_importCSVLabel = "Import"/>
<#assign importDialog_title="Geräte aus CSV-Datei importieren"/>
<#assign importDialog_subtitle="Wählen Sie eine CSV-Datei aus, die die Liste der für DocuShare Scan Services hinzuzufügenden Multifunktionsdrucker enthält."/>
<#assign importCSV_error="Beim Importieren der CSV-Datei ist ein Fehler aufgetreten."/>

<#assign failedBtnReassignDialogTitle = "Fehlgeschlagene Schaltflächenzuweisungen"/>
<#assign failedBtnReassignDialogSubtitle = "Beim Aktualisieren der Schaltflächenzuweisungen auf den folgenden Geräten ist ein Fehler aufgetreten:"/>
<#assign failedBtnReassignDialog_idcolLabel = "ID"/>


<#-- Edit / Add Device Page -->
<#assign editDevicePage_title="Geräteeinstellungen bearbeiten:"/>
<#assign editDevicePage_subtitle1="Hier werden die Geräteinformationen geändert."/>
<#assign editDevicePage_subtitle2="Außerdem werden hier die Schaltflächen für DocuShare Scan Services bearbeitet, die dem Gerät zugewiesen sind."/>

<#assign addDevicePage_title="Neues Gerät hinzufügen"/>
<#assign addDevicePage_subtitle1="Geben Sie die Geräteinformationen ein."/>
<#assign addDevicePage_subtitle2="Weisen Sie dem Gerät Scan Services-Schaltflächen zu."/>

<#assign addDevice_successMsg="Neues Gerät wurde registriert."/>
<#assign addDevice_errorMsg="Fehler: Das Gerät konnte nicht registriert werden."/>
<#assign editDevice_successMsg="Geräteeinstellungen wurden aktualisiert"/>
<#assign editDevice_errorMsg="Fehler: Die Geräteaktualisierungen konnten nicht gespeichert werden."/>

<#assign deviceLabel_label="Gerätebezeichnung:"/>
<#assign deviceLabel_tip="Anzeigename des Xerox-Multifunktionsdruckers"/>

<#assign deviceAddress_label="Geräte-IP-Adresse/Hostname:"/>
<#assign deviceAddress_tip="Netzwerkadresse (IP-Adresse oder DNS-Hostname) des Xerox-Multifunktionsdruckers"/>

<#assign deviceUsername_label="Gerätebenutzername:"/>
<#assign deviceUsername_tip="Administratorbenutzername des Xerox-Multifunktionsdruckers"/>

<#assign devicePassword_label="Gerätekennwort:"/>
<#assign devicePassword_tip="Administratorkennwort des Xerox-Multifunktionsdruckers"/>

<#assign deviceBehindFirewall_label="Gerät hinter Firewall?:"/>
<#assign deviceBehindFirewall_tip="Prüfen Sie, ob sich das Gerät hinter einer Unternehmens-Firewall befindet und die Scan Services- und DocuShare-Server außerhalb liegen."/>

<#assign serviceBtnSectionTitle="Scan Services-Schaltflächen"/>

<#assign advancedBtn="Erweiterte Einstellungen anzeigen &#8250;"/>
<#assign advancedBtn_hide="&#8249; Erweiterte Einstellungen ausblenden"/>
<#assign server_ip_label="Alternative(r) IP-Adresse/Hostname des Scan Services-Servers:"/>
<#assign server_ip_tip="Wenn vom Multifunktionsdrucker keine Verbindung zur Standard-IP-Adresse/zum Standardhostnamen des Scan Services-Servers hergestellt werden kann (z. B., weil die Verbindung über einen VPN-Tunnel mit einer NAT-Adresse erfolgt), kann eine alternative IP-Adresse/ein alternativer Hostname eingegeben werden."/>
<#assign server_defaultNameLabel="Standard-IP-Adresse/Hostname des Scan Services-Servers:"/>
<#assign defaultServerTxt="(Standard)"/>

<#assign editDevicePage_btn_applyLabel="Übernehmen"/>
<#assign editDevicePage_btn_addLabel="Hinzufügen"/>
<#assign editDevicePage_btn_deleteButtonLabel="Gerät löschen"/>
<#assign editDevicePage_link_returnToDeviceListLabel="&#8592; Zurück zur Liste der Geräte"/>


<#--Scanning Log Page -->
<#assign scanningLog_title ="Scanprotokoll"/>
<#assign scanningLog_subtitle ="Auf dieser Seite können Sie aktuelle Scanaufträge anzeigen und das Scanprotokoll herunterladen."/>
<#assign scanningLog_retrieveErrorMsg="Fehler: Das Scanprotokoll konnte nicht abgerufen werden."/>
<#assign btn_downloadLogLabel = "Scanprotokoll im CSV-Format herunterladen&#8230;"/>

<#assign logTable_colLabel_date="Scandatum"/>
<#assign logTable_colLabel_destination="Scanziel"/>
<#assign logTable_colLabel_device="Scangerät"/>
<#assign logTable_colLabel_button="Schaltfläche"/>
<#assign logTable_colLabel_username="Benutzername"/>
<#assign logTable_colLabel_status="Status"/>

<#assign logLoadingMsg="Scanprotokoll wird geladen&#8230;"/>
<#assign logEmptyMsg="Scanprotokoll ist leer."/>
<#assign logpagesize_label = "Seitengröße:"/>
<#assign logpagesize_help = "Maximale Anzahl von Scanaufträgen, die pro Seite angezeigt werden"/>
<#assign logfilesize_label = "Protokollgröße:"/>
<#assign logfilesize_help = "Maximale Anzahl von Scanaufträgen, die in derselben Protokolldatei gespeichert werden. Ändern Sie diese Einstellung ggf. während der Erstkonfiguration von DocuShare Scan Services."/>
<#assign btn_updateLogfilesize_label = "Aktualisieren"/>
<#assign updateLogFileSize_error = "Beim Aktualisieren der Scanprotokollgröße ist ein Fehler aufgetreten."/>
<#assign updateLogFileSize_success = "Die Scanprotokollgröße wurde erfolgreich aktualisiert."/>
<#assign status_succeeded = "Erfolgreich"/>
<#assign status_failed = "Fehlgeschlagen"/>

<#-- Server Log Page -->
<#assign serverLogPage_title = "Serverprotokoll"/>
<#assign serverLogPage_subtitle = "Auf dieser Seite können Sie die Protokollierungsebene des Serverprotokolls ändern und das Serverprotokoll herunterladen."/>
<#assign loglevel_label="Protokollierungsebene"/>
<#assign logLevel_tip="Gibt die Art der Protokollierungsinformationen an, die vom Server aufgezeichnet werden sollen. Die Protokollierungsebenen sind in absteigender Reihenfolge nach Schweregrad der aufgezeichneten Ereignisse aufgelistet. Für die ausgewählte Ebene werden alle Ereignisse des zugehörigen Schweregrads sowie alle Ereignisse mit höherem Schweregrad angezeigt. Auf diese Weise werden beispielsweise mit der Einstellung WARN nur Warnungen, Fehler und schwerwiegende Fehler aufgezeichnet, wohingegen mit der Einstellung TRACE Ereignisse aller Schweregrade erfasst werden."/>
<#assign btn_logDownloadLabel="Protokolldatei herunterladen&#8230;"/>

<#-- Email Service Page -->
<#assign EmailServicePage_title = "E-Mail-Einrichtung"/>
<#assign EmailServicePage_subtitle = "Auf dieser Seite richten Sie einen E-Mail-Server ein, damit die Schaltflächen für E-Mail-Scanziele hinzugefügt werden können."/>
<#assign EmailSetup_serverSectionLabel = "Einstellungen für Postausgangsserver"/>
<#assign EmailSetup_servernameLabel = "Servername/Adresse:"/>
<#assign EmailSetup_servernameTip = "Domänenname oder IP-Adresse des Postausgangsservers"/>
<#assign EmailSetup_protocolLabel = "Protokoll:"/>
<#assign EmailSetup_protocolTip = "Protokoll für den E-Mail-Ausgangsserver. Gültige Werte sind SMTP (Standardeinstellung), SMTP-TLS, SMTP-SSL."/>
<#assign EmailSetup_portLabel = "Port:"/>
<#assign EmailSetup_portTip = "Portnummer für den Postausgangsserver. Standardeinstellung für jedes Protokoll lautet SMTP:25, SMTP-TLS:250, SMTP-SSL:2500."/>
<#assign EmailSetup_emailUsernameLabel = "Benutzername:"/>
<#assign EmailSetup_emailUsernameTip = "Benutzername des Kontos, das zum Senden von E-Mails über den Postausgangsserver autorisiert ist"/>
<#assign EmailSetup_passwordLabel = "Kennwort:"/>
<#assign EmailSetup_passwordTip = "Kennwort für das angegebene Benutzerkonto"/>
<#assign EmailSetup_messageSectionLabel = "Einstellungen für E-Mail-Nachricht"/>
<#assign EmailSetup_defaultFromAddressLabel = "Standard-Absenderadresse:"/>
<#assign EmailSetup_defaultFromAddressTip = "E-Mail-Adresse, die im Feld „Von“ aller ausgehenden E-Mails angezeigt wird, die von DocuShare Scan Services gesendet werden."/>
<#assign EmailSetup_defaultFromAddressExample = "Beispiel: scan-services-scan@mycompany.com"/>
<#assign EmailSetup_subjectLabel = "Standard-Betreffzeile:"/>
<#assign EmailSetup_subjectTip = "Der standardmäßige Text im Feld „Betreff“ für alle ausgehenden Mails, die von DocuShare Scan Services gesendet werden, wenn kein Betreff angegeben wurde."/>
<#assign EmailSetup_subjectExample = "Beispiel: Neues Scandokument von DocuShare Scan Services"/>
<#assign EmailSetup_bodyLabel = "E-Mail-Text:"/>
<#assign EmailSetup_bodyTip = "Der E-Mail-Text für alle ausgehenden E-Mails, die von DocuShare Scan Services gesendet werden."/>
<#assign EmailSetup_bodyExample = "Beispiel: &ldquo;Ein neues gescanntes Dokument von DocuShare Scan Services wurde an Sie gesendet&rdquo;"/>
<#assign EmailSetup_isHTML_label = "HTML für Nachricht verwenden:"/>
<#assign EmailSetup_isHTML_tip = "Aktivieren Sie dieses Kästchen, um HTML-Tags in E-Mail-Text zuzulassen."/>
<#assign EmailSetup_advancedSectionLabel = "Erweiterte Einstellungen"/>
<#assign EmailSetup_timeoutLabel = "Timeout:"/>
<#assign EmailSetup_timeoutTip = "Zeitdauer in Millisekunden, die für einen E-Mail-Sendeversuch oder für einen Verbindungsversuch mit dem Server verstreichen darf. Die Standardeinstellung beträgt 30.000 ms."/>
<#assign EmailSetup_sslcertkeystoreLabel = "SSL-Zertifikats-/Keystore-Datei:"/>
<#assign EmailSetup_sslcertkeystoreTip = "Speicherort der SSL-Keystore-Datei auf dem Server-Dateisystem. Dies ist erforderlich, wenn als E-Mail-Serverprotokoll SMTP-SSL oder SMTP-TLS gewählt wurde. Bei Serverkonten wie Google oder Yahoo, deren Domänen als vertrauenswürdig registriert sind, ist dies nicht immer erforderlich."/>
<#assign EmailSetup_sslcertkeystorePassLabel = "Kennwort für SSL-Zertifikats-/Keystore-Datei:"/>
<#assign EmailSetup_sslcertkeystorePassTip = "Kennwort für die Keystore-Datei"/>
<#assign EmailServicePage_formsubmit_success = "Die E-Mail-Einstellungen wurden gespeichert."/>
<#assign EmailServicePage_formsubmit_error = "Bei dem Versuch, Ihre E-Mail-Einstellungen zu speichern, ist ein Fehler aufgetreten."/>

<#assign EmailServicePage_SendTestEmail_btnLabel = "Test-E-Mail senden..."/>
<#assign EmailSetup_testConnectionWait = "E-Mail wird gesendet. Bitte warten..."/>
<#assign EmailSetup_testConnectionFailure = "Fehler: Bei der Verbindung zum E-Mail-Server ist ein Fehler aufgetreten. Prüfen Sie Ihre Verbindungseinstellungen und versuchen Sie es erneut."/>
<#assign EmailSetup_testConnectionSuccess = "Die E-Mail wurde vom Server gesendet. Überprüfen Sie im Posteingang, ob die Test-Mail eingetroffen ist. Ist dies der Fall, müssen Sie auf „Übernehmen“ klicken, wenn Sie Einstellungen geändert haben."/>
<#assign EmailSetup_testConnection_dialog_title ="Test-E-Mail senden"/>
<#assign EmailSetup_testConnection_dialog_subtitle ="Testen Sie Ihre Einstellungen, indem Sie eine E-Mail senden."/>
<#assign EmailSetup_testConnection_emaillabel ="Test-E-Mail:"/>
<#assign EmailSetup_testConnection_emailtip ="E-Mail-Zieladresse zum Testen Ihrer Einstellungen."/>

<#-- Server Setup Page -->
<#assign ServerSetupPage_title = "Server-Einrichtung"/>
<#assign ServerSetupPage_subtitle = "Diese Seite dient zur Einrichtung des Servers für die Verwendung mit DocuShare Scan Services."/>
<#assign ServerSetupPage_subtitle2 = "Wenn Sie eine oder mehrere Servereinstellungen ändern müssen, nachdem Geräte registriert wurden, sollten Sie die den Geräten zugewiesenen Schaltflächen entfernen, bevor Sie die Änderungen vornehmen."/>
<#assign ServerSetupPage_subtitle3 = "Sie können das Firewall-Kennwort jederzeit ändern, ohne die Geräte erneut zu registrieren."/>
<#assign ServerSetup_nameLabel = "Servername/Adresse:"/>
<#assign ServerSetup_nameTip = "Domänenname oder IP-Adresse des Servers"/>
<#assign ServerSetup_protocolLabel = "Protokoll:"/>
<#assign ServerSetup_prototolTip = "Übertragungsprotokoll (z. B. http, https)"/>
<#assign ServerSetup_portLabel = "Port:"/>
<#assign ServerSetup_portTip = "Der Serverport (e.g., 8000)"/>
<#assign ServerSetup_passwordLabel = "Kennwort für Geräteaktualisierungsprogramm:"/>
<#assign ServerSetup_passwordTip = "Das Kennwort für den Zugang zum Aktualisierungsprogramm, mit dem Geräte neu konfiguriert werden. Händigen Sie dieses Kennwort an die Person aus, die für die Verwaltung der Multifunktionsdrucker zuständig ist, damit die Geräte für den Einsatz mit einer Firewall aktiviert werden können."/>
<#assign ServerSetup_domainLabel = "DocuShare-Domäne:"/>
<#assign ServerSetup_domainTip = "Die Benutzer-/Gruppendomäne in DocuShare."/>
<#assign ServerSetup_firewallPasscodeSubtitle = "Um Geräte hinter einer Firewall für die Verbindung mit DocuShare Scan Services-Server zu aktivieren, müssen die Geräte über das Geräteaktualisierungsprogramm konfiguriert werden. Händigen Sie das Kennwort für das Geräteaktualisierungsprogramm und die Download-URL an die Person aus, die für die Verwaltung der Geräte hinter der Firewall zuständig ist. Das Kennwort wird für den Zugang zum Aktualisierungsprogramm benötigt. Wenn Sie die Servereinstellungen ändern oder ein Gerät hinter einer Firewall registrieren bzw. dessen Registrierung aufheben, müssen Sie das Kennwort für das Geräteaktualisierungsprogramm und die Download-URL erneut eingeben, damit das Programm erneut ausgeführt werden kann. <p>Bevor Sie das Programm verwenden, müssen Sie mindestens ein Gerät hinter einer Firewall registriert und ihm eine Schaltfläche zugewiesen haben. Andernfalls kann die für die Geräteverwaltung zuständige Person nicht auf das Programm zugreifen.</p>"/>
<#assign ServerSetup_registerDeviceBehindFirewallURLLabel = "Download-URL für das Geräteaktualisierungsprogramm:"/>
<#assign ServerSetup_registerDeviceBehindFirewallURLTip = "Die Adresse der Webseite, von der aus die für die Geräteverwaltung der Multifunktionsdrucker zuständige Person eine selbstausführende Utility-Datei zur Konfiguration der Geräte herunterlädt."/>
<#assign ServerSetup_registerDeviceBehindFirewallURLEndNote = "Kopieren Sie diese URL, indem Sie sie auswählen und Strg-C (Befehlstaste-C auf einem Mac) drücken. Dann fügen Sie diese in eine E-Mail ein."/>
<#macro devicesRegisteredEditWarning deviceNum> <strong>Hinweis:</strong> ${deviceNum} Gerät(e) wurden bereits mit diesen Einstellungen registriert. Wenn Sie die Einstellungen ändern, können diese Geräte keine Verbindung mehr mit dem DocuShare Scan Services-Server aufbauen. Heben Sie zunächst die Zuordnung der Schaltflächen für jedes Gerät auf. Kehren Sie dann zu dieser Seite zurück, um die Servereinstellungen zu ändern.</#macro>
<#assign editServerSettingsWhileRegisteredBtnLabel = "Trotzdem Bearbeiten"/>
<#assign ServerSetup_ServerSettingsSectionLabel = "Servereinstellungen"/>
<#assign ServerSetup_FirewallPasscodeSectionLabel = "Firewall-Einstellungen"/>
<#assign ServerSetup_formsubmit_success = "Die Servereinstellungen wurden gespeichert."/>
<#assign ServerSetup_formsubmit_error = "Bei dem Versuch, Ihre Servereinstellungen zu speichern, ist ein Fehler aufgetreten."/>

<#assign ServerSetup_buttonSettings = "Einstellungen für Scanschaltflächen"/>
<#assign ServerSetup_dateFormatLabel = "Datumsformat"/>
<#assign ServerSetup_dateFormatHelp = "Dieses Datumsformat wird verwendet, falls eine Scanschaltfläche ein Datumseigenschaftenfeld enthält. Die Einstellung für das Datumsformat wird nicht für Zeichenfolgeneigenschaften verwendet."/>
<#assign ServerSetup_dateFormatMonthFirst = "mm.tt.jjjj"/>
<#assign ServerSetup_dateFormatDayFirst = "tt.mm.jjjj"/>
<#assign ServerSetup_dateFormatYearFirst = "jjjj-mm-tt"/>
<#assign ServerSetup_dateFormatYearFirst2 = "jjjjmmtt"/>

<#assign ServerSetup_xeroxAppGallery = "Xerox&#174; App Gallery"/>
<#assign ServerSetup_xeroxAppGallerySubtitle = "Xerox&#174; App Gallery bietet DocuShare Scan Services-Apps, mit denen der Funktionsumfang DocuShare Scan Services-fähiger Multifunktionsdrucker erweitert werden kann. Mit der Xerox&#174; Scan-App für DocuShare können DocuShare-Benutzer Dokumente in ihre persönlichen Ordner scannen. <p>Wird die Nutzung der App aktiviert, werden die DocuShare Scan Services-Schaltfläche „Scan to DocuShare-App“ und die Schaltfläche „Persönliche Sammlung“ der Liste der Schaltflächen hinzugefügt. Wird die App deaktiviert, werden diese Schaltflächen aus der Liste entfernt. Bei Verwendung der App auf einem Multifunktionsdrucker, der nicht vom Benutzer konfiguriert wurde, wird eine der für den Benutzer lizenzierten Verbindungen zum Multifunktionsdrucker verwendet.</p>"/>
<#assign ServerSetup_xeroxAppGalleryEnable = "Scan-App für DocuShare aktivieren"/>
<#assign ServerSetup_xeroxAppGalleryEnableHelp = "Dieses Kontrollkästchen aktivieren, um die Nutzung der Scan Services-Anwendung für DocuShare zu gestatten. Mit dieser Anwendung können DocuShare-Benutzer Dokumente in ihre persönlichen Ordner scannen."/>

<#-- Common dbAgent Page Messages. -->
<#assign dsConnectionProgress="Verbindung wird hergestellt. Bitte warten&hellip;"/>
<#assign dsProperty_noMapping = "Keine"/>
<#assign dsWizard_next = "Weiter &#8250;"/>
<#assign dsWizard_back = "&#8249; Zurück"/>
<#assign dbsmPage_delete_btn_label = "Menü löschen"/>
<#assign dbsmPage_apply_btn_label = "Übernehmen"/>
<#assign dbsmPage_return_to_listing_page = "&#8592; Zurück zur Seite mit der Liste der ODBC-Menüs"/>
<#assign dataSourceTable_col_actions = "Aktionen" />
<#assign dataSourceTable_action_Edit_label = "Bearbeiten"/>
<#assign dataSourceTable_action_Delete_label = "Löschen"/>
<#assign dsAssignedButtons = "Zugewiesene Schaltflächen:" />
<#assign dsAssignedDMS = "Zugewiesene abhängige Menügruppen:" />
<#assign dsColumnLookupError = "Spalten für Datenquelle konnten nicht geladen werden."/>
<#assign dsConnectionError = "Verbindung zur Datenquelle konnte nicht hergestellt werden. Prüfen Sie Ihre Verbindungseinstellungen und versuchen Sie es erneut."/>
<#assign dsObjPropsRequiredLookupError = "Optionale Eigenschaften für den ausgewählten Dokumenttyp konnten nicht geladen werden."/>
<#assign dsObjPropsOptionalLookupError = "Erforderliche Eigenschaften für den ausgewählten Dokumenttyp konnten nicht geladen werden."/>
<#assign dbsmNoIllegalCharsError = "Diese Zeichen sind nicht zulässig:"/>
<#assign datasource_prop_mapping_restricted = "Warum kann ich das nicht bearbeiten?"/>
<#assign datasource_prop_mapping_restricted_delete = "Warum kann ich nicht löschen?"/>
<#assign datasource_restricted_modify = "Warum kann ich das nicht übernehmen oder löschen?"/>

<#-- Autofill Profiles Listing Page -->
<#assign AutoFillProfilePage_title = "Autofill-Profile"/>
<#assign AutoFillProfilePage_subtitle = "Verwenden Sie diese Seite, um Autofill-Profile für Dokumenttypen hinzuzufügen. Bei Verwendung eines Autofill-Profils mit einer Scanschaltfläche werden zusätzliche Eigenschaftswerte mit gescannten Dokumenten gespeichert, die auf Eigenschaftswerten basieren, die Benutzer über den Touchscreen des Multifunktionsdruckers eingegeben haben."/>
<#assign btnLabel_AddAutofillProfile = "Autofill-Profil hinzufügen..."/>
<#assign btnLabel_DeleteSelAutofillProfiles = "Ausgewählte löschen"/>
<#assign autofillTable_col_name = "Name des Profils" />
<#assign autofillTable_col_datasource = "ODBC-Typ und Speicherort" />
<#assign autofillTable_col_mapping = "Spalte &rarr; Eigenschaftenzuordnung"/>
<#assign autofillTable_col_tablename = "Tabelle/Arbeitsblatt" />
<#assign autofillTable_col_doctype = "Dokumenttyp" />
<#assign autofillTable_col_actions = "Aktionen" />
<#assign autofillTable_col_buttonsUsing = "Scanschaltflächen-Zuordnungen"/>
<#assign action_deleteAFPConfirmMsg = "Möchten Sie die ausgewählten Profile wirklich löschen?" />
<#assign action_deleteAFPSuccessMsg = "Profile wurden gelöscht." />
<#assign action_deleteAFPFailureMsg = "Beim Löschen der ausgewählten Profile ist ein Fehler aufgetreten." />
<#assign action_deleteAFPMappedFailureMsg = "Fehler: Ein oder mehrere ausgewählte Profile können nicht gelöscht werden, weil sie zurzeit für Scanschaltflächen verwendet werden." />
<#assign useforAutofillTip = "Verwenden Sie dieses Eigenschaftenfeld, um alle vorgesehenen übrigen Felder automatisch auszufüllen."/>
<#assign autofillTable_noAssignedButtons = "Keine"/>
<#assign autofillTable_noProfiles = "Es wurden keine Autofill-Profile eingerichtet. Klicken Sie auf die Schaltfläche „Autofill-Profil hinzufügen“ oben, um ein neues Profil zu erstellen."/>
<#assign autofillTable_action_DeleteDisabled = "Sie können dieses Autofill-Profil nicht löschen, weil es von einer oder mehreren Scanschaltflächen verwendet wird. Entfernen Sie vor dem Löschen die Belegung durch die Schaltflächen auf der jeweiligen Seite „Schaltflächeneinstellungen bearbeiten“."/>

<#-- Autofill Profile Add/Edit Page -->
<#assign AutoFillProfilePage_add_title = "Autofill-Profil hinzufügen" />
<#assign AutoFillProfilePage_add_subtitle = "Um ein Autofill-Profil hinzuzufügen, richten Sie zunächst die ODBC-Verbindung ein und ordnen Sie anschließend DocuShare-Dokumenteigenschaften zu Tabellenspalten zu. " />
<#assign AutoFillProfilePage_edit_title = "Autofill-Profil bearbeiten:" />
<#assign AutoFillProfilePage_edit_subtitle = "Ändern Sie beliebige Einstellungen eines Autofill-Profils." />
<#assign AutoFillProfilePage_mappedBtnWarning = "<strong>Hinweis:</strong> Dieses Profil wird von einer oder mehreren Scanschaltflächen verwendet und kann daher weder geändert noch gelöscht werden. Bevor Sie das Profil ändern oder löschen, entfernen Sie dessen Verwendung auf der jeweiligen Seite „Schaltflächeneinstellungen bearbeiten“."/>

<#assign afp_name_label = "Name des Profils:" />
<#assign afp_name_tip = "Eindeutiger Name für das Autofill-Profil" />
<#assign afp_name_fielderror_duplicatename="Dieser Name wird bereits verwendet. Bitte geben Sie einen anderen Namen ein."/>
<#assign afp_dsconn_heading ="Schritt 1 von 2: ODBC-Verbindung einrichten"/>
<#assign afp_dsconn_subheading ="Geben Sie die Verbindungsinformationen für die Datenquelle ein."/>
<#assign afp_datasource_label = "ODBC-Typ:" />
<#assign afp_datasource_tip = "Der Datenquellentyp" />
<#assign afp_dbname_label = "ODBC-Name/Dateipfad:" />
<#assign afp_dbname_tip = "Geben Sie entweder den Datenbanknamen ein, falls Sie eine serverbasierte Datenbank verwenden, oder geben Sie einen Dateipfad ein, falls Sie auf eine Datenbankdatei auf dem Dateisystem oder eine Microsoft Excel-Tabellendatei hinweisen möchten." />
<#assign afp_username_label = "Benutzername:" />
<#assign afp_username_tip = "Datenbank-Benutzername" />
<#assign afp_password_label = "Kennwort:" />
<#assign afp_password_tip = "Kennwort für den Datenbank-Benutzernamen" />
<#assign afp_host_label = "Host:" />
<#assign afp_host_tip = "IP-Adresse oder DNS der Datenbank" />
<#assign afp_port_label = "Port:" />
<#assign afp_port_tip = "Die Portnummer für die Datenbank" />
<#assign afp_table_label = "Name der Tabelle/des Arbeitsblatts:" />
<#assign afp_table_tip = "Gibt entweder den Namen einer Datenbanktabelle oder den Namen eines Microsoft Excel-Arbeitsblatts an." />
<#assign afp_doctype_label = "Dokumenttyp:" />
<#assign afp_doctype_tip = "DocuShare-Dokumenttyp" />

<#assign afp_return_to_listing_page = "&#8592; Zurück zur Liste mit den Autofill-Profilen"/>
<#assign afp_delete_profile_btn_label = "Profil löschen"/>
<#assign afp_dbsettings_heading = "ODBC-Einstellungen"/>

<#assign afp_mapping_heading = "Schritt 2 von 2: DocuShare-Dokumenteigenschaften zu Tabellenspalten zuordnen"/>
<#assign afp_mapping_subheading = "Ordnen Sie die Spalten aus der angegebenen Datenquellentabelle den Eigenschaften des ausgewählten Dokumenttyps zu. Wenn Benutzer Dokumente an einem Gerät scannen und Werte für die Eigenschaften „Erforderlich für Autofill“ eingeben, werden alle zugeordneten Eigenschaften automatisch mit den korrekten Werten aus der zugeordneten ODBC-Datenquelle ausgefüllt. Hinweis: Um ein Profil hinzuzufügen oder zu speichern, benötigen Sie mindestens ein erforderliches zugeordnetes Feld (Erforderlich für Autofill) und ein optional zugeordnetes Feld."/>
<#assign afp_mapping_table_colhead_name = "Spaltenname"/>
<#assign afp_mapping_table_colhead_dsprop = "DocuShare-Eigenschaft"/>
<#assign afp_mapping_table_colhead_primary = "Erforderlich für Autofill"/>
<#assign afp_mapping_table_colhead_primary_tip = "Wählen Sie die Felder aus, die einen Wert benötigen, damit die anderen zugeordneten Felder automatisch ausgefüllt werden."/>
<#assign afp_mapping_table_notsetup = "Wählen Sie eine Tabelle/ein Arbeitsblatt und einen DocuShare-Dokumenttyp als Datenquelle aus, um die Eigenschaftenzuordnung für die Autofill-Funktion einzurichten."/>

<#assign afp_mapping_property_requiredFields = "Erforderliche Felder"/>
<#assign afp_mapping_property_optionalFields = "Optionale Felder"/>
<#assign afp_edit_successMsg = "Das Autofill-Profil wurde aktualisiert."/>
<#assign afp_edit_failureMsg = "Fehler: Beim Aktualisieren des Autofill-Profils ist ein Fehler aufgetreten."/>
<#assign afp_add_successMsg = "Ein Autofill-Profil wurde hinzugefügt."/>
<#assign afp_add_failureMsg = "Fehler: Beim Hinzufügen des Autofill-Profils ist ein Fehler aufgetreten."/>
<#assign action_deleteSingleAFPConfirmMsg = "Dieses Autofill-Profil wirklich löschen? Kann nicht rückgängig gemacht werden."/>
<#assign action_deleteSingleAFPSuccessMsg = "Das Autofill-Profil wurde gelöscht."/>
<#assign action_deleteSingleAFPFailureMsg = "Fehler: Beim Löschen des Autofill-Profils ist ein Fehler aufgetreten."/>
<#assign noAutofillCbxError = "Bitte aktivieren Sie mindestens ein Kontrollkästchen „Erforderlich für Autofill“."/>
<#assign twoMappedFieldMinimumError = "Um ein Profil hinzuzufügen oder zu speichern, benötigen Sie mindestens ein erforderliches zugeordnetes Feld (Erforderlich für Autofill) und ein optional zugeordnetes Feld."/>
<#assign afp_EditDisabled = "Sie können dieses Autofill-Profil nicht löschen oder ändern, weil es von einer oder mehreren Scanschaltflächen verwendet wird. Bevor Sie das Profil löschen oder ändern, entfernen Sie die Belegung durch die Schaltflächen auf der jeweiligen Seite „Schaltflächeneinstellungen bearbeiten“ Siehe die Liste der zugeordneten Scanschaltflächen."/>



<#-- Simple Datasource Menus Listing Page -->
<#assign DatasourceMenuPage_title = "ODBC-Menüs" />
<#assign DatasourceMenuPage_subtitle = "Auf dieser Seite können Sie ODBC-Menüs hinzufügen. Ein ODBC-Menü dient dazu, Werte aus einer Datenquelle abzurufen und in einem Menü zu verwenden, wobei die Werte einer DocuShare-Dokumenteigenschaft zugewiesen sind." />
<#assign btnLabel_AddDatasourceMenu = "ODBC-Menü hinzufügen..."/>
<#assign btnLabel_DeleteSelDataSourceMenus = "Ausgewählte löschen"/>
<#assign dataSourceTable_col_menuname = "Name" />
<#assign dataSourceTable_col_type = "Typ" />
<#assign dataSourceTable_col_datasource = "ODBC-Typ und Speicherort" />
<#assign dataSourceTable_col_tablesource = "Menübezeichnung und Quellenwert (Tabelle/Spalte)"/>
<#assign dataSourceTable_col_tablesource_label = "Bezeichnung:"/>
<#assign dataSourceTable_col_tablesource_value = "Wert:"/>
<#assign dataSourceTable_col_property = "Zugeordnet zu DocuShare-Eigenschaft (Dokumenttyp/-eigenschaft)" />
<#assign dataSourceTable_col_dms = "Zuordnungen für abhängige Menügruppen">
<#assign dataSourceTable_type_dsMenuTip = "Einfaches ODBC-Menü">
<#assign dataSourceTable_empty = "Es wurden keine ODBC-Menüs eingerichtet. Klicken Sie auf die Schaltfläche „ODBC-Menü hinzufügen“ oben, um ein neues Menü zu erstellen."/>

<#assign dsm_deleteaction_mappedbtn_msg="Dieses ODBC-Menü wird von einer oder mehreren <strong>Scanschaltflächen</strong> verwendet. Entfernen Sie vor dem Löschen die Belegung durch die Schaltflächen auf der jeweiligen Seite „Schaltflächeneinstellungen bearbeiten“."/>
<#assign dsm_deleteaction_dm_msg="Dieses ODBC-Menü wird von einer oder mehreren <strong>abhängigen Menügruppen</strong> verwendet. Entfernen Sie vor dem Löschen diese Verwendung aus jeder der abhängigen Menügruppen."/>
<#assign dsm_deleteaction_mappedbtnanddm_msg="Dieses ODBC-Menü wird von einer oder mehreren <strong>abhängigen Menügruppen</strong> und <strong>Scanschaltflächen</strong> verwendet. Durch Löschen des Menüs würden alle zugewiesenen Scanschaltflächen oder abhängigen Menügruppen funktionsunfähig. Bevor Sie es löschen können, müssen Sie jede zugewiesene Verwendung für jede abhängige Menügruppe und Scanschaltfläche entfernen."/>
<#assign dbsmPage_mappingDisabledPropTip = "Dieses ODBC-Menü wird von einer oder mehreren zugewiesenen Scanschaltflächen verwendet. Durch Bearbeiten des Menüs würden alle zugewiesenen Scanschaltflächen funktionsunfähig. Bevor Sie diese Eigenschaft bearbeiten können, müssen Sie die Verwendung von jeder zugewiesenen Scanschaltfläche entfernen."/>

<#-- ODBC Menu Add/Edit Page -->
<#assign dbsmPage_add_title = "ODBC-Menü hinzufügen" />
<#assign dbsmPage_add_subtitle = "Um ein ODBC-Menü hinzuzufügen, richten Sie zunächst die ODBC-Verbindung ein und weisen Sie anschließend das ODBC-Menu einer DocuShare-Dokumenteigenschaft zu." />
<#assign dbsmPage_edit_title = "ODBC-Menü bearbeiten:" />

<#assign dbsmPage_mappedBtnWarning = "Dieses ODBC-Menü wird von einer oder mehreren <strong>Scanschaltflächen</strong> verwendet, daher lassen sich der zugewiesene Dokumenttyp und die DocuShare-Eigenschaftswerte (siehe Schritt 2) nicht bearbeiten  Entfernen Sie zunächst die entsprechende Verwendung durch die zugewiesenen Schaltflächen (siehe Zuordnungsliste), und kehren Sie anschließend hierher zurück, um die Eigenschaften zu bearbeiten oder das Menü zu löschen."/>
<#assign dbsmPage_mappedDMSWarning = "Dieses ODBC-Menü wird von einer oder mehreren <strong>abhängigen Menügruppen</strong> verwendet. Daher können seine Einstellungen nicht geändert werden. Entfernen Sie zunächst dessen Verwendung aus den aufgeführten zugeordneten, abhängigen Menügruppen, und kehren Sie anschließend hierher zurück, um Änderungen vorzunehmen."/>
  <#assign dbsmPage_mappedBtnAndDMSWarning = "Dieses ODBC-Menü wird von einer oder mehreren <strong>abhängigen Menügruppen</strong> und <strong>Scanschaltfläche</strong> verwendet. Falls dieses Menü in abhängigen Menügruppen verwendet wird, lassen sich seine Einstellungen nicht ändern. Entfernen Sie zunächst dessen Verwendung aus den aufgeführten zugeordneten, abhängigen Menügruppen, und kehren Sie anschließend hierher zurück, um Änderungen vorzunehmen. Wenn das Menü einer Scanschaltfläche zugeordnet ist, können sein Dokumenttyp und die DocuShare-Eigenschaftenwerte (siehe Schritt 2) nicht geändert werden."/>

<#assign dbsmPage_edit_subtitle = "Ändern Sie beliebige Einstellungen eines ODBC-Menüs." />
<#assign dbsm_name_label = "Name des Menüs:"/>
<#assign dbsm_name_tip = "Eindeutiger Name für das ODBC-Menü"/>
<#assign dbsm_name_fielderror_duplicatedtitle="Es existiert bereits ein ODBC-Menü mit diesem Namen. Bitte geben Sie einen eindeutigen Namen ein."/>
<#assign dbsm_property_label = "DocuShare-Eigenschaft:"/>
<#assign dbsm_property_tip = "Die DocuShare-Eigenschaft für das Menü mit Optionen aus den ODBC-Daten"/>
<#assign dbsm_columnforlabel_label = "Spalte für Menübezeichnung:"/>
<#assign dbsm_columnforlabel_tip = "Die Datenquellenspalte für die Liste der Menüoptionenwerte. Standardmäßig wird diese auf dieselbe Spalte eingestellt wie der Menüwert."/>
<#assign dbsm_columnforvalue_label = "Spalte für Menüwert:"/>
<#assign dbsm_columnforvalue_tip = "Die Datenquellenspalte für die Liste der Menüoptionenwerte"/>
<#assign dbsmPage_mapping_title = "Schritt 2 von 2: ODBC-Menü einer DocuShare-Eigenschaft zuweisen"/>
<#assign dbsmPage_mapping_subtitle = "Wählen Sie eine Tabelle bzw. ein Arbeitsblatt und eine Spalte aus der ausgewählten Datenquelle aus, die als Werte für ein ODBC-Menü verwendet werden sollen. Sie können optional auch eine Spalte auswählen, die als Bezeichnung für eine Menüoption verwendet werden soll. Wählen Sie anschließend einen DocuShare-Dokumenttyp und eine seiner Eigenschaften aus, die für das Menü verwendet werden soll, dessen Optionen während des Scanvorgangs eingetragen werden sollen."/>

<#assign dbsmPage_prop_mappingdisabledwarningtp = ""/>

<#assign dbsmPage_edit_successMsg = "Das ODBC-Menü wurde aktualisiert."/>
<#assign dbsmPage_edit_failureMsg = "Fehler: Beim Aktualisieren des ODBC-Menüs ist ein Fehler aufgetreten."/>
<#assign dbsmPage_add_successMsg = "Ein ODBC-Menü wurde hinzugefügt."/>
<#assign dbsmPage_add_failureMsg = "Fehler: Beim Hinzufügen des ODBC-Menüs ist ein Fehler aufgetreten."/>

<#assign action_deleteDSMenuConfirmMsg = "Möchten Sie die ausgewählten ODBC-Menüs wirklich löschen? Kann nicht rückgängig gemacht werden."/>
<#assign action_deleteDSMenuSuccessMsg = "Sie haben die ausgewählten ODBC-Menüs gelöscht."/>
<#assign action_deleteDSMenuFailureMsg = "Fehler: Beim Löschen des ausgewählten ODBC-Menüs ist ein Fehler aufgetreten."/>
<#assign action_deleteDSMenuMappedFailureMsg = "Fehler: Eines oder mehrere der ausgewählten ODBC-Menüs werden von Scanschaltflächen oder abhängigen Menügruppen verwendet und können nicht gelöscht werden."/>

<#assign action_deleteSingleDSMenuConfirmMsg = "Möchten Sie dieses ODBC-Menü wirklich löschen? Kann nicht rückgängig gemacht werden."/>
<#assign action_deleteSingleDSMenuSuccessMsg = "Das ODBC-Menü wurde gelöscht."/>
<#assign action_deleteSingleDSMenuFailureMsg = "Fehler: Beim Löschen des ODBC-Menüs ist ein Fehler aufgetreten."/>


<#-- ODBC Dependent Menu Set Listing Page -->
<#assign dmsPage_title = "ODBC-abhängige Menügruppen" />
<#assign dmsPage_subtitle = "Verwenden Sie diese Seite, um eine ODBC-abhängige Menügruppe hinzuzufügen, indem Sie ein oder mehrere abhängige ODBC-Menüs miteinander verknüpfen." />
<#assign dmsPage_addBtn = "ODBC-abhängige Menügruppe hinzufügen..."/>
<#assign dmsPage_deleteSelectedBtn = "Ausgewählte löschen"/>

<#assign dmsPage_action_deleteConfirmMsg_multi = "Möchten Sie die ausgewählten ODBC-abhängigen Menügruppen wirklich löschen?" />
<#assign dmsPage_action_deleteSuccessMsg_multi = "Die ausgewählten ODBC-abhängigen Menügruppen wurden gelöscht." />
<#assign dmsPage_action_deleteFailureMsg_multi = "Beim Löschen der ausgewählten ODBC-abhängigen Menügruppen ist ein Fehler aufgetreten." />
<#assign dmsPage_action_deleteFailureMappingMsg_multi = "Fehler: Eine oder mehrere der ausgewählten Gruppen werden für Scanschaltflächen verwendet und können nicht gelöscht werden." />
<#assign dmsPage_action_deleteConfirmMsg_single = "Möchten Sie die ausgewählte ODBC-abhängige Menügruppe wirklich löschen?" />
<#assign dmsPage_action_deleteSuccessMsg_single= "Die ausgewählte ODBC-abhängige Menügruppe wurde gelöscht." />
<#assign dmsPage_action_deleteFailureMsg_single = "Beim Löschen der ausgewählten ODBC-abhängigen Menügruppe ist ein Fehler aufgetreten." />

<#assign dmsPage_table_empty = "Es wurden keine ODBC-abhängigen Menügruppen eingerichtet. Klicken Sie auf die Schaltfläche „ODBC-abhängige Menügruppe hinzufügen“ oben, um eine neue Gruppe zu erstellen.">
<#assign dmsPage_table_iconTip = "ODBC-abhängige Menügruppe">
<#assign dmsPage_table_col_name = "Name der Menügruppe">
<#assign dmsPage_table_col_menus = "Verwendete Menüs">
<#assign dmsPage_table_col_btnsassigned = "Schaltflächen">
<#assign dmsPage_table_col_actions = "Aktionen">
<#assign dmsPage_table_col_action_DeleteDisabled = "Sie können diese abhängige Menügruppe nicht löschen, weil sie von einer oder mehreren Scanschaltflächen verwendet wird. Bevor Sie die Menügruppe löschen, entfernen Sie die Verwendung von jeder Schaltfläche auf der Seite „Schaltflächeneinstellungen bearbeiten“."/>


<#-- ODBC Dependent Menu Set Add/Edit Page -->
<#assign dmPage_add_title = "ODBC-abhängige Menügruppe hinzufügen"/>
<#assign dmPage_add_subtitle = "Wählen Sie eine Reihe bestehender ODBC-Menüs aus, die aufgrund ihrer Werte voneinander abhängig sind. Wählen Sie ein Hauptmenü und anschließend ein oder mehrere abhängige Menüs aus. Ordnen Sie die Bezeichnung jeder Menüoption einem Wert aus der Tabellenspalte für die Datenquelle zu, um eine Verknüpfung zum abhängigen Menü herzustellen."/>
<#assign dmPage_edit_title = "ODBC-abhängige Menügruppe bearbeiten:"/>
<#assign dmPage_edit_subtitle = "Ändern Sie beliebige Einstellung der ODBC-abhängigen Menügruppe."/>
<#assign dmPage_mappedBtnWarning = "<strong>Hinweis:</strong> Da diese abhängige Menügruppe von einer oder mehreren Scanschaltflächen verwendet wird, können Sie die Menüoptionen ihrer Datenquelle weder ändern noch die Gruppe löschen. Entfernen Sie zunächst die Verwendung der abhängigen Menügruppe auf der Seite „Schaltflächeneinstellungen bearbeiten“ für jede Schaltfläche, und kehren Sie zu dieser Seite zurück, um die Menüoptionen der Datenquelle zu ändern oder die Gruppe zu löschen. Sie können die Einstellungen im Bereich „Menüwerte zuordnen“ ändern."/>
<#assign dmPage_mappedBtnNoDeleteTip = ""/>

<#assign dmPage_profileName_label="Name der abhängigen Menügruppe:"/>
<#assign dmPage_profileName_tip="Eindeutiger Name für die ODBC-abhängige Menügruppe"/>
<#assign dmPage_profileName_fielderror_duplicatedtitle="Es existiert bereits eine ODBC-abhängige Menügruppe mit diesem Namen. Bitte geben Sie einen eindeutigen Namen ein."/>
<#assign dmPage_section_SelectODBCMenus = "Datenquellenmenüs auswählen"/>
<#assign dmPage_section_SelectODBCMenus_subtitle = "Wählen Sie ein Hauptmenü und anschließend ein oder mehrere abhängige Menüs aus, die aufgrund ihrer Werte voneinander abhängen."/>
<#assign dmPage_primaryMenuLabel= "Hauptmenü:"/>
<#assign dmPage_primaryMenuTip= "Das primäre ODBC-Menü in der Gruppe. Es nutzt die Datenbank-, Tabellen- und Spalteneinstellungen des ODBC-Menüs."/>
<#assign dmPage_dependentMenuLabel1= "Abhängiges Menü 1:"/>
<#assign dmPage_dependentMenuTip1= "Das erste abhängige ODBC-Menü in der Gruppe. Es nutzt nur die Datenbank- und Tabelleneinstellungen des ODBC-Menüs."/>
<#assign dmPage_dependentMenuLabel2= "Abhängiges Menü 2:"/>
<#assign dmPage_dependentMenuTip2= "Das zweite abhängige ODBC-Menü in der Gruppe. Es nutzt nur die Datenbank- und Tabelleneinstellungen des ODBC-Menüs."/>
<#assign dmPage_add_dm="Abhängiges Menü hinzufügen"/>
<#assign dmPage_remove_dm="Abhängiges Menü entfernen"/>
<#assign dmPage_menuoption_none="Keine"/>
<#assign dmPage_noODBCMenus = "Sie können keine ODBC-abhängige Menügruppe hinzufügen, da keine ODBC-Menüs vorhanden sind. Navigieren Sie zur Seite „ODBC-Menüs“ um eines hinzuzufügen."/>

<#assign dmPage_section_MapMenuValues = "Menüwerte zuordnen"/>
<#assign dmPage_section_MapMenuValues_subtitle = "Ordnen Sie die Werte für jede Menüoption dem entsprechenden abhängigen Menü zu, indem Sie die Datenquellenspalte für die Menüwerte und optional für seine Bezeichnungen einrichten."/>
<#assign dmPage_returntolisting = "&#8592; Zurück zur Liste der ODBC-abhängigen Menügruppen"/>
<#assign dmPage_mapingtable_emptyoptionshelp="&larr; Wählen Sie Spalten für Optionsbezeichnungen und Werte aus."/>
<#assign dmPage_addBtnLabel="Hinzufügen"/>
<#assign dmPage_deleteBtnLabel="Menügruppe löschen"/>
<#assign dmPage_colMenuNoSelection="Spalte auswählen&#8230;"/>
<#assign dmPage_maptblhdr_mapping ="Zuordnung"/>
<#assign dmPage_maptblhdr_options ="Optionen"/>
<#assign dmPage_maptblhdr_optscolsubheading ="Bezeichnung: Wert"/>
<#assign dmPage_maptblhdr_colforlabel ="Spalte für Bezeichnung"/>
<#assign dmPage_maptblhdr_colforvalue ="Spalte für Wert"/>


<#-------------------------------------->
<#---------- MFD UI Messages ----------->
<#-------------------------------------->
<#assign browseCollection_MenuLabel = "Ordner auswählen:">
<#assign browseCollection_selectBtnLabel = "Ordner auswählen"/>
<#assign browseCollection_ResponseError = "Fehler: Der Ordner wurde nicht gefunden, oder es liegt ein Verbindungsproblem mit dem DocuShare-Server vor."/>
<#assign browseCollection_UpOneLevel = "Eine Ebene nach oben"/>

<#assign browseFolder_MenuLabel = "Ordner auswählen:">
<#assign browseFolder_selectBtnLabel = "Ordner auswählen"/>
<#assign browseFolder_ResponseError = "Fehler: Der Netzwerkordner wurde nicht gefunden, oder es liegt ein Netzwerkverbindungsproblem vor."/>
<#assign emailSubjectLabel = "E-Mail-Betreff"/>
<#assign folderSubjectLabel = "Dateiname"/>
<#assign sendingScanToTxt = "Scan senden an:"/>

<#-- MFP Device Emulator List Page -->

<#assign EmulatorPage_title="Multifunktionsdrucker-Emulator"/>
<#assign EmulatorPage_subtitle="Auf dieser Seite können Sie den Multifunktionsdrucker emulieren. Klicken Sie auf eine beliebige Schaltfläche, um den Scanvorgang zu starten."/>


