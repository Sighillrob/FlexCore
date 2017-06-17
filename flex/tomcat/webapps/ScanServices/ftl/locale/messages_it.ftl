<#-------------------------------------->
<#-------- Admin UI Messages ----------->
<#-------------------------------------->

<#-- StandAlone Menu -->
<#assign standalone_menu_title = "Menu Scan Services"/>
<#assign link_configBtnsLabel="Configura pulsanti"/>
<#assign link_configBtnsTip="Aggiungere e configurare i pulsanti di Scan Services per utilizzarli sulle stampanti multifunzione."/>
<#assign link_configDevicesLabel="Configura dispositivi"/>
<#assign link_configDevicesTip="Configurare le stampanti multifunzione per utilizzarle con Scan Services di DocuShare e gestire i pulsanti assegnati ai dispositivi."/>
<#assign link_scanLogLabel="Registro scansioni"/>
<#assign link_scanLogTip="Visualizzare le attività recenti di scansione e scaricare il registro di tutti i lavori di scansione."/>
<#assign link_logSettingsLabel="Registro server"/>
<#assign link_logSettingsTip="Modificare il livello di registrazione del server e scaricare il registro del server."/>
<#assign link_emailServiceLabel="Configurazione e-mail"/>
<#assign link_emailServiceTip="Configurare il servizio e-mail."/>
<#assign link_configureServerLabel="Impostazione server" />
<#assign link_configureServerTip="Configurare le impostazioni per il server di Scan Services di DocuShare." />
<#assign link_autoFillProfileLabel = "Profili di compilazione automatica"/>
<#assign link_autoFillProfileTip = "Utilizzare questa pagina per aggiungere profili di compilazione automatica per i tipi di documento. Aggiungere un profilo di compilazione automatica per includere valori di proprietà aggiuntivi nei documenti scansiti che siano basati su quelli inseriti dagli utenti sullo schermo sensibile del dispositivo MFP."/>
<#assign link_dataSourceMenusLabel = "Menu ODBC"/>
<#assign link_dataSourceMenusTip = "Utilizzare questa pagina per aggiungere menu ODBC. Aggiungere un menu ODBC per recuperare da un'origine dati i valori utilizzati in un menu assegnato a una proprietà documento DocuShare. Si possono aggiungere due tipologie di menu: menu semplici o serie di menu dipendenti."/>
<#assign link_dataSourceDependentMenusLabel = "Serie di menu ODBC dipendenti"/>
<#assign link_dataSourceDependentMenusTip = "Utilizzare questa pagina per aggiungere una serie di menu ODBC dipendenti collegando uno o più menu ODBC predefiniti."/>
<#assign link_heading_serverconfig = "Configurazione server"/>
<#assign link_heading_logs = "Registri"/>
<#assign link_heading_odbc = "Connettori ODBC"/>
<#assign link_heading_Emulator = "Emulatore dispositivo"/>
<#assign link_EmulatorTip = "Utilizzare questa pagina per emulare il dispositivo"/>
<#assign link_EmulatorLabel="Emulatore"/>

<#-- Form validation general strings -->
<#assign validationErrorGeneralMsg="Correggere gli errori indicati qui sotto."/>
<#assign fieldErrorTitle="Errore:"/>
<#assign fielderror_empty="il campo non può essere vuoto."/>


<#-- Configure Buttons List Page -->
<#assign deleteAction_confirm="Eliminare questo pulsare? L'operazione non può essere annullata. Continuare?"/>
<#assign deleteAction_error="Errore: Impossibile eliminare il pulsante."/>
<#assign deleteAction_success="Pulsante eliminato correttamente."/>

<#assign configBtnPage_title="Configura pulsanti"/>
<#assign configBtnPage_subtitle="Utilizzare questa pagina per aggiungere e configurare i pulsanti di Scan Services di DocuShare per utilizzarli sulle stampanti multifunzione. Per iniziare, aggiungere un nuovo pulsante per Scan Services di DocuShare. Quindi aggiungere pulsanti secondari per eseguire scansioni e utilizzare le directory (in modo da organizzare i pulsanti di scansione) sotto il pulsante Scan Services di DocuShare."/>
<#assign link_addScanButtonLabel="Nuovo pulsante Scan Services &#8230;"/>
<#assign emptyBtnListMsg="Non è stato ancora creato alcun pulsante."/>
<#assign link_emptyBtnListNewLink="Fare clic qui per creare un nuovo pulsante."/>
<#assign listheading_button="Pulsante"/>
<#assign listheading_type="Tipo"/>
<#assign listheading_access="Accedi"/>
<#assign listheading_actions="Azioni"/>

<#assign buttonTip="Visualizza/Modifica pulsante..."/>
<#assign btnTreeBtn_collapse_label="Comprimi"/>
<#assign btnTreeBtn_expand_label="Espandi"/>
<#assign btnTreeBtn_collapse_tooltip="Nasconde l'elenco dei pulsanti secondari."/>
<#assign btnTreeBtn_expand_tooltip="Mostra l'elenco dei pulsanti secondari."/>

<#assign btnType_service="Pulsanti di Scan Services di DocuShare"/>
<#assign btnType_folder="Pulsante Cartella"/>
<#assign btnType_scan="Pulsante Scansione"/>
<#assign groupAccessOnlyLabel="Solo accesso di gruppo"/>
<#macro groupAccessOnlyTip handle>Limitato al gruppo DocuShare (${handle})</#macro>

<#assign action_addFolderBtnLabel="Aggiungi pulsante di cartella secondario"/>
<#assign action_addFolderBtnTip="Aggiungi pulsante di cartella secondario"/>
<#assign action_addScanBtnLabel="Aggiungi pulsante di scansione secondario"/>
<#assign action_addScanBtnTip="Aggiungi pulsante di scansione secondario"/>
<#assign action_editPropsBtnLabel="Visualizza/Modifica impostazioni"/>
<#assign action_editPropsBtnTip="Visualizza/Modifica impostazioni"/>
<#assign action_editPermissionsBtnLabel="Modifica autorizzazioni"/>
<#assign action_editPermissionsBtnTip="Modifica autorizzazioni"/>
<#assign action_deleteBtnLabel="Elimina pulsante"/>
<#assign action_deleteBtnTip="Elimina pulsante"/>
<#assign btn_expandtree_label="Espandi tutto"/>
<#assign btn_expandtree_help="Consente di mostrare tutti i pulsanti secondari."/>
<#assign btn_collapsetree_label="Comprimi tutto"/>
<#assign btn_collapsetree_help="Consente di nascondere tutti i pulsanti secondari."/>
<#assign colhead_tip_accessLevel="Livello di accesso (ospite o gruppo DocuShare)"/>
<#assign colhead_tip_scanType="Tipo di scansione (cartella DocuShare, cartella di rete o e-mail)"/>
<#assign scantype_tip_DocuShare="Scansione su cartella DocuShare"/>
<#assign scantype_tip_NetworkFolder="Scansione su cartella di rete"/>
<#assign scantype_tip_Email="Scansione su e-mail"/>


<#-- Edit Button Settings, Edit Button Permissions, Add Buttons Pages -->
<#macro title_editsettings buttontypelabel buttonlabel>Modifica impostazioni di ${buttontypelabel}: <span class="quiet">${buttonlabel}</span></#macro>
<#assign subtitle_editsettings="Utilizzare questa pagina per modificare le impostazioni del pulsante."/>
<#macro title_editpermissions buttontypelabel buttonlabel>Modifica autorizzazioni di ${buttontypelabel}: <span class="quiet">${buttonlabel}</span></#macro>
<#assign subtitle_editpermissions="Utilizzare questa pagina per controllare l'accesso al pulsante sul dispositivo."/>
<#macro title_add buttontypelabel>Aggiungi ${buttontypelabel}</#macro>
<#macro subtitle_add buttontypelabel>Utilizzare questa pagina per aggiungere un nuovo ${buttontypelabel}.</#macro>


<#macro fielderror_userHandleNotFound handle>L’utente con l’handle <code>${handle}</code> non è più nel sito. Selezionare un utente diverso.</#macro>
<#macro fielderror_groupHandleNotFound handle>Il gruppo con l’handle <code>${handle}</code> non è più nel sito. Selezionare un gruppo diverso.</#macro>
<#macro fielderror_CollectionHandleNotFound handle>La cartella con l’handle <code>${handle}</code> non è più nel sito. Selezionare una cartella diversa.</#macro>
<#assign editbtn_formsubmit_success = "Impostazioni del pulsante aggiornate correttamente."/>
<#assign editbtn_formsubmit_error = "Errore: Impossibile salvare gli aggiornamenti del pulsante."/>

<#assign btn_apply="Applica"/>
<#assign btn_addButton="Aggiungi pulsante"/>
<#assign btn_deleteButton="Elimina pulsante"/>
<#assign link_returnToButtonList="Torna alla pagina dell'elenco dei pulsanti"/>
<#assign btntitle_Scan="Pulsante Scansione"/>
<#assign btntitle_Service="Pulsante Servizio dispositivo"/>
<#assign btntitle_Folder="Pulsante Cartella"/>

<#assign scanOwner_title = "Proprietario pulsante"/>
<#assign scanOwner_description = "Selezionare un utente DocuShare come proprietario del pulsante di scansione. Se l’utente non è attualmente autenticato con il sistema Scan Services, verrà richiesta una password."/>
<#assign scanSettings_title = "Impostazioni di scansione"/>
<#assign propLabel_ButtonLabel="Etichetta pulsante:"/>
<#assign propHelp_ButtonLabel="Il nome visualizzato per il pulsante sullo schermo sensibile del dispositivo."/>

<#assign propLabel_ScanType = "Tipo di scansione:"/>
<#assign propHelp_ScanType = "Il tipo di destinazione in cui memorizzare i documenti scansiti."/>
<#assign optionLabel_ScanType_DocuShare = "Cartella DocuShare"/>
<#assign optionLabelHint_ScanType_DocuShare = "Consente di inviare i documenti scansiti a una cartella DocuShare."/>
<#assign optionLabel_ScanType_Folder = "Cartella di rete"/>
<#assign optionLabelHint_ScanType_Folder = "Consente di inviare i documenti scansiti a una cartella di rete."/>
<#assign optionLabel_ScanType_Email = "E-mail"/>
<#assign optionLabelHint_ScanType_Email = "Invia i documenti scansiti a un indirizzo e-mail."/>
<#assign optionLabel_ScanType_Email_ServerNotConfiguredLabel = "(Server non configurato)"/>
<#assign optionLabel_ScanType_Email_ServerNotConfiguredTip = "Il server e-mail non è configurato. Accedere alla pagina Configurazione e-mail e accertarsi che le impostazioni di connessione e-mail siano corrette."/>

<#assign propLabel_ScanToCollection="Scansione su cartella DocuShare:"/>
<#assign propHelp_ScanToCollection="La cartella di destinazione DocuShare per i documenti scansiti."/>
<#assign propNote_ScanToCollection="Eseguire una ricerca digitando il nome di una cartella DocuShare. NOTA IMPORTANTE: Verranno restituite solo le cartelle su cui il proprietario ha diritti di scrittura."/>
<#assign noCollectionFoundPlaceholder="Prima di specificare la cartella, assegnare un proprietario al pulsante sovrastante corrispondente."/>
<#assign propLabel_ScanToPerCollEnable="Scansione su cartella personale:"/>
<#assign propHelp_ScanToPerCollEnable="Quando è selezionata, questa opzione consente di ignorare la cartella specificata nel campo Scansione su cartella DocuShare e di inviare i documenti scansiti direttamente nella cartella personale dell’utente connesso. I documenti scansiti da un utente ospite vengono inviati alla cartella che è stata definita nel campo Scansione su cartella DocuShare."/>
<#assign folderNotFound_msg = "Cartella non trovata in DocuShare"/>

<#assign propLabel_Owner="Proprietario:"/>
<#assign propHelp_Owner="Il proprietario assegnato ai documenti scansiti."/>
<#assign propNote_Owner>Eseguire una ricerca digitando il nome utente di un utente (ad es., <code>jdoe</code>). NOTA IMPORTANTE: Utilizzare solo utenti a livello di Coordinatore.</#assign>
<#assign propLabel_OwnerPassword="Password proprietario:"/>
<#assign ownerAuthenticated_msg = "Proprietario autenticato"/>
<#assign ownerNotAuthenticated_msg = "Proprietario non autenticato. Digitare una password e fare clic sul pulsante Autentica proprietario."/>
<#assign btn_AuthenticateOwner_label="Autentica proprietario"/>
<#assign ownerNotFound_msg = "Proprietario non trovato nel sistema. Eseguire una nuova ricerca."/>

<#assign propLabel_folderPath="Scansione su cartella:"/>
<#assign propHelp_folderPath="La cartella di destinazione di rete per i documenti scansiti."/>
<#assign propNote_folderPath>Digitare il percorso di una cartella di rete utilizzando la convenzione di denominazione UNC (ad es. <code>\\server\share</code>).</#assign>
<#assign propLabel_folderUser="Nome utente cartella:"/>
<#assign propHelp_folderUser="Il nome utente per la cartella di rete selezionata."/>
<#assign propLabel_folderPassword="Password cartella:"/>
<#assign propHelp_folderPassword="La password per la cartella di rete selezionata."/>
<#assign folderTestConnBtn_label="Prova connessione"/>
<#assign folderTestConn_pleasewait = "Prova in corso... Attendere..."/>
<#assign folderTestConnBtn_success="Connessione riuscita."/>
<#assign folderTestConnBtn_failure_authenticate="Accesso non riuscito: errore nome utente o password."/>
<#assign folderTestConnBtn_failure_unknownDomain="Connessione non riuscita. Dominio sconosciuto."/>
<#assign folderTestConnBtn_failure_badNetworkPath="Connessione non riuscita. Impossibile trovare la cartella di rete."/>
<#assign folderTestConnBtn_failure_others="Connessione non riuscita. Impossibile connettersi alla cartella di rete selezionata."/>
<#assign propLabel_exportMeta = "Esporta metadati:"/>
<#assign propNote_exportMeta = "Esportazione delle proprietà dei metadati selezionati (nella tabella dei campi delle proprietà sottostante) in un file in formato xml."/>
<#assign propLabel_browseCollection = "Sfoglia sottocartelle durante la scansione:"/>
<#assign propNote_browseCollection = "Selezionare per sfogliare le sottodirectory nella pagina di scansione del dispositivo (solo per cartelle di rete o cartelle di scansione DocuShare)."/>
<#assign propLabel_defaultEmailAddress = "Indirizzo e-mail 'A:' predefinito:"/>
<#assign propNote_defaultEmailAddress = "L’indirizzo e-mail a cui verrà inviata la scansione. Se questo viene lasciato vuoto, al suo posto verrà usato l’indirizzo e.mail dell’utente connesso, se specificato."/>
<#assign propLabel_scanConfirmation = "Visualizza conferma di scansione:"/>
<#assign propNote_scanConfirmation = "Selezionare per visualizzare un messaggio di conferma sullo schermo sensibile del dispositivo quando il documento scansito viene archiviato con la posizione corrispondente definita. Il tempo necessario per la visualizzazione del messaggio di conferma dipende dalle dimensioni del documento e dal tipo di elaborazione richiesta."/>

<#assign propLabel_DefaultFormat="Formato predefinito:"/>
<#assign propHelp_DefaultFormat="Il formato file predefinito per il documento."/>
<#assign optionLabel_DefaultFormat_pdf="PDF (Portable Document Format)"/>
<#assign optionLabelHint_DefaultFormat_pdf="Consente di salvare i documenti nel formato PDF."/>
<#assign optionLabel_PDF_A = "PDF-A (Portable Document Archive Format)"/>
<#assign optionLabelHint_PDF_A = "Consente di salvare i documenti in formato PDF-A, un formato di archiviazione che include le funzioni PDF idonee per l'archiviazione digitale a lungo termine. Questa opzione può essere selezionata solo se è supportata dal dispositivo o dal server DocuShare."/>
<#assign optionLabel_MRC_PDF = "PDF (MRC) ad alta compressione" />
<#assign optionLabelHint_MRC_PDF = "Consente di salvare i documenti in formato PDF MRC (Mixed Raster Content) ad alta compressione per creare file di dimensioni più ridotte ma di qualità inferiore. Questa opzione può essere selezionata solo se è supportata dal dispositivo o dal server DocuShare."/>
<#assign optionLabel_MRC_PDF_A = "PDF-A (MRC) ad alta compressione"/>
<#assign optionLabelHint_MRC_PDF_A = "Consente di salvare i documenti in formato PDF-A MRC (Mixed Raster Content) ad alta compressione per creare file di dimensioni più ridotte ma di qualità inferiore, per l'archiviazione digitale a lungo termine Questa opzione può essere selezionata solo se è supportata dal dispositivo o dal server DocuShare."/>

<#assign propLabel_DefaultOCR="OCR predefinito:"/>
<#assign propHelp_DefaultOCR="L'impostazione OCR (riconoscimento ottico dei caratteri) predefinita."/>
<#assign optionLabel_DefaultOCR_imageonly="Solo immagine"/>
<#assign optionLabelHint_DefaultOCR_imageonly="Consente di convertire una scansione in un documento di sola immagine."/>

<#assign optionLabel_DefaultOCR_searchable="Ricerca consentita"/>
<#assign optionLabelHint_DefaultOCR_searchable="Consente di convertire una scansione in un documento di testo ricercabile."/>

<#assign optionLabel_DefaultOCR_searchableByServer="Ricercabile - convertito da DocuShare"/>
<#assign optionLabelHint_DefaultOCR_searchableByServer="Consente di convertire una scansione in un documento di testo ricercabile tramite il software OCR di DocuShare."/>
<#assign optionLabel_DefaultOCR_searchableByDevice="Ricercabile - convertito dal dispositivo"/>
<#assign optionLabelHint_DefaultOCR_searchableByDevice="Consente di convertire una scansione in un documento di testo ricercabile tramite il software OCR della stampante multifunzione."/>

<#assign optionLabel_SEARCHABLE_IMAGE="Ricerca consentita"/>
<#assign optionLabel_IMAGE_ONLY="Solo immagine"/>

<#assign propLabel_DefaultResolution="Risoluzione predefinita:"/>
<#assign propHelp_DefaultResolution="La risoluzione di scansione predefinita."/>
<#assign optionLabel_DefaultResolution_300x300="Alta qualità (300 x 300 dpi)"/>
<#assign optionLabelHint_DefaultResolution_300x300="Scansione con alta risoluzione"/>
<#assign optionLabel_DefaultResolution_200x200="Qualità media (200 x 200 dpi)"/>
<#assign optionLabelHint_DefaultResolution_200x200="Scansione con risoluzione media"/>

<#assign propLabel_scanColor = "Colore scansione predefinito:"/>
<#assign propHelp_scanColor = "L'impostazione del colore di scansione del documento."/>
<#assign scanColorOption_AUTO ="Automatico"/>
<#assign scanColorOption_FULL_COLOR ="Quadricromia"/>
<#assign scanColorOption_GRAYSCALE ="Scala di grigi"/>
<#assign scanColorOption_BLACK_AND_WHITE ="Bianco e nero"/>

<#assign propLabel_ScanOrientation="Orientamento scansione:"/>
<#assign propHelp_ScanOrientation="l'orientamento della scansione del documento."/>
<#assign scanOrientationOption_Portrait="Verticale"/>
<#assign scanOrientationOption_Landscape="Orizzontale"/>
<#assign scanSizeOption_Auto="Automatico"/>
<#assign scanSizeOption_Mixed="Misto"/>

<#assign propLabel_ExportScanSettings="Impostazioni di scansione per l'esportazione:"/>
<#assign propHelp_ExportScanSettings="selezionare l'opzione per consentire agli utenti del sistema MFP di modificare le impostazioni OCR, Formato file, Esportazione e Colore scansione prima di eseguire la scansione."/>

<#assign propLabel_MfpScanPage="Scansione pagina"/>
<#assign optionLabel_OneSided="Fronte"/>
<#assign optionLabel_TwoSided="Fronte/retro"/>
<#assign optionLabel_SecondSideRotation="Fronte/retro, ruota lato 2"/>

<#assign label_MfpScanSettings="Impostazioni di scansione..."/>
<#assign propLabel_MfpAdv_OCR="OCR scansione"/>
<#assign propLabel_MfpAdv_Format="Formato scansione"/>
<#assign propLabel_MfpAdv_Resolution="Risoluzione scansione"/>
<#assign propLabel_MfpAdv_Color="Colore scansione"/>
<#assign propLabel_MfpAdv_Orientation="Orientamento scansione"/>
<#assign propLabel_MfpAdv_Size="Formato carta scansione"/>

<#assign networkfilenamesettings_title = "Impostazione nome file"/>
<#assign networkfilenamesettings_desc = "Fornire un nome file per i documenti scansiti e, facoltativamente, aggiungere ulteriori informazioni."/>
<#assign propLabel_networkfilename = "Nome del file"/>
<#assign propLabel_emailfilename = "Oggetto e-mail"/>
<#assign propLabelHint_networkfilename = "Il nome file di base dei documenti scansiti."/>

<#assign fieldsettings_title = "impostazione proprietà documento (metadati)"/>
<#assign fieldsettings_desc = "Selezionare il formato in cui verranno salvati i documenti scansiti e scegliere i campi delle proprietà che gli utenti potranno visualizzare e modificare quando eseguiranno le scansioni. Gli utenti non possono modificare i valori delle proprietà generati automaticamente"/>

<#assign fieldsettings_desc = "Selezionare il formato in cui verranno salvati i documenti e scegliere i campi delle proprietà che gli utenti potranno visualizzare e modificare quando eseguiranno le scansioni. Gli utenti non possono modificare i valori delle proprietà generati automaticamente"/>

<#assign fieldsettings_desc_networkfolder = "Selezionare il formato in cui verranno salvati i documenti e scegliere i campi delle proprietà che gli utenti potranno visualizzare e modificare quando eseguiranno le scansioni. Gli utenti non possono modificare i valori delle proprietà generati automaticamente Per le scansioni su cartelle di rete, come nome file del documento verrà utilizzato il valore del campo Titolo.  Se è abilitata l'opzione 'Esporta metadati', gli altri campi verranno esportati in un file XML separato."/>

<#assign fieldsettings_desc_email = "Selezionare il formato in cui verranno salvati i documenti e scegliere i campi delle proprietà che gli utenti potranno visualizzare e modificare quando eseguiranno le scansioni. Gli utenti non possono modificare i valori delle proprietà generati automaticamente Per le scansioni su e-mail, come nome file dell’allegato all’e-mail verrà utilizzato il valore del campo Titolo. Se è abilitata l'opzione 'Esporta metadati', gli altri campi verranno esportati in un file XML separato."/>


<#assign propLabel_doctype = "Tipo di documento:"/>
<#assign propLabelHint_doctype = "Il tipo di documento scelto per il salvataggio di ogni scansione."/>
<#assign doctype_change_confirm = "Passare a un altro tipo di documento? Se si procede, le impostazioni del campo corrente verranno invalidate."/>
<#assign propLabel_autoFillProfile = "Profilo di compilazione automatica:"/>
<#assign propLabelHint_autoFillProfile = "Scegliere un profilo per questo tipo di documento che specifichi campi che, una volta compilati durante la scansione, causeranno la compilazione automatica di altri campi di proprietà con i valori appropriati da un'origine dati specifica."/>
<#assign optionLabel_autoFillProfile_noProfile ="Nessun profilo"/>
<#assign afp_missingfields_error = "Alla tabella dei campi dei metadati è necessario aggiungere i seguenti campi di profili di compilazione automatica:"/>
<#assign dms_missingfields_error = "Alla tabella dei campi dei metadati è necessario aggiungere i seguenti campi di serie di menu dipendenti:"/>
<#assign afp_mappedfield_defaultval_hint = "Il valore di questo campo è controllato da un profilo di compilazione automatica e non può essere modificato manualmente. Viene compilato dinamicamente dopo che i campi Obbligatori richiesti per la compilazione automatica sono stati compilati."/>

<#assign propLabel_propName="Campo"/>
<#assign propLabelHint_propName="Il campo della proprietà che gli utenti potranno visualizzare quando eseguiranno le scansioni. Un campo che richiede un valore è indicato con il testo (Obbligatorio) e non può essere rimosso."/>
<#assign propLabel_defaultValue="Valore predefinito"/>
<#assign propLabelHint_defaultValue="Il valore predefinito per il campo di proprietà."/>

<#assign propLabel_displayOptions="Opzioni di visualizzazione"/>
<#assign propLabelHint_displayOptions="Modalità di visualizzazione del campo delle proprietà per gli utenti quando eseguono scansioni."/>
<#assign optionLabel_displayOptions_readonly="Sola lettura"/>
<#assign optionLabelHint_displayOptions_readonly="Il campo può essere visualizzato, ma non modificato, durante la scansione."/>
<#assign optionLabel_displayOptions_editable="Modificabile durante la scansione"/>
<#assign optionLabelHint_displayOptions_editable="ll campo può essere modificato durante la scansione."/>
<#assign optionLabel_displayOptions_editablerequired="Modificabile e richiesto durante la scansione"/>
<#assign optionLabelHint_displayOptions_editablerequired="Il campo può essere modificato ed è richiesto durante la scansione."/>
<#assign optionLabel_displayOptions_hidden="Nascosto"/>
<#assign optionLabelHint_displayOptions_hidden="ll campo non può essere visualizzato o modificato durante la scansione."/>

<#assign propLabel_AppendInfo="Aggiungi informazioni"/>
<#assign propLabelHint_AppendInfo_networkfile="Consente l'aggiunta di ulteriori informazioni al nome file."/>
<#assign optionLabelHint_AppendInfo_networkfile_none="Non vengono aggiunte ulteriori informazioni al nome file."/>

<#assign propLabelHint_AppendInfo="Consente di aggiungere ulteriori informazioni al valore predefinito."/>
<#assign optionLabel_AppendInfo_none="Nessuna informazione aggiunta"/>
<#assign optionLabelHint_AppendInfo_none="Non consente di aggiungere ulteriori informazioni al valore predefinito."/>
<#assign optionLabel_AppendInfo_none_folder="Id univoco"/>
<#assign optionLabelHint_AppendInfo_none_folder="Consente di aggiungere una stringa con un Id univoco al valore predefinito (solo per scansioni su cartelle di rete)."/>
<#assign optionLabel_AppendInfo_timestamp="Timestamp"/>
<#assign optionLabelHint_AppendInfo_timestamp>Consente di aggiungere la data e l'ora al valore predefinito. Esempio: <code>ScanDoc-22.10.13</code></#assign>
<#assign optionLabel_AppendInfo_number="Numero incrementale"/>
<#assign optionLabelHint_AppendInfo_number>Consente di aggiungere automaticamente un numero incrementale al valore predefinito. Esempio: <code>ScanDoc-00312</code></#assign>
<#assign optionLabel_AppendInfo_CurrentYear="Anno corrente"/>
<#assign optionLabelHint_AppendInfo_CurrentYear="Consente di aggiungere l'anno corrente al valore predefinito."/>
<#assign optionLabel_AppendInfo_CurrentMonth="Mese corrente"/>
<#assign optionLabelHint_AppendInfo_CurrentMonth="Consente di aggiungere il mese corrente al valore predefinito."/>
<#assign optionLabel_AppendInfo_CurrentDayOfMonth="Giorno corrente del mese"/>
<#assign optionLabelHint_AppendInfo_CurrentDayOfMonth="Consente di aggiungere il giorno corrente del mese (ad esempio 20) al valore predefinito"/>
<#assign optionLabel_AppendInfo_CurrentDayOfWeek="Giorno corrente della settimana"/>
<#assign optionLabelHint_AppendInfo_CurrentDayOfWeek="Consente di aggiungere il giorno corrente della settimana (ad esempio lunedì) al valore predefinito."/>
<#assign optionLabel_AppendInfo_Username="Nome utente"/>
<#assign optionLabelHint_AppendInfo_Username="Consente di aggiungere il nome utente al valore predefinito."/>
<#assign optionLabel_AppendInfo_Firstname="Nome"/>
<#assign optionLabelHint_AppendInfo_Firstname="Consente di aggiungere il nome dell'utente connesso al valore predefinito."/>
<#assign optionLabel_AppendInfo_Lastname="Cognome"/>
<#assign optionLabelHint_AppendInfo_Lastname="Consente di aggiungere il cognome dell'utente connesso al valore predefinito."/>
<#assign optionLabel_AppendInfo_Fullname="Nome completo"/>
<#assign optionLabelHint_AppendInfo_Fullname="Consente di aggiungere il nome completo dell'utente connesso al valore predefinito."/>

<#assign propLabel_appendLoc="Posizione dell'aggiunta"/>
<#assign propLabelHint_appendLoc="Consente di specificare la posizione delle informazioni aggiunte."/>
<#assign optionLabel_appendLoc_after="Dopo il valore predefinito"/>
<#assign optionLabelHint_appendLoc_after="Consente di aggiungere le informazioni dopo il valore predefinito."/>
<#assign optionLabel_appendLoc_before="Prima del valore predefinito"/>
<#assign optionLabelHint_appendLoc_before="Consente di aggiungere le informazioni prima del valore predefinito."/>

<#assign optionLabel_appendLoc_networkfolder_after="Dopo il nome file"/>
<#assign optionLabelHint_appendLoc_networkfolder_after="Consente di aggiungere le informazioni dopo il nome file."/>
<#assign optionLabel_appendLoc_networkfolder_before="Prima del nome file"/>
<#assign optionLabelHint_appendLoc_networkfolder_before="Consente di aggiungere le informazioni prima del nome file."/>
<#assign menuAgentLabel = "Usa menu ODBC:"/>
<#assign menuAgentTip = "Selezionare un menu predefinito i cui valori vengono recuperati da un'origine dati ODBC."/>
<#assign menuAgent_none = "Nessuno assegnato"/>
<#assign odbcMenu_optgrouplabel_simplemenu = "Menu ODBC"/>
<#assign odbcMenu_optgrouplabel_dmsets = "Serie di menu dipendenti"/>
<#assign autofillProfile_isMappedField = "Questa proprietà è utilizzata dal profilo di compilazione automatica selezionato ed è compilata automaticamente quando vengono compilati uno o più campi di profili di compilazione automatica obbligatori."/>
<#assign autofillProfile_isMappedFieldRequired = "Questa proprietà è utilizzata dal profilo di compilazione automatica selezionato ed è richiesta per i campi mappati per la compilazione automatica."/>
<#assign menuAgent_optionsRequestError = "Errore: Si è verificato un errore durante il recupero dell'elenco delle opzioni dall'origine dati."/>

<#assign fieldlist_requiredtag="(obbligatorio)"/>
<#assign btn_addfield="Aggiungi campo"/>
<#assign btn_removefield="Rimuovi"/>

<#assign propLabel_accessMethod ="Livello di accesso:"/>
<#assign propLabelHint_accessMethod ="Il livello di accesso al pulsante: Ospite o gruppo DocuShare specifico."/>
<#assign optionLabel_accessMethod_guest = "Ospite"/>
<#assign optionLabelHint_accessMethod_guest = "Consente a chiunque di utilizzare il pulsante."/>
<#assign optionLabel_accessMethod_group = "Gruppo DocuShare"/>
<#assign optionLabelHint_accessMethod_group>Limita l'accesso al pulsante agli utenti membri di un gruppo DocuShare specifico (ad esempio <code>Gruppo-123</code>).</#assign>

<#assign optionLabel_inherit = "Eredita dal pulsante principale:"/>
<#assign optionLabelHint_inherit = "Utilizzare l'impostazione di accesso del gruppo del pulsante principale."/>

<#assign optionLabel_specificgroup = "Seleziona gruppo:"/>
<#assign optionLabelHint_specificgroup = "Scegliere un gruppo DocuShare digitandone il nome (ad esempio Marketing)."/>
<#assign fieldnote_usergroup = "Eseguire una ricerca digitando il nome di un gruppo (ad esempio Marketing)."/>

<#assign subFolderSection_title = "Impostazione sottocartella"/>
<#assign subFolderSection_subtitle = "Specificare come generare automaticamente le sottocartelle. Selezionare dai menu sottostanti le proprietà da utilizzare per assegnare un nome a ciascuna sottocartella. Il nome effettivo di ciascuna sottocartella dipende dai valori della proprietà specificati al momento della scansione."/>

<#assign subFolderCollectionLabel_none = "Scegli una cartella radice..."/>
<#assign subFolderOptgroup_label_reqfield = "Proprietà richieste"/>
<#assign subFolderOptgroup_label_optionalfield = "Proprietà opzionali"/>
<#assign subFolderOptgroup_label_userdata = "Proprietà utente di scansione"/>
<#assign subFolderOptgroup_label_datadata = "Proprietà data"/>
<#assign subFolderSelectOption_label_none = "Nessuno"/>

<#assign subFolderSelectOption_label_day = "Giorno corrente"/>
<#assign subFolderSelectOption_label_week = "Giorno della settimana corrente"/>
<#assign subFolderSelectOption_label_month = "Mese corrente"/>
<#assign subFolderSelectOption_label_year = "Anno corrente"/>

<#assign subFolderSelectOption_label_username = "Nome utente"/>
<#assign subFolderSelectOption_label_lname = "Cognome"/>
<#assign subFolderSelectOption_label_fname = "Nome"/>
<#assign subFolderSelectOption_label_fullname = "Nome completo"/>
<#assign propRequiredbySubFolder ="(Obbligatorio per l'impostazione della sottocartella)"/>

<#assign propRequiredbyAFP = "(Obbligatorio per la compilazione automatica)"/>

<#assign svcbtnicon_label = "Icona pulsante:"/>
<#assign svcbtnicon_hint = "L’icona visualizzata sul pulsante. Utilizzare l’icona predefinita o scegliere un’altra icona."/>
<#assign btn_editicon_label = "Modifica icona..."/>
<#assign btn_customizeicon_label = "Personalizza..."/>
<#assign customizeicon_dialog_title = "Personalizza icona pulsante"/>
<#assign customizeicon_newval_uploadicon = "Carica nuova icona:"/>
<#assign customizeicon_newval_default = "Utilizza icona predefinita:"/>
<#assign customizeicon_newval_useexisting = "Utilizza icona esistente:"/>

<#assign editsvcbtndialog_title = "Modifica icona pulsante"/>
<#assign editsvcbtndialog_subtitle = "Utilizzare l'icona predefinita, caricare un file di immagine o selezionare un'icona esistente nel server."/>
<#assign icon_upload_label = "Carica una nuova icona:"/>
<#assign icon_upload_visiblehint>Selezionare un formato file di immagine visualizzabile sul Web: <code>.gif</code>,<code>.png</code> o<code>.jpg</code>. Le dimensioni massime sono di 128x128 pixel.</#assign>
<#assign icon_filetypein_label = "Seleziona un'icona esistente:"/>
<#assign icon_resetdefault_label = "Utilizza l'icona predefinita:"/>
<#assign icon_resetdefault_hint = "Utilizza l'icona predefinita."/>
<#assign icon_update_success = "L'icona pulsante è stata aggiornata correttamente."/>
<#assign icon_update_failure = "Errore: Impossibile aggiornare l'icona del pulsante."/>
<#assign editsvcbtndialog_subtitle_noexistingicons = "Nessuna icona trovata nel server."/>


<#-- Configure Devices Page -->
<#assign btn_cancelLabel = "Annulla"/>
<#assign btn_closeTip = "Chiudi"/>

<#assign action_viewDeviceLabel="Modifica impostazioni dispositivo&#8230;"/>
<#assign action_viewDeviceTip="Modifica le impostazioni del dispositivo"/>

<#assign action_reassignButtonsFailureMsg="Errore: Impossibile riassegnare dei pulsanti ad alcuni dispositivi."/>
<#assign action_reassignButtonsSuccessMsg="Le assegnazioni dei pulsanti per i dispositivi selezionati sono state aggiornate correttamente."/>
<#assign action_deleteSingleDeviceLabel="Rimuovi il dispositivo dall'elenco"/>
<#assign action_deleteSingleDeviceTip="Rimuove il dispositivo"/>
<#assign action_deleteSingleDeviceConfirmMsg="Eliminare questo dispositivo? L'operazione non può essere annullata."/>
<#assign action_deleteSingleDeviceSuccessMsg="Il dispositivo è stato eliminato correttamente."/>
<#assign action_deleteSingleDeviceFailureMsg="Errore: Impossibile eliminare il dispositivo."/>

<#assign action_deleteMultiDeviceConfirmMsg="Eliminare i dispositivi selezionati? L'operazione non può essere annullata."/>
<#assign action_deleteMultiDeviceSuccessMsg="I dispositivi selezionati sono stati eliminati correttamente."/>
<#assign action_deleteMultiDeviceFailureMsg="Errore: Impossibile eliminare i dispositivi selezionati."/>

<#assign configDevices_title = "Configura dispositivi"/>
<#assign configDevices_subtitle = "Utilizzare questa pagina per configurare le stampanti multifunzione per l'utilizzo con Scan Services di DocuShare e per gestire i pulsanti assegnati ai dispositivi."/>
<#assign btn_reassignBtnsLabel = "Assegna/Annulla assegnazione pulsanti ai dispositivi selezionati&#8230;"/>
<#assign btn_reassignBtnsTip = "Assegna/Annulla assegnazione pulsanti ai dispositivi selezionati."/>
<#assign btn_deleteSelDevices = "Elimina selezioni&#8230;"/>
<#assign btn_registerDevice = "Aggiungi nuovo dispositivo&#8230;"/>
<#assign btn_importDevices = "Importa dispositivi da file CSV&#8230;"/>
<#assign devicetable_cbx_selectAll_tip = "Selezionare/deselezionare tutti i dispositivi."/>
<#assign devicetable_colLabel_name = "Nome dispositivo"/>
<#assign devicetable_colLabel_address = "Indirizzo IP/Host"/>
<#assign devicetable_colLabel_buttons = "Pulsanti di Scan Services"/>
<#assign devicetable_colLabel_actions = "Azioni"/>
<#assign devicetable_deviceLabel_tip = "Modifica impostazioni dispositivo"/>
<#assign devicetable_nobuttonsassigned = "Nessun pulsante assegnato."/>
<#assign devicetable_emptytablemsg = "Nessuna stampante multifunzione registrata."/>
<#assign devicetable_emptytablemsg_registerlinklabel = "Per aggiungere un nuovo dispositivo, fare clic qui."/>
<#assign devicetable_deviceBehindFirewallTip = "Questo dispositivo è protetto da firewall"/>
<#assign devicetable_deviceBehindFirewallColHeadingTip = "Il dispositivo è protetto da firewall?"/>

<#assign btn_updateAssignmentsLabel = "Aggiorna assegnazioni"/>
<#assign editSelectedBtns_dialogtitle = "Modifica pulsanti di Scan Services nei dispositivi selezionati"/>
<#assign editSelectedBtns_dialogsubtitle = "Assegna/Annulla assegnazione pulsanti di Scan Services ai dispositivi selezionati. Questa operazione sovrascrive l'elenco dei pulsanti attualmente assegnati per ogni dispositivo. Deselezionare un pulsante per rimuoverlo da tutti i dispositivi selezionati."/>
<#assign link_configurebuttons_label="Pagina Configura pulsanti" />
<#macro nobuttonsinsystemmsg link>Nessun pulsante è stato aggiunto. Accedere a ${link} per aggiungere pulsanti.</#macro>

<#assign btn_importCSVLabel = "Importa"/>
<#assign importDialog_title="Importa dispositivi da un file CSV"/>
<#assign importDialog_subtitle="Individuare e selezionare un file CSV contenente l'elenco delle stampanti multifunzione da aggiungere con Scan Services di DocuShare."/>
<#assign importCSV_error="Si è verificato un errore durante l'importazione del file CSV."/>

<#assign failedBtnReassignDialogTitle = "Riassegnazioni pulsante non riuscite"/>
<#assign failedBtnReassignDialogSubtitle = "Si è verificato un errore durante il tentativo di aggiornare le assegnazioni del pulsante nei seguenti dispositivi:"/>
<#assign failedBtnReassignDialog_idcolLabel = "ID"/>


<#-- Edit / Add Device Page -->
<#assign editDevicePage_title="Modifica impostazioni dispositivo:"/>
<#assign editDevicePage_subtitle1="Cambiare le informazioni del dispositivo."/>
<#assign editDevicePage_subtitle2="Cambiare i pulsanti di Scan Services di DocuShare assegnati al dispositivo."/>

<#assign addDevicePage_title="Aggiungi un nuovo dispositivo"/>
<#assign addDevicePage_subtitle1="Inserire le informazioni del dispositivo."/>
<#assign addDevicePage_subtitle2="Assegnare pulsanti di Scan Services ai dispositivi selezionati."/>

<#assign addDevice_successMsg="Il nuovo dispositivo è stato registrato."/>
<#assign addDevice_errorMsg="Errore: Impossibile registrare il dispositivo."/>
<#assign editDevice_successMsg="Impostazioni dispositivo aggiornate"/>
<#assign editDevice_errorMsg="Errore: Impossibile salvare gli aggiornamenti del dispositivo."/>

<#assign deviceLabel_label="Etichetta dispositivo:"/>
<#assign deviceLabel_tip="Il nome descrittivo per la stampante multifunzione Xerox."/>

<#assign deviceAddress_label="Nome host/IP dispositivo:"/>
<#assign deviceAddress_tip="L'indirizzo di rete (indirizzo IP o nome host DNS) della stampante multifunzione Xerox."/>

<#assign deviceUsername_label="Nome utente dispositivo:"/>
<#assign deviceUsername_tip="Il nome utente dell'amministratore per la stampante multifunzione Xerox."/>

<#assign devicePassword_label="Password dispositivo:"/>
<#assign devicePassword_tip="La password dell'amministratore per la stampante multifunzione Xerox."/>

<#assign deviceBehindFirewall_label="Il dispositivo è protetto da firewall?:"/>
<#assign deviceBehindFirewall_tip="Selezionare questa opzione se il dispositivo è protetto da un firewall aziendale e i server di Scan Services e DocuShare sono esterni."/>

<#assign serviceBtnSectionTitle="Pulsanti di Scan Services"/>

<#assign advancedBtn="Mostra impostazioni avanzate &#8250;"/>
<#assign advancedBtn_hide="&#8249; Nascondi impostazioni avanzate"/>
<#assign server_ip_label="Nome host/IP alternativo server di Scan Services:"/>
<#assign server_ip_tip="Se non è possibile connettere la stampante multifunzione al nome host/IP predefinito del server di Scan Services (probabilmente perché la connessione avviene tramite un tunnel VPN con indirizzo NAT), inserire un nome host/IP alternativo."/>
<#assign server_defaultNameLabel="Nome host/IP predefinito server di Scan Services:"/>
<#assign defaultServerTxt="(Impostazione predefinita)"/>

<#assign editDevicePage_btn_applyLabel="Applica"/>
<#assign editDevicePage_btn_addLabel="Aggiungi"/>
<#assign editDevicePage_btn_deleteButtonLabel="Elimina dispositivo"/>
<#assign editDevicePage_link_returnToDeviceListLabel="&#8592; Torna alla pagina dell'elenco dei dispositivi"/>


<#--Scanning Log Page -->
<#assign scanningLog_title ="Registro scansioni"/>
<#assign scanningLog_subtitle ="Utilizzare la pagina per visualizzare le attività di scansione recenti e scaricare il registro di tutti i lavori di scansione."/>
<#assign scanningLog_retrieveErrorMsg="Errore: Impossibile recuperare il registro scansioni."/>
<#assign btn_downloadLogLabel = "Scarica registro scansioni come file CSV&#8230;"/>

<#assign logTable_colLabel_date="Data di scansione"/>
<#assign logTable_colLabel_destination="Destinazione di scansione"/>
<#assign logTable_colLabel_device="Dispositivo di scansione"/>
<#assign logTable_colLabel_button="Pulsante"/>
<#assign logTable_colLabel_username="Nome utente"/>
<#assign logTable_colLabel_status="Stato"/>

<#assign logLoadingMsg="Caricamento registro scansioni&#8230;"/>
<#assign logEmptyMsg="Il registro scansioni è vuoto."/>
<#assign logpagesize_label = "Dimensioni pagina:"/>
<#assign logpagesize_help = "Il numero massimo di lavori di scansione da visualizzare nella pagina."/>
<#assign logfilesize_label = "Dimensioni registro:"/>
<#assign logfilesize_help = "Il numero massimo di lavori di scansione da archiviare in un singolo file di registro. Cambiare l'impostazione quando si configura Scan Services di DocuShare per la prima volta."/>
<#assign btn_updateLogfilesize_label = "Aggiorna"/>
<#assign updateLogFileSize_error = "Si è verificato un errore durante l'aggiornamento delle dimensioni file del registro scansioni."/>
<#assign updateLogFileSize_success = "Le dimensioni file del registro scansioni sono state aggiornate correttamente."/>
<#assign status_succeeded = "Eseguito"/>
<#assign status_failed = "Fallito"/>

<#-- Server Log Page -->
<#assign serverLogPage_title = "Registro server"/>
<#assign serverLogPage_subtitle = "Utilizzare la pagina per cambiare il livello di registrazione del server e scaricare il registro server."/>
<#assign loglevel_label="Livello di registrazione"/>
<#assign logLevel_tip="Il tipo di informazioni di registrazione memorizzate dal server. I livelli di registrazione sono elencati in ordine di gravità decrescente e le informazioni registrate solo per i livelli di gravità uguali o superiori al livello di registrazione selezionato. Ad esempio, il livello REGISTRA tiene traccia delle informazioni per tutti i livelli, mentre AVVISO registra solo le informazioni relative ad AVVISO, ERRORE e FATALE."/>
<#assign btn_logDownloadLabel="Scarica file di registro&#8230;"/>

<#-- Email Service Page -->
<#assign EmailServicePage_title = "Configurazione e-mail"/>
<#assign EmailServicePage_subtitle = "Utilizzare questa pagina per configurare un server e-mail e abilitare l'aggiunta di pulsanti di scansione su e-mail."/>
<#assign EmailSetup_serverSectionLabel = "Impostazioni server e-mail in uscita"/>
<#assign EmailSetup_servernameLabel = "Nome/Indirizzo server:"/>
<#assign EmailSetup_servernameTip = "Il nome del dominio o l'indirizzo IP del server e-mail."/>
<#assign EmailSetup_protocolLabel = "Protocollo:"/>
<#assign EmailSetup_protocolTip = "Il protocollo del server e-mail in uscita. I valori sono SMTP (predefinito), SMTP-TLS, SMTP-SSL."/>
<#assign EmailSetup_portLabel = "Porta:"/>
<#assign EmailSetup_portTip = "Il numero di porta del server e-mail in uscita. Le impostazioni predefinite per ogni protocollo sono SMTP:25, SMTP-TLS:250, SMTP-SSL:2500."/>
<#assign EmailSetup_emailUsernameLabel = "Nome utente:"/>
<#assign EmailSetup_emailUsernameTip = "Il nome utente dell'account autorizzato a inviare e-mail tramite il server e-mail in uscita."/>
<#assign EmailSetup_passwordLabel = "Password:"/>
<#assign EmailSetup_passwordTip = "La password dell'account utente specificato."/>
<#assign EmailSetup_messageSectionLabel = "Impostazioni messaggi di scansione su e-mail"/>
<#assign EmailSetup_defaultFromAddressLabel = "Indirizzo 'Da:' predefinito:"/>
<#assign EmailSetup_defaultFromAddressTip = "L'indirizzo e-mail visualizzato nel campo Da per tutte le e-mail in uscita inviate tramite Scan Services di DocuShare."/>
<#assign EmailSetup_defaultFromAddressExample = "Ad esempio: scan-services-scan@mycompany.com"/>
<#assign EmailSetup_subjectLabel = "Oggetto e-mail predefinito:"/>
<#assign EmailSetup_subjectTip = "L'oggetto predefinito per tutte le e-mail in uscita inviate tramite Scan Services di DocuShare se un pulsante non specifica un oggetto."/>
<#assign EmailSetup_subjectExample = "Esempio: Nuovo documento da Scan Services di DocuShare"/>
<#assign EmailSetup_bodyLabel = "Testo e-mail:"/>
<#assign EmailSetup_bodyTip = "Il testo per tutte le e-mail in uscita inviate tramite Scan Services di DocuShare."/>
<#assign EmailSetup_bodyExample = "Esempio: &ldquo;Ti è stato inviato un nuovo documento da Scan Services di DocuShare&rdquo;'"/>
<#assign EmailSetup_isHTML_label = "Utilizza HTML per il testo:"/>
<#assign EmailSetup_isHTML_tip = "Selezionare questa opzione per consentire l'utilizzo di tag HTML nel testo dell'e-mail."/>
<#assign EmailSetup_advancedSectionLabel = "Impostazioni avanzate"/>
<#assign EmailSetup_timeoutLabel = "Timeout:"/>
<#assign EmailSetup_timeoutTip = "Il periodo di tempo disponibile, in millisecondi, entro cui interrompere l'invio dell'e-mail o collegarsi al server. L'impostazione predefinita è 30000 ms."/>
<#assign EmailSetup_sslcertkeystoreLabel = "File KeyStore con certificato SSL:"/>
<#assign EmailSetup_sslcertkeystoreTip = "Il percorso del file KeyStore SSL sul file system del server. L'informazione è richiesta se il protocollo del server e-mail è impostato su SMTP-SSL o SMTP-TLS, mentre potrebbe non essere richiesta per alcuni account server, ad esempio Google o Yahoo, i cui domini sono attendibili e registrati come tali nell'archivio dei domini Java attendibili."/>
<#assign EmailSetup_sslcertkeystorePassLabel = "Password del file KeyStore con certificato SSL:"/>
<#assign EmailSetup_sslcertkeystorePassTip = "La password per il file KeyStore."/>
<#assign EmailServicePage_formsubmit_success = "Le impostazioni e-mail sono state salvate correttamente."/>
<#assign EmailServicePage_formsubmit_error = "Si è verificato un errore durante il salvataggio delle impostazioni e-mail."/>

<#assign EmailServicePage_SendTestEmail_btnLabel = "Invia e-mail di prova..."/>
<#assign EmailSetup_testConnectionWait = "Invio dell'e-mail in corso. Attendere..."/>
<#assign EmailSetup_testConnectionFailure = "Errore: Si è verificato un errore di connessione al server e-mail. Controllare le impostazioni e riprovare."/>
<#assign EmailSetup_testConnectionSuccess = "L'e-mail è stata inviata correttamente dal server.  Controllare l'inbox dell'e-mail di prova per accertarsi che il messaggio sia pervenuto correttamente. Se il messaggio è pervenuto correttamente, fare clic su Applica se l'impostazione è stata cambiata."/>
<#assign EmailSetup_testConnection_dialog_title ="Invia e-mail di prova"/>
<#assign EmailSetup_testConnection_dialog_subtitle ="Provare le impostazioni inviando un'e-mail."/>
<#assign EmailSetup_testConnection_emaillabel ="E-mail di prova:"/>
<#assign EmailSetup_testConnection_emailtip ="L'indirizzo di destinazione dell'e-mail da utilizzare per provare le impostazioni."/>

<#-- Server Setup Page -->
<#assign ServerSetupPage_title = "Impostazione server"/>
<#assign ServerSetupPage_subtitle = "Utilizzare questa pagina per impostare il server da utilizzare con Scan Services di DocuShare."/>
<#assign ServerSetupPage_subtitle2 = "Se è necessario cambiare le impostazioni del server dopo la registrazione dei dispositivi, è consigliabile rimuovere i pulsanti assegnati ai dispositivi prima di apportare le modifiche."/>
<#assign ServerSetupPage_subtitle3 = "È possibile cambiare la password del firewall in qualunque momento senza dover registrare nuovamente i dispositivi."/>
<#assign ServerSetup_nameLabel = "Nome/Indirizzo server:"/>
<#assign ServerSetup_nameTip = "Il nome del dominio o l'indirizzo IP del server."/>
<#assign ServerSetup_protocolLabel = "Protocollo:"/>
<#assign ServerSetup_prototolTip = "Il protocollo di trasferimento (ad es. http, https)."/>
<#assign ServerSetup_portLabel = "Porta:"/>
<#assign ServerSetup_portTip = "La porta del server (ad es. 8000)."/>
<#assign ServerSetup_passwordLabel = "Password dell'utilità di aggiornamento dei dispositivi:"/>
<#assign ServerSetup_passwordTip = "La password richiesta per accedere all'utilità di aggiornamento utilizzata per riconfigurare i dispositivi. Fornire questa password alla persona autorizzata a gestire i dispositivi MFP in modo da poterli utilizzare con il firewall."/>
<#assign ServerSetup_domainLabel = "Dominio DocuShare:"/>
<#assign ServerSetup_domainTip = "Il dominio utente/di gruppo in DocuShare."/>
<#assign ServerSetup_firewallPasscodeSubtitle = "Per consentire ai dispositivi protetti da un firewall di connettersi al server di Scan Services di DocuShare, è necessario configurarli tramite l'utilità di aggiornamento dei dispositivi. Specificare la password dell'utilità di aggiornamento dei dispositivi e l'URL di download alla persona autorizzata ad amministrare i dispositivi protetti dal firewall. La password è necessaria per accedere all'utilità di aggiornamento. Se si cambiano le impostazioni del server oppure si registra o si annulla la registrazione di un dispositivo protetto da un firewall, sarà necessario specificare nuovamente la password dell'utilità e l'URL di download per poter eseguire nuovamente l'utilità di aggiornamento dei dispositivi. <p>Prima di specificare tale utilità, accertarsi di avere registrato almeno un dispositivo protetto dal firewall e di avergli assegnato un pulsante. In caso contrario, l'utente autorizzato ad amministrare i dispositivi non sarà in grado di accedere all'utilità.</p>"/>
<#assign ServerSetup_registerDeviceBehindFirewallURLLabel = "URL di download dell'utilità di aggiornamento dei dispositivi:"/>
<#assign ServerSetup_registerDeviceBehindFirewallURLTip = "La posizione della pagina Web da cui la persona autorizzata ad amministrare i dispositivi MFP scarica un file utilità ad esecuzione automatica per la configurazione dei dispositivi."/>
<#assign ServerSetup_registerDeviceBehindFirewallURLEndNote = "Copiare questo URL selezionandolo e premendo Ctrl-C (Cmd-C su Mac) e includerlo in un'e-mail."/>
<#macro devicesRegisteredEditWarning deviceNum> <strong>Nota:</strong> ${deviceNum} I dispositivi sono stati già registrati utilizzando queste impostazioni. Se si cambiano le impostazioni, questi dispositivi non potranno più collegarsi al server di Scan Services di DocuShare. Annullare innanzitutto l'assegnazione dei pulsanti di ogni dispositivo, quindi tornare a questa pagina per cambiare le impostazioni del server.</#macro>
<#assign editServerSettingsWhileRegisteredBtnLabel = "Modifica comunque"/>
<#assign ServerSetup_ServerSettingsSectionLabel = "Impostazioni server"/>
<#assign ServerSetup_FirewallPasscodeSectionLabel = "Impostazioni firewall"/>
<#assign ServerSetup_formsubmit_success = "Le impostazioni del server sono state salvate correttamente."/>
<#assign ServerSetup_formsubmit_error = "Si è verificato un errore durante il salvataggio delle impostazioni del server."/>

<#assign ServerSetup_buttonSettings = "Impostazioni pulsante di scansione"/>
<#assign ServerSetup_dateFormatLabel = "Formato data"/>
<#assign ServerSetup_dateFormatHelp = "Il formato data da utilizzare se un pulsante di scansione include un campo di proprietà data. L'impostazione formato data non viene utilizzato per le proprietà della stringa."/>
<#assign ServerSetup_dateFormatMonthFirst = "mm/gg/aaaa"/>
<#assign ServerSetup_dateFormatDayFirst = "gg/mm/aaaa"/>
<#assign ServerSetup_dateFormatYearFirst = "aaaa/mm/gg"/>
<#assign ServerSetup_dateFormatYearFirst2 = "aaaammgg"/>

<#assign ServerSetup_xeroxAppGallery = "Xerox&#174; App Gallery"/>
<#assign ServerSetup_xeroxAppGallerySubtitle = "Xerox&#174; App Gallery consente alle app di Scan Services di DocuShare di ampliare le funzionalità dei sistemi MFP abilitati per Scan Services di DocuShare. Il software Xerox&#174; Scanning App for DocuShare consente agli utenti DocuShare di scansire i documenti e salvarli in cartelle personali. <p>Se si abilita l'utilizzo dell'app, alla pagina dell'elenco dei pulsanti verranno aggiunti un pulsante di Scan Services di DocuShare denominato Scan to DocuShare App e un pulsante Scansione su cartella personale. Quando si disabilita questa app, i pulsanti vengono rimossi dalla pagina. Se l'app viene utilizzata in un sistema MFP non configurato, verrà utilizzata una delle connessioni MFP concessa in licenza.</p>"/>
<#assign ServerSetup_xeroxAppGalleryEnable = "Abilita Scanning App for DocuShare"/>
<#assign ServerSetup_xeroxAppGalleryEnableHelp = "Selezionare l'opzione per autorizzare l'utilizzo dell'app Scan Services di DocuShare, che consente agli utenti DocuShare di scansire i documenti e salvarli nelle loro cartelle personali."/>

<#-- Common dbAgent Page Messages. -->
<#assign dsConnectionProgress="Connessione in corso. Attendere&hellip;"/>
<#assign dsProperty_noMapping = "Nessuno"/>
<#assign dsWizard_next = "Avanti &#8250;"/>
<#assign dsWizard_back = "&#8249; Indietro"/>
<#assign dbsmPage_delete_btn_label = "Elimina menu"/>
<#assign dbsmPage_apply_btn_label = "Applica"/>
<#assign dbsmPage_return_to_listing_page = "&#8592; Torna alla pagina dell'elenco dei menu ODBC"/>
<#assign dataSourceTable_col_actions = "Azioni" />
<#assign dataSourceTable_action_Edit_label = "Modifica"/>
<#assign dataSourceTable_action_Delete_label = "Elimina"/>
<#assign dsAssignedButtons = "Pulsanti assegnati:" />
<#assign dsAssignedDMS = "Serie di menu dipendenti assegnati:" />
<#assign dsColumnLookupError = "Impossibile caricare le colonne dell'origine dati."/>
<#assign dsConnectionError = "Impossibile collegarsi all'origine dati. Controllare le impostazioni di connessione e riprovare."/>
<#assign dsObjPropsRequiredLookupError = "Impossibile caricare le proprietà facoltative per il tipo di documento selezionato."/>
<#assign dsObjPropsOptionalLookupError = "Impossibile caricare le proprietà richieste per il tipo di documento selezionato."/>
<#assign dbsmNoIllegalCharsError = "Non sono consentiti i seguenti caratteri:"/>
<#assign datasource_prop_mapping_restricted = "Perché non posso modificare?"/>
<#assign datasource_prop_mapping_restricted_delete = "Perché non posso eliminare?"/>
<#assign datasource_restricted_modify = "Perché non posso applicare o eliminare?"/>

<#-- Autofill Profiles Listing Page -->
<#assign AutoFillProfilePage_title = "Profili di compilazione automatica"/>
<#assign AutoFillProfilePage_subtitle = "Utilizzare questa pagina per aggiungere profili di compilazione automatica per i tipi di documento. Quando si utilizza un profilo di compilazione automatica con un pulsante di scansione, con i documenti scansiti vengono memorizzati altri valori proprietà in base a quelli inseriti dagli utenti sullo schermo sensibile del dispositivo MFP."/>
<#assign btnLabel_AddAutofillProfile = "Aggiungi profilo di compilazione automatica..."/>
<#assign btnLabel_DeleteSelAutofillProfiles = "Elimina selezione"/>
<#assign autofillTable_col_name = "Nome profilo" />
<#assign autofillTable_col_datasource = "Tipo e percorso ODBC" />
<#assign autofillTable_col_mapping = "Mappatura proprietà e colonna"/>
<#assign autofillTable_col_tablename = "Tabella/Foglio di lavoro" />
<#assign autofillTable_col_doctype = "Tipo di documento" />
<#assign autofillTable_col_actions = "Azioni" />
<#assign autofillTable_col_buttonsUsing = "Assegnazioni dei pulsanti di scansione"/>
<#assign action_deleteAFPConfirmMsg = "Eliminare i profili selezionati?" />
<#assign action_deleteAFPSuccessMsg = "I profili sono stati eliminati correttamente." />
<#assign action_deleteAFPFailureMsg = "Si è verificato un errore durante l'eliminazione dei profili selezionati." />
<#assign action_deleteAFPMappedFailureMsg = "Errore: Impossibile eliminare uno o più profili selezionati perché sono utilizzati nei pulsanti di scansione." />
<#assign useforAutofillTip = "Utilizzare questo campo di proprietà per la compilazione automatica di tutti gli altri campi mappati."/>
<#assign autofillTable_noAssignedButtons = "Nessuno"/>
<#assign autofillTable_noProfiles = "Non è stato configurato alcun profilo di compilazione automatica. Fare clic sul pulsante 'Aggiungi profilo di compilazione automatica' sopra per creare un nuovo profilo."/>
<#assign autofillTable_action_DeleteDisabled = "Non è possibile eliminare questo profilo di compilazione automatica perché è utilizzato da uno o più pulsanti di scansione. Prima dell'eliminazione, rimuoverne l'utilizzo in ogni pagina Modifica impostazioni pulsanti."/>

<#-- Autofill Profile Add/Edit Page -->
<#assign AutoFillProfilePage_add_title = "Aggiungi profilo di compilazione automatica" />
<#assign AutoFillProfilePage_add_subtitle = "Per aggiungere un profilo di compilazione automatica, è necessario prima configurare la connessione ODBC, quindi mappare le proprietà dei documenti DocuShare alle colonne della tabella. " />
<#assign AutoFillProfilePage_edit_title = "Modifica profilo di compilazione automatica:" />
<#assign AutoFillProfilePage_edit_subtitle = "Cambiare qualsiasi impostazione del profilo di compilazione automatica." />
<#assign AutoFillProfilePage_mappedBtnWarning = "<strong>Nota:</strong> questo profilo è utilizzato da uno o più pulsanti di scansione, per cui non può essere cambiato né eliminato. Prima della modifica o dell'eliminazione, rimuoverne l'utilizzo in ogni pagina di Modifica impostazioni pulsanti."/>

<#assign afp_name_label = "Nome profilo:" />
<#assign afp_name_tip = "Nome univoco per il profilo di compilazione automatica." />
<#assign afp_name_fielderror_duplicatename="Questo nome è già utilizzato. Immettere un nome diverso."/>
<#assign afp_dsconn_heading ="Passaggio 1 di 2: Configurare la connessione ODBC"/>
<#assign afp_dsconn_subheading ="Inserire i dati di connessione dell'origine dati."/>
<#assign afp_datasource_label = "Tipo ODBC:" />
<#assign afp_datasource_tip = "Il tipo di origine dati." />
<#assign afp_dbname_label = "Nome ODBC/Percorso file:" />
<#assign afp_dbname_tip = "Specificare il nome del database, se si utilizza un database basato su server, oppure il percorso del file, se si fa riferimento a un file di database nel file system oppure a un file di foglio elettronico Microsoft Excel." />
<#assign afp_username_label = "Nome utente:" />
<#assign afp_username_tip = "Il nome utente del database." />
<#assign afp_password_label = "Password:" />
<#assign afp_password_tip = "La password del nome utente del database." />
<#assign afp_host_label = "Host:" />
<#assign afp_host_tip = "Indirizzo IP o DNS del database." />
<#assign afp_port_label = "Porta:" />
<#assign afp_port_tip = "Il numero di porta del database." />
<#assign afp_table_label = "Nome tabella/foglio di lavoro:" />
<#assign afp_table_tip = "Specifica il nome di una tabella di database o il nome di un foglio di lavoro Microsoft Excel." />
<#assign afp_doctype_label = "Tipo di documento:" />
<#assign afp_doctype_tip = "Tipo di documento DocuShare." />

<#assign afp_return_to_listing_page = "&#8592; Torna alla pagina dell'elenco dei profili di compilazione automatica"/>
<#assign afp_delete_profile_btn_label = "Elimina profilo"/>
<#assign afp_dbsettings_heading = "Impostazioni ODBC"/>

<#assign afp_mapping_heading = "Passaggio 2 di 2: Mappare le proprietà dei documenti DocuShare alle colonne della tabella"/>
<#assign afp_mapping_subheading = "Mappare le colonne dalla tabella dell'origine dati specificata alle proprietà del tipo di documento selezionato. Quando gli utenti scansiscono documenti su un dispositivo e inseriscono i valori delle proprietà contrassegnate come 'Obbligatorio per la compilazione automatica', tutte le altre proprietà mappate verranno compilate automaticamente con i valori corretti dall'origine dati ODBC assegnata. Nota: Per aggiungere o salvare un profilo, occorre almeno un campo mappato obbligatorio ('Obbligatorio per la compilazione automatica') e un campo mappato facoltativo."/>
<#assign afp_mapping_table_colhead_name = "Nome colonna"/>
<#assign afp_mapping_table_colhead_dsprop = "Proprietà DocuShare"/>
<#assign afp_mapping_table_colhead_primary = "Obbligatorio per la compilazione automatica"/>
<#assign afp_mapping_table_colhead_primary_tip = "Selezionare i campi che dovranno obbligatoriamente contenere un valore per consentire la compilazione automatica degli altri campi mappati."/>
<#assign afp_mapping_table_notsetup = "Selezionare una tabella/foglio di lavoro di un'origine dati e un tipo di documento DocuShare per configurare la mappatura delle proprietà per la funzione di compilazione automatica."/>

<#assign afp_mapping_property_requiredFields = "Campi obbligatori"/>
<#assign afp_mapping_property_optionalFields = "Campi facoltativi"/>
<#assign afp_edit_successMsg = "Il profilo di compilazione automatica è stato aggiornato correttamente."/>
<#assign afp_edit_failureMsg = "Errore: Si è verificato un errore durante l'aggiornamento del profilo di compilazione automatica."/>
<#assign afp_add_successMsg = "Il profilo di compilazione automatica è stato aggiunto correttamente."/>
<#assign afp_add_failureMsg = "Errore: Si è verificato un errore durante l'aggiunta del profilo di compilazione automatica."/>
<#assign action_deleteSingleAFPConfirmMsg = "Eliminare questo profilo di compilazione automatica? L'operazione non può essere annullata."/>
<#assign action_deleteSingleAFPSuccessMsg = "Il profilo di compilazione automatica è stato eliminato correttamente."/>
<#assign action_deleteSingleAFPFailureMsg = "Errore: Si è verificato un errore durante l'eliminazione del profilo di compilazione automatica."/>
<#assign noAutofillCbxError = "Selezionare almeno una casella di controllo 'Obbligatorio per la compilazione automatica'."/>
<#assign twoMappedFieldMinimumError = "Per aggiungere o salvare un profilo, occorre almeno un campo mappato obbligatorio ('Obbligatorio per la compilazione automatica') e un campo mappato facoltativo."/>
<#assign afp_EditDisabled = "Non è possibile eliminare o cambiare questo profilo di compilazione automatica perché è utilizzato da uno o più pulsanti di scansione. Prima dell'eliminazione o della modifica, rimuoverne l'utilizzo in ogni pagina Modifica impostazioni pulsanti. Consultare l'elenco dei pulsanti di scansione assegnati."/>



<#-- Simple Datasource Menus Listing Page -->
<#assign DatasourceMenuPage_title = "Menu ODBC" />
<#assign DatasourceMenuPage_subtitle = "Utilizzare questa pagina per aggiungere menu ODBC. Aggiungere un menu ODBC per recuperare da un'origine dati i valori utilizzati in un menu assegnato a una proprietà documento DocuShare." />
<#assign btnLabel_AddDatasourceMenu = "Aggiungi menu ODBC..."/>
<#assign btnLabel_DeleteSelDataSourceMenus = "Elimina selezione"/>
<#assign dataSourceTable_col_menuname = "Nome" />
<#assign dataSourceTable_col_type = "Tipo" />
<#assign dataSourceTable_col_datasource = "Tipo e percorso ODBC" />
<#assign dataSourceTable_col_tablesource = "Etichetta di menu e origine valore (Tabella/Colonna)"/>
<#assign dataSourceTable_col_tablesource_label = "Etichetta:"/>
<#assign dataSourceTable_col_tablesource_value = "Valore:"/>
<#assign dataSourceTable_col_property = "Assegnato a una proprietà DocuShare (proprietà/tipo documento)" />
<#assign dataSourceTable_col_dms = "Assegnazioni serie di menu dipendenti">
<#assign dataSourceTable_type_dsMenuTip = "Menu ODBC semplice">
<#assign dataSourceTable_empty = "Non è stato configurato alcun menu ODBC. Fare clic sul pulsante 'Aggiungi menu ODBC...' sopra per creare un nuovo profilo."/>

<#assign dsm_deleteaction_mappedbtn_msg="Questo menu ODBC è utilizzato da uno o più <strong>pulsanti di scansione</strong>. Prima dell'eliminazione, rimuoverne l'utilizzo in ogni pagina Modifica impostazioni pulsanti."/>
<#assign dsm_deleteaction_dm_msg="Questo menu ODBC è utilizzato da una o più <strong>serie di menu dipendenti</strong>. Prima dell'eliminazione, rimuoverne l'utilizzo in ogni serie di menu dipendenti."/>
<#assign dsm_deleteaction_mappedbtnanddm_msg="Questo menu ODBC è utilizzato da una o più <strong>serie di menu dipendenti</strong> e <strong>pulsanti di scansione</strong>. Se si elimina il menu, tutti i pulsanti di scansione assegnati o le serie di menu dipendenti non funzioneranno più. Prima dell'eliminazione, rimuoverne l'utilizzo in ogni serie di menu dipendenti e pulsanti di scansione."/>
<#assign dbsmPage_mappingDisabledPropTip = "Questo menu ODBC è utilizzato da uno o più pulsanti di scansione assegnati. Se si modifica il menu, tutti i pulsanti di scansione assegnati non funzioneranno più. Prima di modificare questa proprietà, rimuoverne l'utilizzo in ogni pulsante di scansione assegnato."/>

<#-- ODBC Menu Add/Edit Page -->
<#assign dbsmPage_add_title = "Aggiungi menu ODBC" />
<#assign dbsmPage_add_subtitle = "Per aggiungere un menu ODBC è necessario prima impostare la connessione ODBC, quindi assegnare il menu ODBC a una proprietà documento DocuShare." />
<#assign dbsmPage_edit_title = "Modifica menu ODBC:" />

<#assign dbsmPage_mappedBtnWarning = "Questo menu ODBC è utilizzato da uno o più <strong>pulsanti di scansione</strong>, pertanto non è possibile modificare i valori Tipo di documento e Proprietà DocuShare (mostrati al punto 2) assegnati. Prima rimuoverne l'utilizzo nei pulsanti assegnati (riportati nell'elenco delle assegnazioni), quindi tornare qui per modificare le proprietà o eliminare il menu."/>
<#assign dbsmPage_mappedDMSWarning = "Questo menu ODBC è utilizzato da una o più <strong>serie di menu dipendenti</strong>, pertanto non è possibile cambiare le sue impostazioni. Prima rimuoverne l'utilizzo nelle serie di menu dipendenti assegnate riportate nell'elenco, quindi tornare qui per apportare le modifiche."/>
  <#assign dbsmPage_mappedBtnAndDMSWarning = "Questo menu ODBC è utilizzato da una o più <strong>serie di menu dipendenti</strong> e <strong>pulsanti di scansione</strong>. Se questo menu è utilizzato in serie di menu dipendenti, le sue impostazioni non possono essere cambiate. Prima rimuoverne l'utilizzo nelle serie di menu dipendenti assegnate riportate nell'elenco, quindi tornare qui per apportare le modifiche. Se questo menu è assegnato a un pulsante di scansione, i suoi valori Tipo di documento e Proprietà DocuShare (mostrati al punto 2) non possono essere cambiati."/>

<#assign dbsmPage_edit_subtitle = "Cambiare una delle impostazioni del menu ODBC." />
<#assign dbsm_name_label = "Nome menu:"/>
<#assign dbsm_name_tip = "Nome univoco per il menu ODBC."/>
<#assign dbsm_name_fielderror_duplicatedtitle="Esiste già un altro menu ODBC con lo stesso nome. Inserire un nome univoco."/>
<#assign dbsm_property_label = "Proprietà DocuShare:"/>
<#assign dbsm_property_tip = "La proprietà DocuShare da utilizzare per il menu con le opzioni dei dati ODBC."/>
<#assign dbsm_columnforlabel_label = "Colonna per l'etichetta di menu:"/>
<#assign dbsm_columnforlabel_tip = "La colonna dell'origine dati da utilizzare per l'elenco delle etichette delle opzioni di menu. Per impostazione predefinita, il nome della colonna corrisponde a quello assegnato al valore di menu."/>
<#assign dbsm_columnforvalue_label = "Colonna per il valore di menu:"/>
<#assign dbsm_columnforvalue_tip = "La colonna dell'origine dati da utilizzare per l'elenco dei valori delle opzioni di menu."/>
<#assign dbsmPage_mapping_title = "Passaggio 2 di 2: Assegnare il menu ODBC a una proprietà DocuShare"/>
<#assign dbsmPage_mapping_subtitle = "Dall'origine dati selezionata scegliere una tabella o un foglio di lavoro e una colonna da utilizzare come valori per un menu ODBC. È possibile anche selezionare una colonna che verrà utilizzata come etichetta delle voci di menu. Selezionare, quindi, un tipo di documento DocuShare e una delle relative proprietà da utilizzare per il menu le cui opzioni verranno compilate durante la scansione."/>

<#assign dbsmPage_prop_mappingdisabledwarningtp = ""/>

<#assign dbsmPage_edit_successMsg = "Il menu ODBC è stato aggiornato correttamente."/>
<#assign dbsmPage_edit_failureMsg = "Errore: Si è verificato un errore durante l'aggiornamento del menu ODBC."/>
<#assign dbsmPage_add_successMsg = "Il menu ODBC è stato aggiunto correttamente."/>
<#assign dbsmPage_add_failureMsg = "Errore: Si è verificato un errore durante l'aggiunta del menu ODBC."/>

<#assign action_deleteDSMenuConfirmMsg = "Eliminare i menu ODBC selezionati? L'operazione non può essere annullata."/>
<#assign action_deleteDSMenuSuccessMsg = "I menu ODBC selezionati sono stati eliminati correttamente."/>
<#assign action_deleteDSMenuFailureMsg = "Errore: Si è verificato un errore durante l'eliminazione dei menu ODBC selezionati."/>
<#assign action_deleteDSMenuMappedFailureMsg = "Errore: Uno o più menu ODBC selezionati sono utilizzati da pulsanti di scansione o serie di menu dipendenti, per cui non è possibile eliminarli."/>

<#assign action_deleteSingleDSMenuConfirmMsg = "Eliminare questo menu ODBC? L'operazione non può essere annullata."/>
<#assign action_deleteSingleDSMenuSuccessMsg = "Il menu ODBC è stato eliminato correttamente."/>
<#assign action_deleteSingleDSMenuFailureMsg = "Errore: Si è verificato un errore durante l'eliminazione del menu ODBC."/>


<#-- ODBC Dependent Menu Set Listing Page -->
<#assign dmsPage_title = "Serie di menu ODBC dipendenti" />
<#assign dmsPage_subtitle = "Utilizzare questa pagina per aggiungere una serie di menu ODBC dipendenti collegando uno o più menu ODBC predefiniti." />
<#assign dmsPage_addBtn = "Aggiungi serie di menu ODBC dipendenti..."/>
<#assign dmsPage_deleteSelectedBtn = "Elimina selezione"/>

<#assign dmsPage_action_deleteConfirmMsg_multi = "Eliminare le serie di menu ODBC dipendenti selezionate?" />
<#assign dmsPage_action_deleteSuccessMsg_multi = "Le serie di menu ODBC dipendenti selezionate sono state eliminate correttamente." />
<#assign dmsPage_action_deleteFailureMsg_multi = "Si è verificato un errore durante l'eliminazione delle serie di menu ODBC dipendenti selezionate." />
<#assign dmsPage_action_deleteFailureMappingMsg_multi = "Errore: Una o più serie selezionate sono utilizzate su pulsanti di scansione, per cui non è possibile eliminarle." />
<#assign dmsPage_action_deleteConfirmMsg_single = "Eliminare la serie di menu ODBC dipendenti selezionata?" />
<#assign dmsPage_action_deleteSuccessMsg_single= "La serie di menu ODBC dipendenti selezionata è stata eliminata correttamente." />
<#assign dmsPage_action_deleteFailureMsg_single = "Si è verificato un errore durante l'eliminazione della serie di menu ODBC dipendenti selezionata." />

<#assign dmsPage_table_empty = "Non è stata configurata alcuna serie di menu ODBC dipendenti. Fare clic sul pulsante 'Aggiungi serie di menu ODBC dipendenti...' sottostante per creare una nuova serie.">
<#assign dmsPage_table_iconTip = "Serie di menu ODBC dipendenti">
<#assign dmsPage_table_col_name = "Nome della serie di menu">
<#assign dmsPage_table_col_menus = "Menu utilizzati">
<#assign dmsPage_table_col_btnsassigned = "Pulsanti che utilizzano">
<#assign dmsPage_table_col_actions = "Azioni">
<#assign dmsPage_table_col_action_DeleteDisabled = "Non è possibile eliminare questa serie di menu dipendenti perché è utilizzata da uno o può pulsanti di scansione. Prima dell'eliminazione, rimuoverne l'utilizzo nella pagina Modifica impostazioni pulsanti."/>


<#-- ODBC Dependent Menu Set Add/Edit Page -->
<#assign dmPage_add_title = "Aggiungi serie di menu ODBC dipendenti"/>
<#assign dmPage_add_subtitle = "Selezionare una serie di menu ODBC esistenti con valori dipendenti tra loro. Selezionare un menu principale, quindi scegliere uno o più menu dipendenti. Mappare l'etichetta di ogni opzione di menu a un valore di una colonna della tabella dell'origine dati per collegarla al relativo menu dipendente."/>
<#assign dmPage_edit_title = "Modifica serie di menu ODBC dipendenti:"/>
<#assign dmPage_edit_subtitle = "Cambiare una delle impostazioni della serie di menu ODBC dipendenti."/>
<#assign dmPage_mappedBtnWarning = "<strong>Nota:</strong> poiché questa serie di menu dipendenti è utilizzata da uno o più pulsanti di scansione, non è possibile cambiare le relative selezioni di menu dell'origine dati né eliminarla. Rimuovere prima l'utilizzo della serie di menu dipendenti nella pagina Modifica impostazioni pulsanti, quindi tornare a questa pagina per cambiare le relative selezioni di menu dell'origine dati oppure eliminarla. È possibile cambiare le impostazioni nella sezione Mappa valori di menu."/>
<#assign dmPage_mappedBtnNoDeleteTip = ""/>

<#assign dmPage_profileName_label="Nome della serie di menu dipendenti:"/>
<#assign dmPage_profileName_tip="Nome univoco per la serie di menu ODBC dipendenti."/>
<#assign dmPage_profileName_fielderror_duplicatedtitle="Esiste già un'altra serie di menu ODBC dipendenti con lo stesso nome. Inserire un nome univoco."/>
<#assign dmPage_section_SelectODBCMenus = "Seleziona menu origine dati"/>
<#assign dmPage_section_SelectODBCMenus_subtitle = "Selezionare un menu principale, quindi scegliere uno o più menu con valori dipendenti tra loro."/>
<#assign dmPage_primaryMenuLabel= "Menu principale:"/>
<#assign dmPage_primaryMenuTip= "Il menu ODBC principale nella serie. Utilizza le impostazioni del database, delle tabelle e delle colonne del menu ODBC."/>
<#assign dmPage_dependentMenuLabel1= "Menu dipendente 1:"/>
<#assign dmPage_dependentMenuTip1= "Il primo menu ODBC dipendente nella serie. Utilizza solo le impostazioni del database e delle tabelle del menu ODBC."/>
<#assign dmPage_dependentMenuLabel2= "Menu dipendente 2:"/>
<#assign dmPage_dependentMenuTip2= "Il secondo menu ODBC dipendente nella serie. Utilizza solo le impostazioni del database e delle tabelle del menu ODBC."/>
<#assign dmPage_add_dm="Aggiungi menu dipendente"/>
<#assign dmPage_remove_dm="Rimuovi menu dipendente"/>
<#assign dmPage_menuoption_none="Nessuno"/>
<#assign dmPage_noODBCMenus = "Non è possibile aggiungere una serie di menu ODBC dipendenti perché non esiste alcun menu ODBC. Accedere alla pagina Menu ODBC per aggiungerne uno."/>

<#assign dmPage_section_MapMenuValues = "Mappa valori di menu"/>
<#assign dmPage_section_MapMenuValues_subtitle = "Mappare i valori per ogni opzione di menu al menu dipendente impostando la colonna dell'origine dati per i valori di menu ed, eventualmente, per le etichette."/>
<#assign dmPage_returntolisting = "&#8592; Torna alla pagina dell'elenco delle serie di menu ODBC dipendenti"/>
<#assign dmPage_mapingtable_emptyoptionshelp="&larr; Selezionare le colonne per le etichette e i valori delle opzioni."/>
<#assign dmPage_addBtnLabel="Aggiungi"/>
<#assign dmPage_deleteBtnLabel="Elimina serie di menu"/>
<#assign dmPage_colMenuNoSelection="Selezionare una colonna&#8230;"/>
<#assign dmPage_maptblhdr_mapping ="Mappatura"/>
<#assign dmPage_maptblhdr_options ="Opzioni"/>
<#assign dmPage_maptblhdr_optscolsubheading ="Etichetta: Valore"/>
<#assign dmPage_maptblhdr_colforlabel ="Colonna per l'etichetta"/>
<#assign dmPage_maptblhdr_colforvalue ="Colonna per il valore"/>


<#-------------------------------------->
<#---------- MFD UI Messages ----------->
<#-------------------------------------->
<#assign browseCollection_MenuLabel = "Selezionare una cartella:">
<#assign browseCollection_selectBtnLabel = "Seleziona cartella"/>
<#assign browseCollection_ResponseError = "Errore: la cartella non è stata trovata o si è verificato un problema di connessione con il server DocuShare."/>
<#assign browseCollection_UpOneLevel = "Sali di un livello"/>

<#assign browseFolder_MenuLabel = "Selezionare una cartella:">
<#assign browseFolder_selectBtnLabel = "Seleziona cartella"/>
<#assign browseFolder_ResponseError = "Errore: la cartella di rete non è stata trovata o è stato riscontrato un problema con la connessione di rete."/>
<#assign emailSubjectLabel = "Oggetto e-mail"/>
<#assign folderSubjectLabel = "Nome file"/>
<#assign sendingScanToTxt = "Invio scansione a:"/>

<#-- MFP Device Emulator List Page -->

<#assign EmulatorPage_title="Emulatore dispositivo MFP"/>
<#assign EmulatorPage_subtitle="Utilizzare questa pagina per emulare la funzionalità MFP. Fare clic su un pulsante qualsiasi per avviare la scansione."/>


