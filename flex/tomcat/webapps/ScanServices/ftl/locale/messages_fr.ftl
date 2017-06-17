<#-------------------------------------->
<#-------- Admin UI Messages ----------->
<#-------------------------------------->

<#-- StandAlone Menu -->
<#assign standalone_menu_title = "Menu Scan Service"/>
<#assign link_configBtnsLabel="Configurer les boutons"/>
<#assign link_configBtnsTip="Ajoutez et configurez les boutons de Scan Service pour les utiliser sur des imprimantes multifonctions."/>
<#assign link_configDevicesLabel="Configurer les périphériques"/>
<#assign link_configDevicesTip="Configurer les imprimantes multifonctions pour les utiliser avec DocuShare Scan Service et gérer les boutons affectés aux périphériques."/>
<#assign link_scanLogLabel="Journal de numérisation"/>
<#assign link_scanLogTip="Afficher les numérisations récentes et télécharger le journal de tous les travaux de numérisation."/>
<#assign link_logSettingsLabel="Journal du serveur"/>
<#assign link_logSettingsTip="Changer le niveau de journalisation du serveur et télécharger le journal du serveur."/>
<#assign link_emailServiceLabel="Configuration du courrier électronique"/>
<#assign link_emailServiceTip="Configurer le service de messagerie électronique."/>
<#assign link_configureServerLabel="Configuration du serveur" />
<#assign link_configureServerTip="Configurez les paramètres du serveur DocuShare Scan Service." />
<#assign link_autoFillProfileLabel = "Profils de remplissage automatique"/>
<#assign link_autoFillProfileTip = "Utilisez cette page pour ajouter des profils de remplissage automatique pour les types de document. Ajoutez un profil de remplissage automatique pour intégrer des valeurs de propriété supplémentaires aux documents numérisés en fonction des valeurs de propriété que les utilisateurs saisissent sur l'écran tactile de l'imprimante multifonctions."/>
<#assign link_dataSourceMenusLabel = "Menus ODBC"/>
<#assign link_dataSourceMenusTip = "Utilisez cette page pour ajouter des menus ODBC. Ajoutez un menu ODBC pour récupérer des valeurs issues d'une source de données utilisées dans un menu affecté à une propriété de document DocuShare. Vous pouvez ajouter deux types de menus : jeux de menus simples ou dépendants."/>
<#assign link_dataSourceDependentMenusLabel = "Jeux de menus dépendants ODBC"/>
<#assign link_dataSourceDependentMenusTip = "Utilisez cette page pour ajouter un jeu de menus dépendants ODBC en reliant un ou plusieurs menus ODBC prédéfinis."/>
<#assign link_heading_serverconfig = "Configuration du serveur"/>
<#assign link_heading_logs = "Journaux"/>
<#assign link_heading_odbc = "Connecteurs ODBC"/>
<#assign link_heading_Emulator = "Émulateur de périphérique"/>
<#assign link_EmulatorTip = "Utilisez cette page pour émuler le périphérique."/>
<#assign link_EmulatorLabel="Émulateur"/>

<#-- Form validation general strings -->
<#assign validationErrorGeneralMsg="Veuillez corriger les erreurs ci-après."/>
<#assign fieldErrorTitle="Erreur :"/>
<#assign fielderror_empty="Ce champ ne peut pas être vide."/>


<#-- Configure Buttons List Page -->
<#assign deleteAction_confirm="Voulez-vous vraiment supprimer ce bouton ? Cette action ne peut pas être annulée.  Continuer ?"/>
<#assign deleteAction_error="Erreur : Impossible de supprimer ce bouton."/>
<#assign deleteAction_success="Ce bouton a été supprimé."/>

<#assign configBtnPage_title="Configurer les boutons"/>
<#assign configBtnPage_subtitle="Utilisez cette page pour ajouter et configurer des boutons DocuShare Scan Service en vue de les utiliser sur des imprimantes multifonctions. Pour commencer, ajoutez un nouveau bouton DocuShare Scan Service. Puis, ajoutez des boutons enfants pour la numérisation et les dossiers (pour organiser les boutons de numérisation) sous le bouton DocuShare Scan Service."/>
<#assign link_addScanButtonLabel="Nouveau bouton Scan Service&#8230;"/>
<#assign emptyBtnListMsg="Aucun bouton n'a encore été créé."/>
<#assign link_emptyBtnListNewLink="Cliquez ici pour créer un bouton."/>
<#assign listheading_button="Bouton"/>
<#assign listheading_type="Type"/>
<#assign listheading_access="Accès"/>
<#assign listheading_actions="Actions"/>

<#assign buttonTip="Afficher/modifier le bouton..."/>
<#assign btnTreeBtn_collapse_label="Réduire"/>
<#assign btnTreeBtn_expand_label="Développer"/>
<#assign btnTreeBtn_collapse_tooltip="Masquer la liste des boutons enfants."/>
<#assign btnTreeBtn_expand_tooltip="Afficher la liste des boutons enfants."/>

<#assign btnType_service="Bouton DocuShare Scan Service"/>
<#assign btnType_folder="Bouton Dossier"/>
<#assign btnType_scan="Bouton Numérisation"/>
<#assign groupAccessOnlyLabel="Accès de groupe seulement"/>
<#macro groupAccessOnlyTip handle>Réservé au groupe DocuShare (${handle})</#macro>

<#assign action_addFolderBtnLabel="Ajouter un bouton dossier enfant"/>
<#assign action_addFolderBtnTip="Ajouter un bouton dossier enfant"/>
<#assign action_addScanBtnLabel="Ajouter un bouton de numérisation enfant"/>
<#assign action_addScanBtnTip="Ajouter un bouton de numérisation enfant"/>
<#assign action_editPropsBtnLabel="Afficher/modifier les paramètres"/>
<#assign action_editPropsBtnTip="Afficher/modifier les paramètres"/>
<#assign action_editPermissionsBtnLabel="Modifier les droits"/>
<#assign action_editPermissionsBtnTip="Modifier les droits"/>
<#assign action_deleteBtnLabel="Supprimer le bouton"/>
<#assign action_deleteBtnTip="Supprimer le bouton"/>
<#assign btn_expandtree_label="Développer tout"/>
<#assign btn_expandtree_help="Afficher tous les boutons enfants."/>
<#assign btn_collapsetree_label="Réduire tout"/>
<#assign btn_collapsetree_help="Masquer tous les boutons enfants."/>
<#assign colhead_tip_accessLevel="Niveau d'accès (Visiteur ou Groupe DocuShare)"/>
<#assign colhead_tip_scanType="Type de numérisation (dossier DocuShare, dossier réseau ou courrier électronique)"/>
<#assign scantype_tip_DocuShare="Dossier DocuShare pour la numérisation"/>
<#assign scantype_tip_NetworkFolder="Dossier réseau pour la numérisation"/>
<#assign scantype_tip_Email="Numérisation vers le courrier électronique"/>


<#-- Edit Button Settings, Edit Button Permissions, Add Buttons Pages -->
<#macro title_editsettings buttontypelabel buttonlabel>Modifier les paramètres pour ${buttontypelabel} : <span class="quiet">${buttonlabel}</span></#macro>
<#assign subtitle_editsettings="Utilisez cette page pour modifier les paramètres du bouton."/>
<#macro title_editpermissions buttontypelabel buttonlabel>Modifier les droits pour ${buttontypelabel} : <span class="quiet">${buttonlabel}</span></#macro>
<#assign subtitle_editpermissions="Utilisez cette page pour contrôler l'accès au bouton sur le périphérique."/>
<#macro title_add buttontypelabel>Ajouter ${buttontypelabel}</#macro>
<#macro subtitle_add buttontypelabel>Utilisez cette page pour ajouter un nouveau ${buttontypelabel}.</#macro>


<#macro fielderror_userHandleNotFound handle>L’utilisateur correspondant à l’identificateur <code>${handle}</code> ne se trouve plus sur ce site. Veuillez sélectionner un autre utilisateur.</#macro>
<#macro fielderror_groupHandleNotFound handle>Le groupe correspondant à l’identificateur <code>${handle}</code> ne se trouve plus sur ce site. Veuillez sélectionner un autre groupe.</#macro>
<#macro fielderror_CollectionHandleNotFound handle>Le dossier correspondant à l’identificateur <code>${handle}</code> ne se trouve plus sur ce site. Veuillez sélectionner un autre dossier.</#macro>
<#assign editbtn_formsubmit_success = "Les paramètres du bouton ont été mis à jour."/>
<#assign editbtn_formsubmit_error = "Erreur. Impossible d’enregistrer les mises à jour du bouton."/>

<#assign btn_apply="Appliquer"/>
<#assign btn_addButton="Ajouter le bouton"/>
<#assign btn_deleteButton="Supprimer le bouton"/>
<#assign link_returnToButtonList="Retourner à la page qui contient la liste des boutons"/>
<#assign btntitle_Scan="Bouton Numérisation"/>
<#assign btntitle_Service="Bouton Service du périphérique"/>
<#assign btntitle_Folder="Bouton Dossier"/>

<#assign scanOwner_title = "Propriétaire du bouton"/>
<#assign scanOwner_description = "Sélectionnez un utilisateur DocuShare comme propriétaire du bouton de numérisation.  Vous devrez saisir un mot de passe si l'utilisateur n'est pas authentifié dans le système des services de numérisation."/>
<#assign scanSettings_title = "Paramètres de numérisation"/>
<#assign propLabel_ButtonLabel="Étiquette du bouton :"/>
<#assign propHelp_ButtonLabel="Nom du bouton tel qu'il apparaît sur l'écran tactile du périphérique."/>

<#assign propLabel_ScanType = "Type de numérisation :"/>
<#assign propHelp_ScanType = "Type de destination pour le stockage des documents numérisés."/>
<#assign optionLabel_ScanType_DocuShare = "Dossier DocuShare"/>
<#assign optionLabelHint_ScanType_DocuShare = "Envoie les documents numérisés dans un dossier DocuShare."/>
<#assign optionLabel_ScanType_Folder = "Dossier réseau"/>
<#assign optionLabelHint_ScanType_Folder = "Envoie les documents numérisés dans un dossier réseau."/>
<#assign optionLabel_ScanType_Email = "Adresse électronique"/>
<#assign optionLabelHint_ScanType_Email = "Envoie les documents numérisés vers une adresse électronique."/>
<#assign optionLabel_ScanType_Email_ServerNotConfiguredLabel = "(Serveur non configuré)"/>
<#assign optionLabel_ScanType_Email_ServerNotConfiguredTip = "Le serveur de messagerie n’est pas configuré.  Accédez à la page Configuration du courrier électronique et assurez-vous que les paramètres de connexion au courrier électronique sont corrects."/>

<#assign propLabel_ScanToCollection="Dossier DocuShare pour la numérisation :"/>
<#assign propHelp_ScanToCollection="Dossier DocuShare de destination des documents numérisés."/>
<#assign propNote_ScanToCollection="Effectuer une recherche en tapant le titre d'un dossier DocuShare. REMARQUE IMPORTANTE : Seuls les dossiers pour lesquels le propriétaire possède des droits d’écritures seront affichés."/>
<#assign noCollectionFoundPlaceholder="Veuillez affecter un propriétaire de bouton ci-dessus avant de spécifier le dossier."/>
<#assign propLabel_ScanToPerCollEnable="Dossier personnel pour la numérisation :"/>
<#assign propHelp_ScanToPerCollEnable="Lorsqu'elle est activée, cette option ignore le dossier spécifié dans le champ Numériser dans un dossier DocuShare afin de numériser les documents dans le dossier personnel DocuShare de l'utilisateur connecté. Les documents numérisés d'un utilisateur invité sont envoyés vers le dossier spécifié dans le champ Numériser dans le dossier DocuShare."/>
<#assign folderNotFound_msg = "Dossier introuvable dans DocuShare"/>

<#assign propLabel_Owner="Propriétaire :"/>
<#assign propHelp_Owner="Propriétaire associé aux documents numérisés."/>
<#assign propNote_Owner>Lancez une recherche en tapant un nom d’utilisateur (par ex. <code>pdupont</code>). REMARQUE IMPORTANTE : Vous pouvez uniquement utiliser des utilisateurs de niveau coordinateur.</#assign>
<#assign propLabel_OwnerPassword="Mot de passe du propriétaire :"/>
<#assign ownerAuthenticated_msg = "Propriétaire authentifié"/>
<#assign ownerNotAuthenticated_msg = "Propriétaire non authentifié.  Veuillez saisir un mot de passe, puis cliquez sur le bouton Authentifier le propriétaire."/>
<#assign btn_AuthenticateOwner_label="Authentifier le propriétaire"/>
<#assign ownerNotFound_msg = "Propriétaire introuvable dans le système.  Veuillez relancer votre recherche."/>

<#assign propLabel_folderPath="Dossier de numérisation :"/>
<#assign propHelp_folderPath="Dossier réseau de destination des documents numérisés."/>
<#assign propNote_folderPath>Tapez un chemin d'accès au dossier réseau à l'aide de la convention UNC. (par ex., <code>\\serveur\share</code>)</#assign>
<#assign propLabel_folderUser="Nom d'utilisateur du dossier :"/>
<#assign propHelp_folderUser="Nom d'utilisateur correspondant au dossier réseau sélectionné."/>
<#assign propLabel_folderPassword="Mot de passe du dossier :"/>
<#assign propHelp_folderPassword="Mot de passe correspondant au dossier réseau sélectionné."/>
<#assign folderTestConnBtn_label="Vérifier la connexion"/>
<#assign folderTestConn_pleasewait = "Test en cours. Veuillez patienter..."/>
<#assign folderTestConnBtn_success="Connexion établie."/>
<#assign folderTestConnBtn_failure_authenticate="Échec de connexion : nom d'utilisateur ou mot de passe inconnu."/>
<#assign folderTestConnBtn_failure_unknownDomain="Échec de connexion : domaine inconnu."/>
<#assign folderTestConnBtn_failure_badNetworkPath="Échec de connexion : dossier réseau introuvable."/>
<#assign folderTestConnBtn_failure_others="Échec de connexion : impossible de se connecter au dossier réseau sélectionné."/>
<#assign propLabel_exportMeta = "Exporter les métadonnées :"/>
<#assign propNote_exportMeta = "Exporter les propriétés de métadonnées sélectionnées (table des champs de propriété ci-dessous) dans un fichier xml."/>
<#assign propLabel_browseCollection = "Parcourir les sous-dossiers lors de la numérisation :"/>
<#assign propNote_browseCollection = "Sélectionner pour accéder aux sous-dossiers sur la page de numérisation du périphérique. (Uniquement pour les dossiers réseau ou les types de numérisation Collection DocuShare)."/>
<#assign propLabel_defaultEmailAddress = "Adresse électronique du destinataire :"/>
<#assign propNote_defaultEmailAddress = "adresse électronique à laquelle la numérisation sera envoyée.  Si ce champ n’est pas renseigné, l’adresse électronique de l’utilisateur connecté sera utilisée, si elle est disponible."/>
<#assign propLabel_scanConfirmation = "Afficher la confirmation de numérisation :"/>
<#assign propNote_scanConfirmation = "Sélectionner pour afficher un message de confirmation sur l'écran tactile du périphérique lorsque le document numérisé est stocké dans un emplacement défini. Selon la taille du document et le traitement requis, l'affichage du message de confirmation peut prendre un certain temps."/>

<#assign propLabel_DefaultFormat="Format par défaut :"/>
<#assign propHelp_DefaultFormat="Format de fichier de document par défaut."/>
<#assign optionLabel_DefaultFormat_pdf="PDF (Portable Document Format)"/>
<#assign optionLabelHint_DefaultFormat_pdf="Enregistre les documents au format PDF."/>
<#assign optionLabel_PDF_A = "PDF-A (Portable Document Archive Format)"/>
<#assign optionLabelHint_PDF_A = "Enregistre les documents au format PDF-A, un format d'archivage qui inclut les caractéristiques PDF idéales pour la conservation numérique à long terme. Cette option est disponible seulement si elle est prise en charge par le périphérique ou le serveur DocuShare."/>
<#assign optionLabel_MRC_PDF = "Format MRC PDF (Compression élevée)" />
<#assign optionLabelHint_MRC_PDF = "Enregistre les documents au format MRC PDF (compression élevée) pour produire des fichiers plus petits, mais d'une qualité moindre. Cette option est disponible seulement si elle est prise en charge par le périphérique ou le serveur DocuShare."/>
<#assign optionLabel_MRC_PDF_A = "Format MRC PDF-A (Compression élevée)"/>
<#assign optionLabelHint_MRC_PDF_A = "Enregistre les documents au format MRC PDF-A (compression élevée) pour produire des fichiers plus petits, mais d'une qualité moindre pour la conservation numérique. Cette option est disponible seulement si elle est prise en charge par le périphérique ou le serveur DocuShare."/>

<#assign propLabel_DefaultOCR="ROC par défaut :"/>
<#assign propHelp_DefaultOCR="Paramètre par défaut pour la ROC (reconnaissance optique des caractères)."/>
<#assign optionLabel_DefaultOCR_imageonly="Image seulement"/>
<#assign optionLabelHint_DefaultOCR_imageonly="Convertit les numérisations en documents non modifiables."/>

<#assign optionLabel_DefaultOCR_searchable="Consultable"/>
<#assign optionLabelHint_DefaultOCR_searchable="Convertit les numérisations en documents textes consultables."/>

<#assign optionLabel_DefaultOCR_searchableByServer="Consultable - converti par DocuShare"/>
<#assign optionLabelHint_DefaultOCR_searchableByServer="Convertit les numérisations en documents textes consultables à l'aide du logiciel ROC de DocuShare."/>
<#assign optionLabel_DefaultOCR_searchableByDevice="Consultable - converti par le périphérique"/>
<#assign optionLabelHint_DefaultOCR_searchableByDevice="Convertit les numérisations en documents textes consultables à l'aide du logiciel ROC de l'imprimante multifonctions."/>

<#assign optionLabel_SEARCHABLE_IMAGE="Consultable"/>
<#assign optionLabel_IMAGE_ONLY="Image seulement"/>

<#assign propLabel_DefaultResolution="Résolution par défaut :"/>
<#assign propHelp_DefaultResolution="Résolution de numérisation par défaut."/>
<#assign optionLabel_DefaultResolution_300x300="Haute qualité (300 x 300 ppp)"/>
<#assign optionLabelHint_DefaultResolution_300x300="Numérisation avec haute résolution"/>
<#assign optionLabel_DefaultResolution_200x200="Qualité moyenne (200 x 200 ppp)"/>
<#assign optionLabelHint_DefaultResolution_200x200="Numérisation avec résolution moyenne"/>

<#assign propLabel_scanColor = "Couleur de numérisation par défaut :"/>
<#assign propHelp_scanColor = "Paramètre de la couleur de numérisation du document."/>
<#assign scanColorOption_AUTO ="Auto"/>
<#assign scanColorOption_FULL_COLOR ="Quadrichromie"/>
<#assign scanColorOption_GRAYSCALE ="Échelle de gris"/>
<#assign scanColorOption_BLACK_AND_WHITE ="Noir et blanc"/>

<#assign propLabel_ScanOrientation="Orientation de numérisation :"/>
<#assign propHelp_ScanOrientation="Orientation de la numérisation du document."/>
<#assign scanOrientationOption_Portrait="Portrait"/>
<#assign scanOrientationOption_Landscape="Paysage"/>
<#assign scanSizeOption_Auto="Auto"/>
<#assign scanSizeOption_Mixed="Mixte"/>

<#assign propLabel_ExportScanSettings="Exporter les paramètres de numérisation :"/>
<#assign propHelp_ExportScanSettings="Cette option permet aux utilisateurs d'imprimantes multifonctions de modifier les paramètres de la ROC, du format de fichier, de la résolution et de la couleur avant de procéder à la numérisation."/>

<#assign propLabel_MfpScanPage="Page à numériser"/>
<#assign optionLabel_OneSided="Recto"/>
<#assign optionLabel_TwoSided="Recto verso"/>
<#assign optionLabel_SecondSideRotation="Recto verso tête-bêche"/>

<#assign label_MfpScanSettings="Paramètres de numérisation..."/>
<#assign propLabel_MfpAdv_OCR="ROC pour numérisation"/>
<#assign propLabel_MfpAdv_Format="Format de numérisation"/>
<#assign propLabel_MfpAdv_Resolution="Résolution de numérisation"/>
<#assign propLabel_MfpAdv_Color="Couleur de numérisation"/>
<#assign propLabel_MfpAdv_Orientation="Orientation de numérisation"/>
<#assign propLabel_MfpAdv_Size="Format papier de numérisation"/>

<#assign networkfilenamesettings_title = "Configuration du nom de fichier"/>
<#assign networkfilenamesettings_desc = "Fournissent un nom de fichier pour les documents numérisés et en option, permettent d'ajouter des informations."/>
<#assign propLabel_networkfilename = "Nom de fichier"/>
<#assign propLabel_emailfilename = "Objet du courriel"/>
<#assign propLabelHint_networkfilename = "Nom de fichier de base pour les documents numérisés."/>

<#assign fieldsettings_title = "Configuration des propriétés du document (métadonnées)"/>
<#assign fieldsettings_desc = "Sélectionnez un type de document pour l'enregistrement de vos documents numérisés et choisissez les champs de propriété que les utilisateurs peuvent afficher et modifier pendant la numérisation. Les utilisateurs ne peuvent pas modifier les valeurs des propriétés générées automatiquement."/>

<#assign fieldsettings_desc = "Sélectionnez le type de document et choisissez les champs de propriété que les utilisateurs peuvent afficher et modifier pendant la numérisation. Les utilisateurs ne peuvent pas modifier les valeurs des propriétés générées automatiquement."/>

<#assign fieldsettings_desc_networkfolder = "Sélectionnez le type de document et choisissez les champs de propriété que les utilisateurs peuvent afficher et modifier pendant la numérisation. Les utilisateurs ne peuvent pas modifier les valeurs des propriétés générées automatiquement. Pour les numérisations via un dossier réseau, la valeur du champ Titre sera utilisée comme nom de fichier du document.  Les autres champs seront exportés dans un fichier XML associé si l'option Exporter les métadonnées est activée."/>

<#assign fieldsettings_desc_email = "Sélectionnez le type de document et choisissez les champs de propriété que les utilisateurs peuvent afficher et modifier pendant la numérisation. Les utilisateurs ne peuvent pas modifier les valeurs des propriétés générées automatiquement. Pour les numérisations par courrier électronique, la valeur du champ Titre sera utilisée comme nom de fichier de la pièce jointe au courriel.  Les autres champs seront exportés dans un fichier XML joint si l'option Exporter les métadonnées est activée."/>


<#assign propLabel_doctype = "Type de document :"/>
<#assign propLabelHint_doctype = "Type de document choisi pour chaque numérisation enregistrée."/>
<#assign doctype_change_confirm = "Voulez-vous vraiment choisir un autre type de document ?  Si vous continuez, vous perdrez les paramètres de champ actuels."/>
<#assign propLabel_autoFillProfile = "Profil de remplissage automatique :"/>
<#assign propLabelHint_autoFillProfile = "Choisissez un profil pour ce type de document qui spécifie certains champs qui, une fois renseignés lors de la numérisation, entraîneront le remplissage automatique d'autres champs de propriété avec les valeurs appropriées provenant d'une source de données spécifique."/>
<#assign optionLabel_autoFillProfile_noProfile ="Aucun profil"/>
<#assign afp_missingfields_error = "Le ou les champs suivants du profil de remplissage automatique doivent être ajoutés à la table des champs de métadonnées :"/>
<#assign dms_missingfields_error = "Le ou les champs suivants du jeu de menus dépendants doivent être ajoutés à la table des champs de métadonnées :"/>
<#assign afp_mappedfield_defaultval_hint = "Cette valeur de champ est contrôlée par le profil de remplissage automatique et ne peut être modifiée manuellement. Elle est automatiquement spécifiée une fois que les champs Requis pour le remplissage automatique ont été remplis."/>

<#assign propLabel_propName="Champ"/>
<#assign propLabelHint_propName="Champ de propriété affiché lorsque les utilisateurs effectuent une numérisation. Tout champ qui requiert une valeur est indiqué par la mention (requis) et ne peut pas être supprimé."/>
<#assign propLabel_defaultValue="Valeur par défaut"/>
<#assign propLabelHint_defaultValue="Valeur par défaut pour ce champ de propriété."/>

<#assign propLabel_displayOptions="Options d'affichage"/>
<#assign propLabelHint_displayOptions="Mode d'affichage du champ de propriété lorsque les utilisateurs effectuent une numérisation."/>
<#assign optionLabel_displayOptions_readonly="Lecture seule"/>
<#assign optionLabelHint_displayOptions_readonly="Le champ peut être affiché lors de la numérisation, mais il ne peut pas être modifié."/>
<#assign optionLabel_displayOptions_editable="Modifiable lors de la numérisation"/>
<#assign optionLabelHint_displayOptions_editable="Le champ affiché peut être modifié lors de la numérisation."/>
<#assign optionLabel_displayOptions_editablerequired="Modifiable et requis lors de la numérisation"/>
<#assign optionLabelHint_displayOptions_editablerequired="Le champ affiché peut être modifié et doit être renseigné lors de la numérisation."/>
<#assign optionLabel_displayOptions_hidden="Masqué"/>
<#assign optionLabelHint_displayOptions_hidden="Le champ ne peut pas être affiché ou modifié lors de la numérisation."/>

<#assign propLabel_AppendInfo="Ajouter des informations"/>
<#assign propLabelHint_AppendInfo_networkfile="Permet d'ajouter des informations au nom du fichier."/>
<#assign optionLabelHint_AppendInfo_networkfile_none="N'ajoute pas d'informations au nom du fichier."/>

<#assign propLabelHint_AppendInfo="Permet d'ajouter des informations à la valeur par défaut."/>
<#assign optionLabel_AppendInfo_none="Pas d'informations supplémentaires"/>
<#assign optionLabelHint_AppendInfo_none="N'ajoute pas d'informations à la valeur par défaut."/>
<#assign optionLabel_AppendInfo_none_folder="Identifiant unique"/>
<#assign optionLabelHint_AppendInfo_none_folder="Ajoute une chaîne d'identifiant unique à la valeur par défaut. (Numérisations via dossier réseau uniquement)"/>
<#assign optionLabel_AppendInfo_timestamp="Horodatage"/>
<#assign optionLabelHint_AppendInfo_timestamp>Ajoute la date et l'heure à la valeur par défaut. Exemple : <code>ScanDoc-10.22.13</code></#assign>
<#assign optionLabel_AppendInfo_number="Numéro à incrémentation"/>
<#assign optionLabelHint_AppendInfo_number>Ajoute un numéro à incrémentation automatique à la valeur par défaut. Exemple : <code>ScanDoc-00312</code></#assign>
<#assign optionLabel_AppendInfo_CurrentYear="Année en cours"/>
<#assign optionLabelHint_AppendInfo_CurrentYear="Ajoute l'année en cours à la valeur par défaut."/>
<#assign optionLabel_AppendInfo_CurrentMonth="Mois en cours"/>
<#assign optionLabelHint_AppendInfo_CurrentMonth="Ajoute le mois en cours à la valeur par défaut."/>
<#assign optionLabel_AppendInfo_CurrentDayOfMonth="Jour actuel du mois"/>
<#assign optionLabelHint_AppendInfo_CurrentDayOfMonth="Ajoute le jour actuel du mois (ex. 20) à la valeur par défaut."/>
<#assign optionLabel_AppendInfo_CurrentDayOfWeek="Jour actuel de la semaine"/>
<#assign optionLabelHint_AppendInfo_CurrentDayOfWeek="Ajoute le jour actuel de la semaine (ex. lundi) à la valeur par défaut."/>
<#assign optionLabel_AppendInfo_Username="Nom d’utilisateur"/>
<#assign optionLabelHint_AppendInfo_Username="Ajoute le nom d'utilisateur à la valeur par défaut."/>
<#assign optionLabel_AppendInfo_Firstname="Prénom"/>
<#assign optionLabelHint_AppendInfo_Firstname="Ajoute le prénom de l'utilisateur connecté à la valeur par défaut."/>
<#assign optionLabel_AppendInfo_Lastname="Nom"/>
<#assign optionLabelHint_AppendInfo_Lastname="Ajoute le nom de l'utilisateur connecté à la valeur par défaut."/>
<#assign optionLabel_AppendInfo_Fullname="Nom complet"/>
<#assign optionLabelHint_AppendInfo_Fullname="Ajoute le nom complet de l'utilisateur connecté à la valeur par défaut."/>

<#assign propLabel_appendLoc="Position des informations"/>
<#assign propLabelHint_appendLoc="Spécifie la position des informations supplémentaires."/>
<#assign optionLabel_appendLoc_after="Après la valeur par défaut"/>
<#assign optionLabelHint_appendLoc_after="Ajoute les informations supplémentaires après la valeur par défaut."/>
<#assign optionLabel_appendLoc_before="Avant la valeur par défaut"/>
<#assign optionLabelHint_appendLoc_before="Ajoute les informations supplémentaires avant la valeur par défaut."/>

<#assign optionLabel_appendLoc_networkfolder_after="Après le nom du fichier"/>
<#assign optionLabelHint_appendLoc_networkfolder_after="Ajoute les informations supplémentaires après le nom du fichier."/>
<#assign optionLabel_appendLoc_networkfolder_before="Avant le nom du fichier"/>
<#assign optionLabelHint_appendLoc_networkfolder_before="Ajoute les informations supplémentaires avant le nom du fichier."/>
<#assign menuAgentLabel = "Utiliser le menu ODBC :"/>
<#assign menuAgentTip = "Sélectionnez un menu prédéfini dont les valeurs sont récupérées à partir d'une source de données ODBC."/>
<#assign menuAgent_none = "Aucune affectation"/>
<#assign odbcMenu_optgrouplabel_simplemenu = "Menus ODBC"/>
<#assign odbcMenu_optgrouplabel_dmsets = "Jeux de menus dépendants"/>
<#assign autofillProfile_isMappedField = "Cette propriété est utilisée par le profil de remplissage automatique sélectionné. Elle est automatiquement remplie lorsqu'un ou plusieurs champs requis du profil de remplissage automatique sont renseignés."/>
<#assign autofillProfile_isMappedFieldRequired = "Cette propriété est utilisée par le profil de remplissage automatique sélectionné. Elle est requise pour les champs mappés à remplissage automatique."/>
<#assign menuAgent_optionsRequestError = "Erreur : Une erreur s'est produite lors de la tentative de récupération de la liste des options à partir de la source de données."/>

<#assign fieldlist_requiredtag="(Requis)"/>
<#assign btn_addfield="Ajouter un champ"/>
<#assign btn_removefield="Supprimer"/>

<#assign propLabel_accessMethod ="Niveau d'accès :"/>
<#assign propLabelHint_accessMethod ="Niveau d'accès au bouton : Visiteur ou groupe DocuShare spécifique."/>
<#assign optionLabel_accessMethod_guest = "Visiteur"/>
<#assign optionLabelHint_accessMethod_guest = "Tout le monde peut utiliser ce bouton."/>
<#assign optionLabel_accessMethod_group = "Groupe DocuShare"/>
<#assign optionLabelHint_accessMethod_group>Limite l'accès au bouton aux utilisateurs qui sont membres d'un groupe DocuShare spécifique (par ex. <code>Group-123</code>).</#assign>

<#assign optionLabel_inherit = "Hériter du parent :"/>
<#assign optionLabelHint_inherit = "Utilise le paramètre d'accès au groupe du bouton parent."/>

<#assign optionLabel_specificgroup = "Choisir le groupe :"/>
<#assign optionLabelHint_specificgroup = "Choisissez un groupe DocuShare en tapant son titre (par ex, Marketing)."/>
<#assign fieldnote_usergroup = "Effectuez une recherche en tapant le titre d'un groupe (par ex. Marketing)."/>

<#assign subFolderSection_title = "Configuration des sous-dossiers"/>
<#assign subFolderSection_subtitle = "Spécifiez comment générer automatiquement des sous-dossiers. Sélectionnez les propriétés dans les menus ci-dessous. Elles seront utilisées pour nommer les sous-dossiers. Le titre réel de chaque sous-dossier provient des valeurs des propriétés entrées lors de la numérisation."/>

<#assign subFolderCollectionLabel_none = "Choisir un dossier racine..."/>
<#assign subFolderOptgroup_label_reqfield = "Propriétés requises"/>
<#assign subFolderOptgroup_label_optionalfield = "Propriétés facultatives"/>
<#assign subFolderOptgroup_label_userdata = "Propriétés de l'utilisateur de la numérisation"/>
<#assign subFolderOptgroup_label_datadata = "Propriétés de date"/>
<#assign subFolderSelectOption_label_none = "Aucun"/>

<#assign subFolderSelectOption_label_day = "Jour en cours"/>
<#assign subFolderSelectOption_label_week = "Semaine en cours"/>
<#assign subFolderSelectOption_label_month = "Mois en cours"/>
<#assign subFolderSelectOption_label_year = "Année en cours"/>

<#assign subFolderSelectOption_label_username = "Nom d’utilisateur"/>
<#assign subFolderSelectOption_label_lname = "Nom"/>
<#assign subFolderSelectOption_label_fname = "Prénom"/>
<#assign subFolderSelectOption_label_fullname = "Nom complet"/>
<#assign propRequiredbySubFolder ="(Requis par la configuration du sous-dossier)"/>

<#assign propRequiredbyAFP = "(Requis pour le remplissage automatique)"/>

<#assign svcbtnicon_label = "Icône du bouton :"/>
<#assign svcbtnicon_hint = "L'icône affichée sur le bouton. Utilisez l'icône par défaut ou choisissez-en une autre."/>
<#assign btn_editicon_label = "Modifier l'icône..."/>
<#assign btn_customizeicon_label = "Personnaliser..."/>
<#assign customizeicon_dialog_title = "Personnaliser l'icône du bouton"/>
<#assign customizeicon_newval_uploadicon = "Chargement d'une nouvelle icône :"/>
<#assign customizeicon_newval_default = "Utilisation de l'icône par défaut :"/>
<#assign customizeicon_newval_useexisting = "Utilisation d'une icône existante :"/>

<#assign editsvcbtndialog_title = "Modifier l'icône du bouton"/>
<#assign editsvcbtndialog_subtitle = "Utilisez l'icône par défaut, téléchargez un fichier image ou sélectionnez une icône existante sur le serveur."/>
<#assign icon_upload_label = "Charger une nouvelle icône :"/>
<#assign icon_upload_visiblehint>Sélectionnez un format de fichier image affichable sur le Web : <code>.gif</code>,<code>.png</code> ou<code>.jpg</code>.  La taille maximale est 128x128 pixels.</#assign>
<#assign icon_filetypein_label = "Sélectionner une icône existante :"/>
<#assign icon_resetdefault_label = "Utiliser l'icône par défaut :"/>
<#assign icon_resetdefault_hint = "Utiliser l'icône de bouton par défaut."/>
<#assign icon_update_success = "L'icône du bouton a été mise à jour."/>
<#assign icon_update_failure = "Erreur : l'icône du bouton n'a pas pu être mise à jour."/>
<#assign editsvcbtndialog_subtitle_noexistingicons = "Aucune icône existante n'a été trouvée sur le serveur."/>


<#-- Configure Devices Page -->
<#assign btn_cancelLabel = "Annuler"/>
<#assign btn_closeTip = "Fermer"/>

<#assign action_viewDeviceLabel="Modifier les paramètres du périphérique&#8230;"/>
<#assign action_viewDeviceTip="Modifier les paramètres du périphérique"/>

<#assign action_reassignButtonsFailureMsg="Erreur : les boutons de certains périphériques n'ont pas été réattribués."/>
<#assign action_reassignButtonsSuccessMsg="Les attributions des boutons des périphériques sélectionnés ont été mises à jour."/>
<#assign action_deleteSingleDeviceLabel="Retirer ce périphérique de la liste"/>
<#assign action_deleteSingleDeviceTip="Supprimer le périphérique"/>
<#assign action_deleteSingleDeviceConfirmMsg="Voulez-vous vraiment supprimer ce périphérique ? Cette action ne peut pas être annulée."/>
<#assign action_deleteSingleDeviceSuccessMsg="Le périphérique a été supprimé."/>
<#assign action_deleteSingleDeviceFailureMsg="Erreur : impossible de supprimer ce périphérique."/>

<#assign action_deleteMultiDeviceConfirmMsg="Voulez-vous vraiment supprimer les périphériques sélectionnés ?  Cette action ne peut pas être annulée."/>
<#assign action_deleteMultiDeviceSuccessMsg="Les périphériques sélectionnés ont été supprimés."/>
<#assign action_deleteMultiDeviceFailureMsg="Erreur : impossible de supprimer le(s) périphérique(s) sélectionné(s)."/>

<#assign configDevices_title = "Configurer les périphériques"/>
<#assign configDevices_subtitle = "Utilisez cette page pour configurer les imprimantes multifonctions pour les utiliser avec DocuShare Scan Service et gérer les boutons affectés aux périphériques."/>
<#assign btn_reassignBtnsLabel = "Attribuer/désattribuer des boutons aux périphériques sélectionnés&#8230;"/>
<#assign btn_reassignBtnsTip = "Attribuer/désattribuer des boutons aux périphériques sélectionnés."/>
<#assign btn_deleteSelDevices = "Supprimer la sélection&#8230;"/>
<#assign btn_registerDevice = "Ajouter un nouveau périphérique&#8230;"/>
<#assign btn_importDevices = "Importer des périphériques à partir d'un fichier CSV&#8230;"/>
<#assign devicetable_cbx_selectAll_tip = "Sélectionner/désélectionner tous les périphériques."/>
<#assign devicetable_colLabel_name = "Nom du périphérique"/>
<#assign devicetable_colLabel_address = "Hôte/adresse IP"/>
<#assign devicetable_colLabel_buttons = "Boutons Scan Service"/>
<#assign devicetable_colLabel_actions = "Actions"/>
<#assign devicetable_deviceLabel_tip = "Modifier les paramètres du périphérique"/>
<#assign devicetable_nobuttonsassigned = "Aucun bouton attribué."/>
<#assign devicetable_emptytablemsg = "Aucune imprimante multifonctions n'a encore été enregistrée."/>
<#assign devicetable_emptytablemsg_registerlinklabel = "Cliquez ici pour ajouter un nouveau périphérique."/>
<#assign devicetable_deviceBehindFirewallTip = "Ce périphérique se trouve derrière un pare-feu"/>
<#assign devicetable_deviceBehindFirewallColHeadingTip = "Le périphérique est-il derrière un pare-feu ?"/>

<#assign btn_updateAssignmentsLabel = "Mettre à jour les attributions"/>
<#assign editSelectedBtns_dialogtitle = "Modifier les boutons Scan Service sur les périphériques sélectionnés"/>
<#assign editSelectedBtns_dialogsubtitle = "Attribuer/désattribuer des boutons Scan Service aux périphériques sélectionnés. Cette opération remplacera la liste des boutons actuellement attribués pour chaque périphérique. La désélection d'un bouton le supprimera de tous les périphériques sélectionnés."/>
<#assign link_configurebuttons_label="Page Configurer des boutons" />
<#macro nobuttonsinsystemmsg link>Aucun bouton n’a été ajouté.  Accédez à ${link} pour ajouter des boutons.</#macro>

<#assign btn_importCSVLabel = "Importation"/>
<#assign importDialog_title="Importer des périphériques à partir d'un fichier CSV"/>
<#assign importDialog_subtitle="Localisez et sélectionnez le fichier CSV contenant la liste des imprimantes multifonctions que vous souhaitez ajouter avec DocuShare Scan Service."/>
<#assign importCSV_error="Une erreur s'est produite lors de l'importation du fichier CSV."/>

<#assign failedBtnReassignDialogTitle = "Échec de la réattribution des boutons"/>
<#assign failedBtnReassignDialogSubtitle = "Une erreur s'est produite lors de la tentative de mise à jour des attributions des boutons sur les périphériques suivants :"/>
<#assign failedBtnReassignDialog_idcolLabel = "ID"/>


<#-- Edit / Add Device Page -->
<#assign editDevicePage_title="Modifier les paramètres du périphérique :"/>
<#assign editDevicePage_subtitle1="Changer les informations sur le périphérique."/>
<#assign editDevicePage_subtitle2="Changer les boutons DocuShare Scan Service attribués au périphérique."/>

<#assign addDevicePage_title="Ajouter un nouveau périphérique"/>
<#assign addDevicePage_subtitle1="Entrer les informations sur le périphérique."/>
<#assign addDevicePage_subtitle2="Attribuer des boutons Scan Service au périphérique."/>

<#assign addDevice_successMsg="Le nouveau périphérique a été enregistré."/>
<#assign addDevice_errorMsg="Erreur : impossible d'enregistrer ce périphérique."/>
<#assign editDevice_successMsg="Les paramètres du périphérique ont été mis à jour."/>
<#assign editDevice_errorMsg="Erreur : impossible d'enregistrer les mises à jour de ce périphérique."/>

<#assign deviceLabel_label="Étiquette du périphérique :"/>
<#assign deviceLabel_tip="Nom convivial de l'imprimante multifonctions Xerox."/>

<#assign deviceAddress_label="IP/Nom d'hôte du périphérique :"/>
<#assign deviceAddress_tip="Adresse réseau (Adresse IP ou nom d'hôte DNS) de l'imprimante multifonctions Xerox."/>

<#assign deviceUsername_label="Nom d'utilisateur du périphérique :"/>
<#assign deviceUsername_tip="Nom d'utilisateur de l'administrateur de l'imprimante multifonctions Xerox."/>

<#assign devicePassword_label="Mot de passe du périphérique :"/>
<#assign devicePassword_tip="Mot de passe de l'administrateur de l'imprimante multifonctions Xerox."/>

<#assign deviceBehindFirewall_label="Périphérique derrière un pare-feu ? :"/>
<#assign deviceBehindFirewall_tip="Vérifiez si le périphérique se trouve derrière un pare-feu professionnel et si les serveurs Scan Service et DocuShare sont en dehors de son périmètre."/>

<#assign serviceBtnSectionTitle="Boutons Scan Service"/>

<#assign advancedBtn="Afficher les paramètres avancés &#8250;"/>
<#assign advancedBtn_hide="&#8249; Masquer les paramètres avancés"/>
<#assign server_ip_label="Autre adresse IP/nom d’hôte du serveur Scan Service :"/>
<#assign server_ip_tip="Si l'imprimante multifonctions ne peut pas se connecter en utilisant l'IP/le nom d'hôte du serveur Scan Service par défaut (peut-être parce qu'elle est connectée via un tunnel VPN avec une adresse NAT), entrez un autre IP/Nom d'hôte."/>
<#assign server_defaultNameLabel="Adresse IP/nom d’hôte par défaut du serveur Scan Service :"/>
<#assign defaultServerTxt="(par défaut)"/>

<#assign editDevicePage_btn_applyLabel="Appliquer"/>
<#assign editDevicePage_btn_addLabel="Ajouter"/>
<#assign editDevicePage_btn_deleteButtonLabel="Supprimer le périphérique"/>
<#assign editDevicePage_link_returnToDeviceListLabel="&#8592; Retourner à la page qui contient la liste des périphériques"/>


<#--Scanning Log Page -->
<#assign scanningLog_title ="Journal de numérisation"/>
<#assign scanningLog_subtitle ="Utilisez cette page pour afficher les numérisations récentes et télécharger le journal de tous les travaux de numérisation."/>
<#assign scanningLog_retrieveErrorMsg="Erreur : impossible de récupérer le journal de numérisation."/>
<#assign btn_downloadLogLabel = "Télécharger le journal de numérisation en tant que fichier CSV&#8230;"/>

<#assign logTable_colLabel_date="Date de numérisation"/>
<#assign logTable_colLabel_destination="Destination de numérisation"/>
<#assign logTable_colLabel_device="Périphérique de numérisation"/>
<#assign logTable_colLabel_button="Bouton"/>
<#assign logTable_colLabel_username="Nom d’utilisateur"/>
<#assign logTable_colLabel_status="État"/>

<#assign logLoadingMsg="Chargement du journal de numérisation&#8230;"/>
<#assign logEmptyMsg="Le journal de numérisation est vide."/>
<#assign logpagesize_label = "Taille de page :"/>
<#assign logpagesize_help = "Nombre maximal de travaux de numérisation à afficher sur la page."/>
<#assign logfilesize_label = "Taille du journal :"/>
<#assign logfilesize_help = "Nombre maximal de travaux de numérisation à stocker dans un seul fichier journal. Changez ce paramètre lorsque vous configurez DocuShare Scan Service pour la première fois."/>
<#assign btn_updateLogfilesize_label = "Mettre à jour"/>
<#assign updateLogFileSize_error = "Une erreur s'est produite lors de la mise à jour de la taille de fichier du journal de numérisation."/>
<#assign updateLogFileSize_success = "La taille de fichier du journal de numérisation a été mise à jour."/>
<#assign status_succeeded = "Réussite"/>
<#assign status_failed = "Échec"/>

<#-- Server Log Page -->
<#assign serverLogPage_title = "Journal du serveur"/>
<#assign serverLogPage_subtitle = "Utilisez cette page pour changer le niveau de journalisation du serveur et télécharger le journal du serveur."/>
<#assign loglevel_label="Niveau de journalisation"/>
<#assign logLevel_tip="Type d'information que le service doit consigner. Les niveaux de journalisation sont présentés en ordre décroissant de gravité et les informations sont consignées pour le niveau sélectionné ainsi que pour les niveaux aussi graves ou plus graves. Par exemple, le niveau TRACE enregistre les informations correspondant à tous les niveaux, tandis que WARN enregistre seulement les informations des niveaux WARN, ERROR et FATAL."/>
<#assign btn_logDownloadLabel="Télécharger le fichier journal&#8230;"/>

<#-- Email Service Page -->
<#assign EmailServicePage_title = "Configuration du courrier électronique"/>
<#assign EmailServicePage_subtitle = "Utilisez cette page pour configurer un serveur de messagerie afin de permettre l'ajout de boutons de numérisation vers courrier électronique."/>
<#assign EmailSetup_serverSectionLabel = "Paramètres sortants du serveur de messagerie"/>
<#assign EmailSetup_servernameLabel = "Nom / adresse du serveur :"/>
<#assign EmailSetup_servernameTip = "Nom de domaine ou adresse IP du serveur de messagerie."/>
<#assign EmailSetup_protocolLabel = "Protocole :"/>
<#assign EmailSetup_protocolTip = "Protocole du serveur de messagerie sortant. Les valeurs possibles sont SMTP (par défaut), SMTP-TLS, SMTP-SSL."/>
<#assign EmailSetup_portLabel = "Port :"/>
<#assign EmailSetup_portTip = "Numéro de port du serveur de messagerie sortant. La valeur par défaut pour chaque protocole est SMTP:25, SMTP-TLS:250, SMTP-SSL:2500."/>
<#assign EmailSetup_emailUsernameLabel = "Nom d'utilisateur :"/>
<#assign EmailSetup_emailUsernameTip = "Nom d'utilisateur du compte autorisé à envoyer du courrier électronique via le serveur de messagerie sortant."/>
<#assign EmailSetup_passwordLabel = "Mot de passe :"/>
<#assign EmailSetup_passwordTip = "Mot de passe du compte utilisateur spécifié."/>
<#assign EmailSetup_messageSectionLabel = "Paramètres du message de numérisation vers courrier électronique"/>
<#assign EmailSetup_defaultFromAddressLabel = "Adresse de l'expéditeur par défaut :"/>
<#assign EmailSetup_defaultFromAddressTip = "Adresse électronique affichée dans le champ De pour tous les courriels sortants envoyés par DocuShare Scan Service."/>
<#assign EmailSetup_defaultFromAddressExample = "Par exemple : services-de-numérisation@masociété.com"/>
<#assign EmailSetup_subjectLabel = "Objet par défaut du courriel :"/>
<#assign EmailSetup_subjectTip = "Objet par défaut de tous les courriels sortants envoyés par DocuShare Scan Service si un bouton ne spécifie pas un objet."/>
<#assign EmailSetup_subjectExample = "Exemple : Nouveau document numérisé envoyé par DocuShare Scan Service"/>
<#assign EmailSetup_bodyLabel = "Corps du courriel :"/>
<#assign EmailSetup_bodyTip = "Les corps de tous les courriels sortants envoyés par DocuShare Scan Service."/>
<#assign EmailSetup_bodyExample = "Exemple : « Un nouveau document numérisé vous a été envoyé par DocuShare Scan Service »"/>
<#assign EmailSetup_isHTML_label = "Utiliser HTML pour le corps du message :"/>
<#assign EmailSetup_isHTML_tip = "Cochez cette option pour autoriser l'utilisation de balises HTML dans le corps du courrier électronique."/>
<#assign EmailSetup_advancedSectionLabel = "Paramètres avancés"/>
<#assign EmailSetup_timeoutLabel = "Temporisation :"/>
<#assign EmailSetup_timeoutTip = "Délai, en millisecondes, avant l'arrêt des tentatives d'envoi de courrier électronique ou de connexions au serveur. La valeur par défaut est de 30 000 ms."/>
<#assign EmailSetup_sslcertkeystoreLabel = "Fichier keystore du certificat SSL :"/>
<#assign EmailSetup_sslcertkeystoreTip = "Emplacement du fichier keystore SSL sur le système de fichiers du serveur.  Ce champ est requis si le protocole du serveur de messagerie est défini sur SMTP-SSL ou SMTP-TLS. Cette opération peut ne pas être requise pour certains comptes, tels que les comptes Google ou Yahoo qui ont des domaines approuvés et enregistrés auprès de l'entrepôt de données de confiance Java."/>
<#assign EmailSetup_sslcertkeystorePassLabel = "Mot de passe du fichier keystore du certificat SSL :"/>
<#assign EmailSetup_sslcertkeystorePassTip = "Mot de passe du fichier keystore."/>
<#assign EmailServicePage_formsubmit_success = "Les paramètres du courrier électronique ont été correctement enregistrés."/>
<#assign EmailServicePage_formsubmit_error = "Une erreur s'est produite lors de la tentative d'enregistrement de vos paramètres de courrier électronique."/>

<#assign EmailServicePage_SendTestEmail_btnLabel = "Envoyer courriel d'essai..."/>
<#assign EmailSetup_testConnectionWait = "Envoi d''un courrier électronique. Veuillez patienter..."/>
<#assign EmailSetup_testConnectionFailure = "Erreur : une erreur s'est produite lors de la connexion au serveur de messagerie.  Vérifiez vos paramètres et réessayez."/>
<#assign EmailSetup_testConnectionSuccess = "Le courrier électronique a été envoyé par le serveur.  Consultez votre boîte de réception pour voir si le courriel d'essai est bien arrivé. S'il est arrivé, assurez-vous de cliquer sur Appliquer si vous avez modifié les paramètres."/>
<#assign EmailSetup_testConnection_dialog_title ="Envoyer courriel d'essai..."/>
<#assign EmailSetup_testConnection_dialog_subtitle ="Tester vos paramètres en envoyant un courriel."/>
<#assign EmailSetup_testConnection_emaillabel ="Courriel d'essai :"/>
<#assign EmailSetup_testConnection_emailtip ="Adresse électronique de destination à utiliser pour tester vos paramètres."/>

<#-- Server Setup Page -->
<#assign ServerSetupPage_title = "Configuration du serveur"/>
<#assign ServerSetupPage_subtitle = "Cette page permet de paramétrer le serveur pour une utilisation avec DocuShare Scan Service."/>
<#assign ServerSetupPage_subtitle2 = "Si vous devez modifier les paramètres du serveur après l'enregistrement des périphériques, nous vous recommandons de supprimer les boutons attribués à des périphériques avant d'effectuer toute modification."/>
<#assign ServerSetupPage_subtitle3 = "Vous pouvez modifier le mot de passe du pare-feu à tout moment sans avoir à réenregistrer les périphériques."/>
<#assign ServerSetup_nameLabel = "Nom / adresse du serveur :"/>
<#assign ServerSetup_nameTip = "Nom de domaine ou adresse IP du serveur."/>
<#assign ServerSetup_protocolLabel = "Protocole :"/>
<#assign ServerSetup_prototolTip = "Protocole de transfert (par ex., http, https)."/>
<#assign ServerSetup_portLabel = "Port :"/>
<#assign ServerSetup_portTip = "Port du serveur (par ex., 8000)."/>
<#assign ServerSetup_passwordLabel = "Mot de passe de l'utilitaire de mise à jour des périphériques :"/>
<#assign ServerSetup_passwordTip = "Mot de passe requis pour accéder à l'utilitaire de mise à jour utilisé pour configurer les périphériques. Transmettez ce mot de passe à la personne autorisée à administrer les imprimantes multifonctions de sorte que les périphériques puissent être intégrés au périmètre du pare-feu."/>
<#assign ServerSetup_domainLabel = "Domaine DocuShare :"/>
<#assign ServerSetup_domainTip = "Domaine de l'utilisateur / du groupe DocuShare."/>
<#assign ServerSetup_firewallPasscodeSubtitle = "Pour permettre aux périphériques se trouvant derrière un pare-feu de se connecter au serveur DocuShare Scan Service, les périphériques doivent être configurés à l'aide de l'utilitaire de mise à jour des périphériques. Communiquez le mot de passe de l'utilitaire de mise à jour des périphériques et l'URL de téléchargement à la personne autorisée à administrer les périphériques derrière le pare-feu. Le mot de passe est requis pour pouvoir accéder à l'utilitaire de mise à jour. Si vous modifiez les paramètres du serveur ou enregistrez / désenregistrez un périphérique situé derrière un pare-feu, vous devrez spécifier à nouveau le mot de passe de l'utilitaire de mise à jour des périphériques et l'URL de téléchargement de sorte que l'utilitaire puisse être réexécuté. <p>Avant de fournir cette information, assurez-vous d'avoir enregistré au moins un périphérique situé derrière le pare-feu et de lui avoir attribué un bouton. Dans le cas contraire, la personne autorisée à administrer les périphériques ne pourra pas accéder à l'utilitaire.</p>"/>
<#assign ServerSetup_registerDeviceBehindFirewallURLLabel = "URL de téléchargement de l'utilitaire de mise à jour des périphériques :"/>
<#assign ServerSetup_registerDeviceBehindFirewallURLTip = "Emplacement de la page Web à partir de laquelle la personne autorisée à administrer les imprimantes multifonctions télécharge un fichier d'utilitaire à exécution automatique pour la configuration des périphériques."/>
<#assign ServerSetup_registerDeviceBehindFirewallURLEndNote = "Copiez cette URL en la sélectionnant et en appuyant sur les touches Ctrl-C (Cmd-C sur un Mac), puis collez-la dans un courriel."/>
<#macro devicesRegisteredEditWarning deviceNum> <strong>Remarque :</strong> ${deviceNum} un ou plusieurs périphériques ont déjà été enregistrés à l'aide de ces paramètres. Si vous modifiez les paramètres, ces périphériques ne pourront plus se connecter au serveur DocuShare Scan Service. Tout d'abord, désattribuez les boutons pour chaque périphérique, puis revenez sur cette page pour modifier les paramètres du serveur.</#macro>
<#assign editServerSettingsWhileRegisteredBtnLabel = "Modifier malgré tout"/>
<#assign ServerSetup_ServerSettingsSectionLabel = "Paramètres du serveur"/>
<#assign ServerSetup_FirewallPasscodeSectionLabel = "Paramètres du pare-feu"/>
<#assign ServerSetup_formsubmit_success = "Les paramètres du serveur ont été correctement enregistrés."/>
<#assign ServerSetup_formsubmit_error = "Une erreur s'est produite lors de la tentative d'enregistrement de vos paramètres de serveur."/>

<#assign ServerSetup_buttonSettings = "Paramètres du bouton Numérisation"/>
<#assign ServerSetup_dateFormatLabel = "Format de date"/>
<#assign ServerSetup_dateFormatHelp = "Format de date à utiliser lorsqu'un bouton de numérisation inclut un champ permettant de spécifier une propriété de date. Le paramètre du format de date n'est pas utilisé pour les propriétés de chaîne."/>
<#assign ServerSetup_dateFormatMonthFirst = "mm/jj/aaaa"/>
<#assign ServerSetup_dateFormatDayFirst = "dd/mm/yyyy"/>
<#assign ServerSetup_dateFormatYearFirst = "jjjj-mm-aa"/>
<#assign ServerSetup_dateFormatYearFirst2 = "aaaammjj"/>

<#assign ServerSetup_xeroxAppGallery = "Xerox&#174; App Gallery"/>
<#assign ServerSetup_xeroxAppGallerySubtitle = "Xerox&#174; App Gallery fournit des applications DocuShare Scan Service permettant d'étendre les fonctionnalités de vos imprimantes multifonctions compatibles avec DocuShare Scan Service. L'application de numérisation Xerox&#174; pour DocuShare permet aux utilisateurs DocuShare de numériser des documents vers leurs dossiers personnels. <p>L'activation de l'utilisation de l'application ajoute un bouton spécifique à DocuShare Scan Service pour l'application Numériser vers DocuShare et un bouton de numérisation appelé Dossier personnel à la page Liste des boutons. Ces boutons disparaissent de la page lorsque l'application est désactivée. Si l'application est utilisée sur une imprimante multifonctions que vous n'avez pas configurée, l'une de vos connexions à une imprimante multifonctions sous licence sera utilisée à la place.</p>"/>
<#assign ServerSetup_xeroxAppGalleryEnable = "Activation de l'application de numérisation pour DocuShare"/>
<#assign ServerSetup_xeroxAppGalleryEnableHelp = "Cochez cette case pour permettre aux utilisateurs DocuShare d'utiliser l'application DocuShare Scan Service pour numériser des documents vers leurs dossiers personnels."/>

<#-- Common dbAgent Page Messages. -->
<#assign dsConnectionProgress="Établissement d'une connexion.  Veuillez patienter&hellip;"/>
<#assign dsProperty_noMapping = "Aucun"/>
<#assign dsWizard_next = "Suivant &#8250;"/>
<#assign dsWizard_back = "&#8249; Précédent"/>
<#assign dbsmPage_delete_btn_label = "Supprimer le menu"/>
<#assign dbsmPage_apply_btn_label = "Appliquer"/>
<#assign dbsmPage_return_to_listing_page = "&#8592; Retourner à la page qui contient la liste des menus ODBC"/>
<#assign dataSourceTable_col_actions = "Actions" />
<#assign dataSourceTable_action_Edit_label = "Modifier"/>
<#assign dataSourceTable_action_Delete_label = "Supprimer"/>
<#assign dsAssignedButtons = "Boutons affectés :" />
<#assign dsAssignedDMS = "Jeux de menus dépendants affectés :" />
<#assign dsColumnLookupError = "Échec du chargement des colonnes de la source de données."/>
<#assign dsConnectionError = "Échec de connexion à la source de données.  Vérifiez vos paramètres de connexion et réessayez."/>
<#assign dsObjPropsRequiredLookupError = "Impossible de charger les propriétés facultatives pour le type de document sélectionné."/>
<#assign dsObjPropsOptionalLookupError = "Impossible de charger les propriétés requises pour le type de document sélectionné."/>
<#assign dbsmNoIllegalCharsError = "Ces caractères ne sont pas autorisés :"/>
<#assign datasource_prop_mapping_restricted = "Pourquoi m'est-il impossible d'effectuer une modification ?"/>
<#assign datasource_prop_mapping_restricted_delete = "Pourquoi m'est-il impossible d'effectuer une suppression ?"/>
<#assign datasource_restricted_modify = "Pourquoi m'est-il impossible d'appliquer ou de supprimer ?"/>

<#-- Autofill Profiles Listing Page -->
<#assign AutoFillProfilePage_title = "Profils de remplissage automatique"/>
<#assign AutoFillProfilePage_subtitle = "Utilisez cette page pour ajouter des profils de remplissage automatique pour les types de document. Lors de l'utilisation d'un profil de remplissage automatique avec un bouton de numérisation, les valeurs de propriété supplémentaires sont stockées avec les documents numérisés en fonction des valeurs de propriété que les utilisateurs saisissent sur l'écran tactile de l'imprimante multifonctions."/>
<#assign btnLabel_AddAutofillProfile = "Ajouter un profil de remplissage automatique..."/>
<#assign btnLabel_DeleteSelAutofillProfiles = "Supprimer la sélection"/>
<#assign autofillTable_col_name = "Nom de profil" />
<#assign autofillTable_col_datasource = "Type et emplacement ODBC" />
<#assign autofillTable_col_mapping = "Colonne &rarr; Mappage des propriétés"/>
<#assign autofillTable_col_tablename = "Table/feuille de calcul" />
<#assign autofillTable_col_doctype = "Type de document" />
<#assign autofillTable_col_actions = "Actions" />
<#assign autofillTable_col_buttonsUsing = "Affectations du bouton Numérisation"/>
<#assign action_deleteAFPConfirmMsg = "Confirmer la suppression des profils sélectionnés ?" />
<#assign action_deleteAFPSuccessMsg = "Les profils ont été supprimés." />
<#assign action_deleteAFPFailureMsg = "Une erreur s'est produite lors de la suppression des profits sélectionnés." />
<#assign action_deleteAFPMappedFailureMsg = "Erreur : impossible de supprimer un ou plusieurs profils sélectionnés, car ils sont actuellement utilisés sur des boutons de numérisation." />
<#assign useforAutofillTip = "Utilisez ce champ de propriété pour remplir automatiquement tous les autres champs mappés."/>
<#assign autofillTable_noAssignedButtons = "Aucun"/>
<#assign autofillTable_noProfiles = "Aucun profil de remplissage automatique n'a été configuré. Cliquez sur le bouton « Ajouter un profil de remplissage automatique » ci-dessus pour créer un nouveau profil."/>
<#assign autofillTable_action_DeleteDisabled = "Vous ne pouvez pas supprimer ce profil de remplissage automatique, car il est utilisé par un ou plusieurs boutons de numérisation.  Supprimez son utilisation sur chaque page des paramètres du bouton Modifier avant de le supprimer."/>

<#-- Autofill Profile Add/Edit Page -->
<#assign AutoFillProfilePage_add_title = "Ajouter un profil de remplissage automatique" />
<#assign AutoFillProfilePage_add_subtitle = "Pour ajouter un profil de remplissage automatique, vous devez tout d'abord configurer la connexion ODBC, puis mapper les propriétés du document DocuShare aux colonnes de la table. " />
<#assign AutoFillProfilePage_edit_title = "Modifier un profil de remplissage automatique :" />
<#assign AutoFillProfilePage_edit_subtitle = "Modifiez les paramètres du profil de remplissage automatique." />
<#assign AutoFillProfilePage_mappedBtnWarning = "<strong>Remarque :</strong> ce profil est utilisé par un ou plusieurs boutons de numérisation. Vous ne pouvez donc pas le modifier ou le supprimer.  Supprimez son utilisation sur chaque page des paramètres du bouton Modifier avant de le modifier ou de le supprimer."/>

<#assign afp_name_label = "Nom de profil :" />
<#assign afp_name_tip = "Nom unique du profil de remplissage automatique." />
<#assign afp_name_fielderror_duplicatename="Ce nom est déjà utilisé. Veuillez saisir un autre nom."/>
<#assign afp_dsconn_heading ="Étape 1 de 2 : configurer la connexion ODBC"/>
<#assign afp_dsconn_subheading ="Saisissez les informations de connexion à la source de données."/>
<#assign afp_datasource_label = "Type ODBC :" />
<#assign afp_datasource_tip = "Type de la source de données." />
<#assign afp_dbname_label = "Emplacement du nom/fichier ODBC :" />
<#assign afp_dbname_tip = "Spécifiez le nom de la base de données, si vous utilisez une base de données serveur ou l'emplacement du fichier, si vous utilisez un fichier de base de données se trouvant sur le système de fichiers ou une feuille de calcul Microsoft Excel." />
<#assign afp_username_label = "Nom d'utilisateur :" />
<#assign afp_username_tip = "Nom d'utilisateur de la base de données." />
<#assign afp_password_label = "Mot de passe :" />
<#assign afp_password_tip = "Mot de passe du nom d'utilisateur de la base de données." />
<#assign afp_host_label = "Hôte :" />
<#assign afp_host_tip = "Adresse IP ou DNS de la base de données." />
<#assign afp_port_label = "Port :" />
<#assign afp_port_tip = "Numéro de port de la base de données." />
<#assign afp_table_label = "Nom de la table/feuille de calcul :" />
<#assign afp_table_tip = "Spécifie un nom de table de bases de données ou un nom de feuille de calcul Microsoft Excel." />
<#assign afp_doctype_label = "Type de document :" />
<#assign afp_doctype_tip = "Type de document DocuShare." />

<#assign afp_return_to_listing_page = "&#8592; Retourner à la page qui contient la liste des profils de remplissage automatique"/>
<#assign afp_delete_profile_btn_label = "Supprimer un profil"/>
<#assign afp_dbsettings_heading = "Paramètres ODBC"/>

<#assign afp_mapping_heading = "Étape 2 de 2 : mapper les propriétés du document DocuShare aux colonnes de la table"/>
<#assign afp_mapping_subheading = "Mappez les colonnes de la table de la source de données spécifiée aux propriétés du type de document sélectionné. Lorsque les utilisateurs numérisent des documents sur un périphérique et qu'ils entrent des valeurs pour les propriétés marquées comme étant « Requises pour le remplissage automatique », toutes les autres propriétés mappées seront automatiquement renseignées avec les bonnes valeurs provenant de la source de données ODBC affectée. Remarque : Pour ajouter ou enregistrer un profil, vous avez besoin d'au moins un champ mappé requis (« Requis pour le remplissage automatique ») et d'un champ mappé facultatif."/>
<#assign afp_mapping_table_colhead_name = "Nom de colonne"/>
<#assign afp_mapping_table_colhead_dsprop = "Propriété DocuShare"/>
<#assign afp_mapping_table_colhead_primary = "Requis pour le remplissage automatique"/>
<#assign afp_mapping_table_colhead_primary_tip = "Sélectionnez les champs qui devront avoir une valeur de sorte que les autres champs mappés puissent être remplis automatiquement."/>
<#assign afp_mapping_table_notsetup = "Sélectionnez une table/feuille de calcul de source de données et un type de document DocuShare afin de configurer le mappage des propriétés pour la fonction de remplissage automatique."/>

<#assign afp_mapping_property_requiredFields = "Champs obligatoires"/>
<#assign afp_mapping_property_optionalFields = "Champs facultatifs"/>
<#assign afp_edit_successMsg = "Le profil de remplissage automatique a été mis à jour."/>
<#assign afp_edit_failureMsg = "Erreur : une erreur s'est produite lors de la mise à jour du profil de remplissage automatique."/>
<#assign afp_add_successMsg = "Un profil de remplissage automatique a été ajouté."/>
<#assign afp_add_failureMsg = "Erreur : une erreur s'est produite lors de l'ajout du profil de remplissage automatique."/>
<#assign action_deleteSingleAFPConfirmMsg = "Confirmer la suppression de ce profil de remplissage automatique ? Cette action ne peut pas être annulée."/>
<#assign action_deleteSingleAFPSuccessMsg = "Le profil de remplissage automatique a été supprimé."/>
<#assign action_deleteSingleAFPFailureMsg = "Erreur : une erreur s'est produite lors de la suppression du profil de remplissage automatique."/>
<#assign noAutofillCbxError = "Veuillez cocher au moins une case « Requis pour le remplissage automatique »."/>
<#assign twoMappedFieldMinimumError = "Pour ajouter ou enregistrer un profil, vous avez besoin d'au moins un champ mappé requis (« Requis pour le remplissage automatique ») et d'un champ mappé facultatif."/>
<#assign afp_EditDisabled = "Vous ne pouvez pas supprimer ou modifier ce profil de remplissage automatique, car il est utilisé par un ou plusieurs boutons de numérisation.  Supprimez son utilisation sur chaque page des paramètres du bouton Modifier avant de le supprimer ou d'apporter des modifications. Consultez la liste des boutons de numérisation affectés."/>



<#-- Simple Datasource Menus Listing Page -->
<#assign DatasourceMenuPage_title = "Menus ODBC" />
<#assign DatasourceMenuPage_subtitle = "Utilisez cette page pour ajouter des menus ODBC. Ajoutez un menu ODBC pour récupérer des valeurs issues d'une source de données utilisées dans un menu affecté à une propriété de document DocuShare." />
<#assign btnLabel_AddDatasourceMenu = "Ajouter un menu ODBC..."/>
<#assign btnLabel_DeleteSelDataSourceMenus = "Supprimer la sélection"/>
<#assign dataSourceTable_col_menuname = "Nom" />
<#assign dataSourceTable_col_type = "Type" />
<#assign dataSourceTable_col_datasource = "Type et emplacement ODBC" />
<#assign dataSourceTable_col_tablesource = "Étiquette de menu et source des valeurs (table/colonne)"/>
<#assign dataSourceTable_col_tablesource_label = "Étiquette :"/>
<#assign dataSourceTable_col_tablesource_value = "Valeur :"/>
<#assign dataSourceTable_col_property = "Affectée à une propriété DocuShare (type de document/propriété)" />
<#assign dataSourceTable_col_dms = "Affectations des jeux de menus dépendants ODBC">
<#assign dataSourceTable_type_dsMenuTip = "Menu ODBC simple">
<#assign dataSourceTable_empty = "Aucun menu ODBC n'a été configuré. Cliquez sur le bouton « Ajouter un menu ODBC... » ci-dessus pour créer un nouveau menu."/>

<#assign dsm_deleteaction_mappedbtn_msg="Ce menu ODBC est utilisé par un ou plusieurs <strong>boutons de numérisation</strong>. Supprimez son utilisation sur chaque page des paramètres du bouton Modifier avant de le supprimer."/>
<#assign dsm_deleteaction_dm_msg="Ce menu ODBC est utilisé par un ou plusieurs <strong>jeux de menus dépendants</strong>. Supprimez son utilisation sur chaque menu dépendant avant de le supprimer."/>
<#assign dsm_deleteaction_mappedbtnanddm_msg="Ce menu ODBC est utilisé par un ou plusieurs <strong>jeux de menus dépendants</strong> et <strong>boutons de numérisation</strong>.  La suppression du menu entraînera la désactivation de tous les boutons de numérisation ou de tous les jeux de menus dépendants ayant été affectés. Supprimez son utilisation sur chaque menu dépendant et bouton de numérisation affectés avant de le supprimer."/>
<#assign dbsmPage_mappingDisabledPropTip = "Ce menu ODBC est utilisé par un ou plusieurs boutons de numérisation affectés.  La modification du menu entraînera la désactivation de tous les boutons de numérisation affectés.  Supprimez son utilisation sur chaque bouton de numérisation affecté avant de modifier cette propriété."/>

<#-- ODBC Menu Add/Edit Page -->
<#assign dbsmPage_add_title = "Ajouter un menu ODBC" />
<#assign dbsmPage_add_subtitle = "Pour ajouter un menu ODBC, vous devez tout d'abord configurer la connexion ODBC, puis attribuer le menu ODBC a une propriété de document DocuShare." />
<#assign dbsmPage_edit_title = "Modifier un menu ODBC :" />

<#assign dbsmPage_mappedBtnWarning = "Ce menu ODBC est utilisé par un ou plusieurs <strong>boutons de numérisation</strong>. Il est donc impossible de modifier son type de document affecté et ses valeurs de propriétés DocuShare (indiquées à l'étape 2).  D'abord, supprimez son utilisation dans les boutons affectés (indiqués dans la liste des affectations), puis revenez sur cette page pour modifier les propriétés ou supprimer le menu."/>
<#assign dbsmPage_mappedDMSWarning = "Ce menu ODBC est utilisé par un ou plusieurs <strong>jeux de menus dépendants</strong>. Il est donc impossible de modifier ses paramètres.  Tout d'abord, supprimez son utilisation dans les jeux de menus dépendants affectés figurant sur la liste, puis revenez sur cette page pour effectuer les modifications."/>
  <#assign dbsmPage_mappedBtnAndDMSWarning = "Ce menu ODBC est utilisé par un ou plusieurs <strong>jeux de menus dépendants</strong> et <strong>boutons de numérisation</strong>. Si le menu est utilisé dans des jeux de menus dépendants, ses paramètres ne pourront pas être modifiés.  Tout d'abord, supprimez son utilisation dans les jeux de menus dépendants affectés figurant sur la liste, puis revenez sur cette page pour effectuer les modifications.  Si le menu est affecté à un bouton de numérisation, son type de document affecté et ses valeurs de propriété DocuShare (indiquées à l'étape 2) ne pourront pas être modifiés."/>

<#assign dbsmPage_edit_subtitle = "Modifiez les paramètres du menu ODBC." />
<#assign dbsm_name_label = "Nom du menu :"/>
<#assign dbsm_name_tip = "Nom unique du menu ODBC."/>
<#assign dbsm_name_fielderror_duplicatedtitle="Un autre menu ODBC porte le même nom. Veuillez entrer un nom unique."/>
<#assign dbsm_property_label = "Propriété DocuShare :"/>
<#assign dbsm_property_tip = "Propriété DocuShare à utiliser pour le menu ayant des options issues de données ODBC."/>
<#assign dbsm_columnforlabel_label = "Colonne de l'étiquette de menu :"/>
<#assign dbsm_columnforlabel_tip = "Colonne de la source de données à utiliser pour la liste des étiquettes d'options du menu. Par défaut, il s'agit de la même colonne attribuée à la valeur de menu."/>
<#assign dbsm_columnforvalue_label = "Colonne de la valeur de menu :"/>
<#assign dbsm_columnforvalue_tip = "Colonne de la source de données à utiliser pour la liste des valeurs d'options du menu."/>
<#assign dbsmPage_mapping_title = "Étape 2 de 2 : Affecter le menu ODBC à une propriété DocuShare"/>
<#assign dbsmPage_mapping_subtitle = "Choisissez une table/feuille de calcul et une colonne de la source de données sélectionnée qui seront utilisées comme valeurs pour un menu ODBC. Vous pouvez également sélectionner une colonne qui sera utilisée comme étiquette d'élément de menu. Ensuite, sélectionnez un type de document DocuShare et l'une de ses propriétés qui seront utilisés pour le menu dont les options seront renseignées lors de la numérisation."/>

<#assign dbsmPage_prop_mappingdisabledwarningtp = ""/>

<#assign dbsmPage_edit_successMsg = "Le menu ODBC a été mis à jour."/>
<#assign dbsmPage_edit_failureMsg = "Erreur : Une erreur s'est produite lors de la mise à jour du menu ODBC."/>
<#assign dbsmPage_add_successMsg = "Un menu ODBC a été ajouté."/>
<#assign dbsmPage_add_failureMsg = "Erreur : Une erreur s'est produite lors de la mise à jour du menu ODBC."/>

<#assign action_deleteDSMenuConfirmMsg = "Confirmer la suppression des menus ODBC sélectionnés ? Cette action ne peut pas être annulée."/>
<#assign action_deleteDSMenuSuccessMsg = "Vous avez supprimé les menus ODBC sélectionnés."/>
<#assign action_deleteDSMenuFailureMsg = "Erreur : Une erreur s'est produite lors de la suppression des menus ODBC sélectionnés."/>
<#assign action_deleteDSMenuMappedFailureMsg = "Erreur : Un ou plusieurs menus ODBC sélectionnés sont utilisés par des boutons de numérisation ou des jeux de menus dépendants. Ils ne peuvent donc pas être supprimés."/>

<#assign action_deleteSingleDSMenuConfirmMsg = "Confirmer la suppression de ce menu ODBC ? Cette action ne peut pas être annulée."/>
<#assign action_deleteSingleDSMenuSuccessMsg = "Le menu ODBC a été supprimé."/>
<#assign action_deleteSingleDSMenuFailureMsg = "Erreur : Une erreur s'est produite lors de la suppression du menu ODBC."/>


<#-- ODBC Dependent Menu Set Listing Page -->
<#assign dmsPage_title = "Jeux de menus dépendants ODBC" />
<#assign dmsPage_subtitle = "Utilisez cette page pour ajouter un jeu de menus dépendants ODBC en reliant un ou plusieurs menus ODBC prédéfinis." />
<#assign dmsPage_addBtn = "Ajouter un jeu de menus dépendants ODBC..."/>
<#assign dmsPage_deleteSelectedBtn = "Supprimer la sélection"/>

<#assign dmsPage_action_deleteConfirmMsg_multi = "Confirmer la suppression des jeux de menus dépendants ODBC sélectionnés ?" />
<#assign dmsPage_action_deleteSuccessMsg_multi = "Les jeux de menus dépendants ODBC sélectionnés ont été supprimés." />
<#assign dmsPage_action_deleteFailureMsg_multi = "Une erreur s'est produite lors de la suppression des jeux de menus dépendants ODBC sélectionnés." />
<#assign dmsPage_action_deleteFailureMappingMsg_multi = "Erreur : Un ou plusieurs jeux sélectionnés sont utilisés par sur boutons de numérisation. Ils ne peuvent donc pas être supprimés." />
<#assign dmsPage_action_deleteConfirmMsg_single = "Confirmer la suppression du jeu de menus dépendants ODBC sélectionné ?" />
<#assign dmsPage_action_deleteSuccessMsg_single= "Le jeu de menus dépendants ODBC sélectionné a été supprimé." />
<#assign dmsPage_action_deleteFailureMsg_single = "Une erreur s'est produite lors de la suppression du jeu de menus dépendants ODBC sélectionné." />

<#assign dmsPage_table_empty = "Aucun jeu de menus dépendants ODBC n'a été configuré. Cliquez sur le bouton « Ajouter un jeu de menus dépendants ODBC... » ci-dessus pour créer un nouveau jeu.">
<#assign dmsPage_table_iconTip = "Jeu de menus dépendants ODBC">
<#assign dmsPage_table_col_name = "Nom de jeu de menus">
<#assign dmsPage_table_col_menus = "Menus utilisés">
<#assign dmsPage_table_col_btnsassigned = "Utilisation de boutons">
<#assign dmsPage_table_col_actions = "Actions">
<#assign dmsPage_table_col_action_DeleteDisabled = "Vous ne pouvez pas supprimer ce jeu de menus dépendants car un ou plusieurs boutons l'utilisent.  Supprimez son utilisation sur la page des paramètres du bouton Modifier pour chaque bouton avant de le supprimer."/>


<#-- ODBC Dependent Menu Set Add/Edit Page -->
<#assign dmPage_add_title = "Ajouter un jeu de menus dépendants ODBC"/>
<#assign dmPage_add_subtitle = "Sélectionnez une série de menus ODBC existants dont les valeurs dépendent les unes des autres. Sélectionnez un menu principal, puis choisissez un ou plusieurs menus dépendants. Mappez l'étiquette de chaque option de menu à une valeur issue d'une colonne de la table de la source de données afin de relier son menu dépendant."/>
<#assign dmPage_edit_title = "Modifier un jeu de menus dépendants ODBC :"/>
<#assign dmPage_edit_subtitle = "Modifiez les paramètres du jeu de menus dépendants ODBC."/>
<#assign dmPage_mappedBtnWarning = "<strong>Remarque :</strong> ce jeu de menus dépendants étant utilisé par un ou plusieurs boutons de numérisation, vous ne pouvez pas modifier ses sélections de menus de la source de données ou le supprimer.  Tout d'abord, supprimez l'utilisation du jeu de menus dépendants sur la page des paramètres du bouton Modifier pour chaque bouton, puis revenez sur cette page pour modifier ses sélections de menus de la source de données ou le supprimer.  Vous pouvez modifier les paramètres dans la section Mapper les valeurs du menu."/>
<#assign dmPage_mappedBtnNoDeleteTip = ""/>

<#assign dmPage_profileName_label="Nom du jeu de menus dépendants ODBC :"/>
<#assign dmPage_profileName_tip="Nom unique du jeu de menus dépendants ODBC."/>
<#assign dmPage_profileName_fielderror_duplicatedtitle="Un autre jeu de menus dépendants ODBC porte le même nom. Veuillez entrer un nom unique."/>
<#assign dmPage_section_SelectODBCMenus = "Sélectionner des menus de la source de données"/>
<#assign dmPage_section_SelectODBCMenus_subtitle = "Sélectionnez un menu principal, puis choisissez un ou plusieurs menus dont les valeurs dépendent les unes des autres."/>
<#assign dmPage_primaryMenuLabel= "Menu principal :"/>
<#assign dmPage_primaryMenuTip= "Menu ODBC principal intégré au jeu. Celui-ci utilise les paramètres de base de données, de table et de colonne du menu ODBC."/>
<#assign dmPage_dependentMenuLabel1= "Menu dépendant 1 :"/>
<#assign dmPage_dependentMenuTip1= "Premier menu ODBC dépendant intégré au jeu. Celui-ci utilise uniquement les paramètres de base de données et de table du menu ODBC."/>
<#assign dmPage_dependentMenuLabel2= "Menu dépendant 2 :"/>
<#assign dmPage_dependentMenuTip2= "Second menu ODBC dépendant intégré au jeu. Celui-ci utilise uniquement les paramètres de base de données et de table du menu ODBC."/>
<#assign dmPage_add_dm="Ajouter un menu dépendant"/>
<#assign dmPage_remove_dm="Supprimer un menu dépendant"/>
<#assign dmPage_menuoption_none="Aucun"/>
<#assign dmPage_noODBCMenus = "Vous ne pouvez pas ajouter un jeu de menus dépendants ODBC car il n'existe aucun menu ODBC. Rendez-vous sur la page des menus ODBC pour ajouter un menu."/>

<#assign dmPage_section_MapMenuValues = "Mapper les valeurs de menu"/>
<#assign dmPage_section_MapMenuValues_subtitle = "Mappez les valeurs pour chaque option de menu à son menu dépendant en définissant la colonne de la source de données pour ses valeurs de menu et pour ses étiquettes, le cas échéant."/>
<#assign dmPage_returntolisting = "&#8592; Retourner à la page qui contient la liste des jeux de menus dépendants ODBC"/>
<#assign dmPage_mapingtable_emptyoptionshelp="&larr; Sélectionner les colonnes pour les étiquettes et les valeurs des options."/>
<#assign dmPage_addBtnLabel="Ajouter"/>
<#assign dmPage_deleteBtnLabel="Supprimer un jeu de menus"/>
<#assign dmPage_colMenuNoSelection="Sélectionner une colonne&#8230;"/>
<#assign dmPage_maptblhdr_mapping ="Mappage"/>
<#assign dmPage_maptblhdr_options ="Options"/>
<#assign dmPage_maptblhdr_optscolsubheading ="Étiquette : Valeur"/>
<#assign dmPage_maptblhdr_colforlabel ="Colonne de l'étiquette"/>
<#assign dmPage_maptblhdr_colforvalue ="Colonne de la valeur"/>


<#-------------------------------------->
<#---------- MFD UI Messages ----------->
<#-------------------------------------->
<#assign browseCollection_MenuLabel = "Sélectionner un dossier :">
<#assign browseCollection_selectBtnLabel = "Sélectionner un dossier"/>
<#assign browseCollection_ResponseError = "Erreur : dossier introuvable ou problème de connexion au serveur DocuShare."/>
<#assign browseCollection_UpOneLevel = "Dossier parent"/>

<#assign browseFolder_MenuLabel = "Sélectionner un dossier :">
<#assign browseFolder_selectBtnLabel = "Sélectionner un dossier"/>
<#assign browseFolder_ResponseError = "Erreur : dossier réseau introuvable ou problème de connexion au réseau."/>
<#assign emailSubjectLabel = "Objet du courriel"/>
<#assign folderSubjectLabel = "Nom de fichier"/>
<#assign sendingScanToTxt = "Envoi de la numérisation à :"/>

<#-- MFP Device Emulator List Page -->

<#assign EmulatorPage_title="Émulateur d’imprimante multifonction"/>
<#assign EmulatorPage_subtitle="Utiliser cette page pour émuler la fonctionnalité multifonction. Cliquer sur un bouton pour lancer la numérisation."/>


