<#-------------------------------------->
<#-------- Admin UI Messages ----------->
<#-------------------------------------->

<#-- StandAlone Menu -->
<#assign standalone_menu_title = "Menú Scan Service"/>
<#assign link_configBtnsLabel="Configurar botones"/>
<#assign link_configBtnsTip="Agregue y configure los botones de Scan Service en impresoras multifunción."/>
<#assign link_configDevicesLabel="Configurar dispositivos"/>
<#assign link_configDevicesTip="Configure las impresoras multifunción que desea usar con Scan Service de DocuShare y administre los botones asignados a los dispositivos."/>
<#assign link_scanLogLabel="Registro de escaneado"/>
<#assign link_scanLogTip="Vea la actividad de escaneado más reciente y descargue el registro de todos los trabajos de escaneado."/>
<#assign link_logSettingsLabel="Registro del servidor"/>
<#assign link_logSettingsTip="Cambie el nivel de registro del servidor y descargue el registro del servidor."/>
<#assign link_emailServiceLabel="Configuración de e-mail"/>
<#assign link_emailServiceTip="Configure el servicio de e-mail."/>
<#assign link_configureServerLabel="Configuración del servidor" />
<#assign link_configureServerTip="Configure las opciones del servidor de Scan Service de DocuShare." />
<#assign link_autoFillProfileLabel = "Perfiles de relleno automático"/>
<#assign link_autoFillProfileTip = "Use esta página para agregar perfiles de relleno automático para varios tipos de documentos. Agregue un perfil de relleno automático para incluir valores adicionales de propiedades en los documentos escaneados según los valores de la propiedad especificados por los usuarios en la pantalla táctil de la impresora multifunción."/>
<#assign link_dataSourceMenusLabel = "Menús ODBC"/>
<#assign link_dataSourceMenusTip = "Utilice esta página para agregar menús ODBC. Agregue un menú ODBC para recuperar valores de orígenes de datos que se usan en menús asignados a propiedades de documentos de DocuShare. Puede agregar dos tipos de menús: conjuntos de menús dependientes o simples."/>
<#assign link_dataSourceDependentMenusLabel = "Conjuntos de menús dependientes ODBC"/>
<#assign link_dataSourceDependentMenusTip = "Use esta página para agregar un conjunto de menús dependientes ODBC para vincular uno o varios menús ODBC predefinidos."/>
<#assign link_heading_serverconfig = "Configuración del servidor"/>
<#assign link_heading_logs = "Registros"/>
<#assign link_heading_odbc = "Conectores ODBC"/>
<#assign link_heading_Emulator = "Emulador de dispositivos"/>
<#assign link_EmulatorTip = "Use esta página para emular el dispositivo."/>
<#assign link_EmulatorLabel="Emulador"/>

<#-- Form validation general strings -->
<#assign validationErrorGeneralMsg="Corrija los errores más abajo."/>
<#assign fieldErrorTitle="Error:"/>
<#assign fielderror_empty="El campo no puede estar vacío."/>


<#-- Configure Buttons List Page -->
<#assign deleteAction_confirm="¿Está seguro de que desea eliminar este botón? Esta acción no se puede deshacer. ¿Desea continuar?"/>
<#assign deleteAction_error="Error: El botón no se pudo eliminar."/>
<#assign deleteAction_success="El botón se eliminó correctamente."/>

<#assign configBtnPage_title="Configurar botones"/>
<#assign configBtnPage_subtitle="Use esta página para agregar y configurar botones de Scan Service de DocuShare en impresoras multifunción. Para empezar, agregue un nuevo botón de Scan Service de DocuShare. A continuación, agregue botones de escaneado secundarios y botones de carpeta secundarios (para organizar los botones de escaneado) en el botón de Scan Service de DocuShare."/>
<#assign link_addScanButtonLabel="Nuevo botón de Scan Service&#8230;"/>
<#assign emptyBtnListMsg="Todavía no se ha creado ningún botón."/>
<#assign link_emptyBtnListNewLink="Haga clic aquí para crear un nuevo botón."/>
<#assign listheading_button="Botón"/>
<#assign listheading_type="Tipo"/>
<#assign listheading_access="Acceso"/>
<#assign listheading_actions="Acciones"/>

<#assign buttonTip="Ver/editar botón..."/>
<#assign btnTreeBtn_collapse_label="Contraer"/>
<#assign btnTreeBtn_expand_label="Expandir"/>
<#assign btnTreeBtn_collapse_tooltip="Ocultar lista de botones secundarios."/>
<#assign btnTreeBtn_expand_tooltip="Mostrar lista de botones secundarios."/>

<#assign btnType_service="Botones de Scan Service de DocuShare"/>
<#assign btnType_folder="Botón de carpeta"/>
<#assign btnType_scan="Botón de escaneado"/>
<#assign groupAccessOnlyLabel="Solo acceso de grupo"/>
<#macro groupAccessOnlyTip handle>Restringido al grupo de DocuShare (${handle})</#macro>

<#assign action_addFolderBtnLabel="Agregar botón secundario de carpeta"/>
<#assign action_addFolderBtnTip="Agregar botón secundario de carpeta"/>
<#assign action_addScanBtnLabel="Agregar botón de escaneado secundario"/>
<#assign action_addScanBtnTip="Agregar botón de escaneado secundario"/>
<#assign action_editPropsBtnLabel="Ver/Editar opciones"/>
<#assign action_editPropsBtnTip="Ver/Editar opciones"/>
<#assign action_editPermissionsBtnLabel="Cambiar permisos"/>
<#assign action_editPermissionsBtnTip="Cambiar permisos"/>
<#assign action_deleteBtnLabel="Eliminar botón"/>
<#assign action_deleteBtnTip="Eliminar botón"/>
<#assign btn_expandtree_label="Expandir todo"/>
<#assign btn_expandtree_help="Mostrar todos los botones secundarios."/>
<#assign btn_collapsetree_label="Contraer todo"/>
<#assign btn_collapsetree_help="Ocultar todos los botones secundarios."/>
<#assign colhead_tip_accessLevel="Nivel de acceso (Invitado o Grupo de DocuShare)"/>
<#assign colhead_tip_scanType="Tipo de escaneado (carpeta de red, e-mail o carpeta de DocuShare)"/>
<#assign scantype_tip_DocuShare="Escanear a carpeta de DocuShare"/>
<#assign scantype_tip_NetworkFolder="Escanear a carpeta de red"/>
<#assign scantype_tip_Email="Escanear a e-mail"/>


<#-- Edit Button Settings, Edit Button Permissions, Add Buttons Pages -->
<#macro title_editsettings buttontypelabel buttonlabel>Editar configuración de ${buttontypelabel}:  <span class="quiet">${buttonlabel}</span></#macro>
<#assign subtitle_editsettings="Utilice esta página para editar la configuración del botón."/>
<#macro title_editpermissions buttontypelabel buttonlabel>Editar permisos de ${buttontypelabel}:  <span class="quiet">${buttonlabel}</span></#macro>
<#assign subtitle_editpermissions="Use esta página para controlar el acceso al botón en el dispositivo."/>
<#macro title_add buttontypelabel>Agregar ${buttontypelabel}</#macro>
<#macro subtitle_add buttontypelabel>Utilice esta página para agregar un nuevo ${buttontypelabel}.</#macro>


<#macro fielderror_userHandleNotFound handle>El usuario con el identificador <code>${handle}</code> ya no está en el sitio. Seleccione otro usuario.</#macro>
<#macro fielderror_groupHandleNotFound handle>El grupo con el identificador <code>${handle}</code> ya no está en el sitio. Seleccione otro grupo.</#macro>
<#macro fielderror_CollectionHandleNotFound handle>La carpeta con el identificador <code>${handle}</code> ya no está en el sitio. Seleccione otra carpeta.</#macro>
<#assign editbtn_formsubmit_success = "La configuración del botón se actualizó correctamente."/>
<#assign editbtn_formsubmit_error = "Error. No se pudieron guardar las actualizaciones del botón."/>

<#assign btn_apply="Aplicar"/>
<#assign btn_addButton="Agregar botón"/>
<#assign btn_deleteButton="Eliminar botón"/>
<#assign link_returnToButtonList="Volver a la página Lista de botones"/>
<#assign btntitle_Scan="Botón de escaneado"/>
<#assign btntitle_Service="Botón Servicio del dispositivo"/>
<#assign btntitle_Folder="Botón de carpeta"/>

<#assign scanOwner_title = "Propietario del botón"/>
<#assign scanOwner_description = "Seleccione un usuario de DocuShare como propietario del botón de escaneado. Si el usuario no se ha autenticado con el sistema Scan Services, será necesaria una clave."/>
<#assign scanSettings_title = "Configuración de escaneado"/>
<#assign propLabel_ButtonLabel="Etiqueta del botón:"/>
<#assign propHelp_ButtonLabel="El nombre del botón que se muestra en la pantalla táctil del dispositivo."/>

<#assign propLabel_ScanType = "Tipo de escaneado:"/>
<#assign propHelp_ScanType = "El tipo de destino en el que se almacenarán los documentos escaneados."/>
<#assign optionLabel_ScanType_DocuShare = "Carpeta de DocuShare"/>
<#assign optionLabelHint_ScanType_DocuShare = "Envía los documentos escaneados a una carpeta de DocuShare."/>
<#assign optionLabel_ScanType_Folder = "Carpeta de red"/>
<#assign optionLabelHint_ScanType_Folder = "Envía los documentos escaneados a una carpeta de red."/>
<#assign optionLabel_ScanType_Email = "E-mail"/>
<#assign optionLabelHint_ScanType_Email = "Envía los documentos escaneados a una dirección de e-mail."/>
<#assign optionLabel_ScanType_Email_ServerNotConfiguredLabel = "(Servidor no configurado)"/>
<#assign optionLabel_ScanType_Email_ServerNotConfiguredTip = "El servidor de e-mail no se ha configurado. Vaya a la página Configuración de e-mail y asegúrese de que la configuración de conexión de e-mail es correcta."/>

<#assign propLabel_ScanToCollection="Escanear a la carpeta de DocuShare:"/>
<#assign propHelp_ScanToCollection="La carpeta de DocuShare de destino de los documentos escaneados."/>
<#assign propNote_ScanToCollection="Escriba el título de la carpeta de DocuShare para realizar una búsqueda. NOTA IMPORTANTE: Solo se devolverán las carpetas en las que el propietario tiene permisos de escritura."/>
<#assign noCollectionFoundPlaceholder="Asigne un propietario del botón más arriba antes de especificar la carpeta."/>
<#assign propLabel_ScanToPerCollEnable="Escanear a carpeta personal:"/>
<#assign propHelp_ScanToPerCollEnable="Si se activa, esta opción sobrescribe la carpeta especificada en el campo Escanear a la carpeta de DocuShare, y escanea los documentos a la carpeta personal de DocuShare del usuario que ha iniciado sesión. Los documentos escaneados de los usuarios invitados se envían a la carpeta definida en el campo Escanear a la carpeta de DocuShare."/>
<#assign folderNotFound_msg = "La carpeta no se encuentra en DocuShare."/>

<#assign propLabel_Owner="Propietario:"/>
<#assign propHelp_Owner="El propietario asignado a los documentos escaneados."/>
<#assign propNote_Owner>Realice una búsqueda mediante la introducción del nombre de usuario (por ejemplo, <code>jdoe</code>). NOTA IMPORTANTE: Solo deben usarse usuarios de nivel Coordinador.</#assign>
<#assign propLabel_OwnerPassword="Clave del propietario:"/>
<#assign ownerAuthenticated_msg = "Propietario autenticado"/>
<#assign ownerNotAuthenticated_msg = "El propietario no se autenticó. Escriba una clave y haga clic en el botón Autenticar propietario."/>
<#assign btn_AuthenticateOwner_label="Propietario autenticado"/>
<#assign ownerNotFound_msg = "El propietario no se encontró en el sistema. Intente realizar la búsqueda de nuevo."/>

<#assign propLabel_folderPath="Escanear a carpeta:"/>
<#assign propHelp_folderPath="La carpeta de red de destino de los documentos escaneados."/>
<#assign propNote_folderPath>Escriba la ruta de la carpeta de red mediante la convención de asignación de nombres de UNC. Por ejemplo, <code>\\servidor\recurso compartido</code>.</#assign>
<#assign propLabel_folderUser="Nombre de usuario de la carpeta:"/>
<#assign propHelp_folderUser="El nombre de usuario de la carpeta de red seleccionada."/>
<#assign propLabel_folderPassword="Clave de la carpeta:"/>
<#assign propHelp_folderPassword="La clave de la carpeta de red seleccionada."/>
<#assign folderTestConnBtn_label="Probar conexión"/>
<#assign folderTestConn_pleasewait = "Se está probando. Espere..."/>
<#assign folderTestConnBtn_success="Conexión correcta"/>
<#assign folderTestConnBtn_failure_authenticate="Error de inicio de sesión: nombre de usuario o clave desconocidos."/>
<#assign folderTestConnBtn_failure_unknownDomain="Error de conexión: Dominio desconocido:"/>
<#assign folderTestConnBtn_failure_badNetworkPath="Error de conexión: La carpeta de red no se pudo encontrar."/>
<#assign folderTestConnBtn_failure_others="Error de conexión: No se pudo conectar a la carpeta de red seleccionada."/>
<#assign propLabel_exportMeta = "Exportar metadatos:"/>
<#assign propNote_exportMeta = "Exporte las propiedades de metadatos seleccionadas en la tabla de campos de propiedades más abajo como un archivo XML."/>
<#assign propLabel_browseCollection = "Examinar las subcarpetas al escanear:"/>
<#assign propNote_browseCollection = "Seleccione la navegación de las subcarpetas en la página escaneado del dispositivo. (Solo para escaneados a la carpeta de DocuShare o a las carpetas de red)."/>
<#assign propLabel_defaultEmailAddress = "E-mail A: Dirección:"/>
<#assign propNote_defaultEmailAddress = "La dirección de e-mail a la que se enviará el escaneado. Si se deja en blanco, se usará la dirección de e-mail del usuario que ha iniciado sesión, si está disponible."/>
<#assign propLabel_scanConfirmation = "Mostrar la confirmación de escaneado:"/>
<#assign propNote_scanConfirmation = "Seleccione la visualización de un mensaje de confirmación en la pantalla táctil del dispositivo cuando el documento escaneado se almacena en la ubicación definida. Según el tamaño del documento y el procesamiento necesario, es posible que el mensaje de confirmación tarde más en mostrarse."/>

<#assign propLabel_DefaultFormat="Formato prefijado:"/>
<#assign propHelp_DefaultFormat="El formato de archivo prefijado del documento."/>
<#assign optionLabel_DefaultFormat_pdf="Portable Document Format (PDF)"/>
<#assign optionLabelHint_DefaultFormat_pdf="Guarda los documentos en formato PDF."/>
<#assign optionLabel_PDF_A = "Portable Document Archive Format (PDF-A)"/>
<#assign optionLabelHint_PDF_A = "Guarda los documentos en formato PDF-A, un formato de archivo que incluye las funciones PDF ideales para el almacenamiento digital a largo plazo. La opción solo se puede seleccionar si el dispositivo o el servidor de DocuShare lo admiten."/>
<#assign optionLabel_MRC_PDF = "PDF de alta compresión (MRC)" />
<#assign optionLabelHint_MRC_PDF = "Guarda los documentos en un formato PDF de contenido de gráficos de trama mixtos (MRC) para crear archivos más pequeños de calidad inferior. La opción solo se puede seleccionar si el dispositivo o el servidor de DocuShare lo admiten."/>
<#assign optionLabel_MRC_PDF_A = "PDF-A de alta compresión (MRC)"/>
<#assign optionLabelHint_MRC_PDF_A = "Guarda los documentos en un formato PDF-A de alta compresión de contenido de gráficos de trama mixtos (MRC) para crear archivos más pequeños de calidad inferior para el almacenamiento digital a largo plazo. La opción solo se puede seleccionar si el dispositivo o el servidor de DocuShare lo admiten."/>

<#assign propLabel_DefaultOCR="OCR prefijado:"/>
<#assign propHelp_DefaultOCR="La configuración de OCR (reconocimiento óptico de caracteres) prefijada."/>
<#assign optionLabel_DefaultOCR_imageonly="Solo imagen"/>
<#assign optionLabelHint_DefaultOCR_imageonly="Convierte la imagen escaneada en un documento de solo imagen."/>

<#assign optionLabel_DefaultOCR_searchable="Se pueden realizar búsquedas."/>
<#assign optionLabelHint_DefaultOCR_searchable="Convierte la imagen escaneada en un documento de texto que admite búsquedas."/>

<#assign optionLabel_DefaultOCR_searchableByServer="Permite búsqueda: convertido por DocuShare"/>
<#assign optionLabelHint_DefaultOCR_searchableByServer="Convierte la imagen escaneada en un documento de texto que admite búsquedas mediante el software de reconocimiento óptico de caracteres de DocuShare."/>
<#assign optionLabel_DefaultOCR_searchableByDevice="Permite búsquedas: convertido por el dispositivo"/>
<#assign optionLabelHint_DefaultOCR_searchableByDevice="Convierte la imagen escaneada en un documento de texto que admite búsquedas mediante el software de reconocimiento óptico de caracteres de la impresora multifunción."/>

<#assign optionLabel_SEARCHABLE_IMAGE="Se pueden realizar búsquedas."/>
<#assign optionLabel_IMAGE_ONLY="Solo imagen"/>

<#assign propLabel_DefaultResolution="Resolución prefijada:"/>
<#assign propHelp_DefaultResolution="La resolución prefijada de escaneado."/>
<#assign optionLabel_DefaultResolution_300x300="Alta calidad (300 x 300 ppp)"/>
<#assign optionLabelHint_DefaultResolution_300x300="Escaneado de alta resolución"/>
<#assign optionLabel_DefaultResolution_200x200="Calidad media (200 x 200 ppp)"/>
<#assign optionLabelHint_DefaultResolution_200x200="Escaneado de resolución media"/>

<#assign propLabel_scanColor = "Color del escaneado prefijado:"/>
<#assign propHelp_scanColor = "La configuración de color de escaneado del documento."/>
<#assign scanColorOption_AUTO ="Automática"/>
<#assign scanColorOption_FULL_COLOR ="A todo color"/>
<#assign scanColorOption_GRAYSCALE ="Escala de grises"/>
<#assign scanColorOption_BLACK_AND_WHITE ="Blanco y negro"/>

<#assign propLabel_ScanOrientation="Orientación de escaneado:"/>
<#assign propHelp_ScanOrientation="La orientación de escaneado del documento."/>
<#assign scanOrientationOption_Portrait="Vertical"/>
<#assign scanOrientationOption_Landscape="Horizontal"/>
<#assign scanSizeOption_Auto="Automática"/>
<#assign scanSizeOption_Mixed="Mixto"/>

<#assign propLabel_ExportScanSettings="Exportar configuración de escaneado:"/>
<#assign propHelp_ExportScanSettings="Seleccione para activar a los usuarios del equipo multifunción para cambiar la configuración de OCR, el formato de archivo, la resolución y el color de escaneado antes del escaneado."/>

<#assign propLabel_MfpScanPage="Escanear página"/>
<#assign optionLabel_OneSided="A 1 cara"/>
<#assign optionLabel_TwoSided="A 2 caras"/>
<#assign optionLabel_SecondSideRotation="A 2 caras, girar cara 2"/>

<#assign label_MfpScanSettings="Configuración de escaneado..."/>
<#assign propLabel_MfpAdv_OCR="OCR de escaneado"/>
<#assign propLabel_MfpAdv_Format="Formato de escaneado"/>
<#assign propLabel_MfpAdv_Resolution="Resolución de escaneado"/>
<#assign propLabel_MfpAdv_Color="Color de escaneado"/>
<#assign propLabel_MfpAdv_Orientation="Orientación de escaneado"/>
<#assign propLabel_MfpAdv_Size="Tamaño de papel de escaneado"/>

<#assign networkfilenamesettings_title = "Configuración de nombre del archivo"/>
<#assign networkfilenamesettings_desc = "Proporcione un nombre de archivo para documentos escaneados y, de manera opcional, anexe información adicional."/>
<#assign propLabel_networkfilename = "Nombre de archivo"/>
<#assign propLabel_emailfilename = "Tema del e-mail"/>
<#assign propLabelHint_networkfilename = "El nombre de archivo base de documentos escaneados."/>

<#assign fieldsettings_title = "Configuración de propiedades del documento (Metadatos)"/>
<#assign fieldsettings_desc = "Seleccione el tipo de documento en el que se guardarán los documentos escaneados y seleccione los campos de propiedad que los usuarios pueden visualizar y editar al escanear. Los usuarios no pueden editar valores de propiedad generados automáticamente."/>

<#assign fieldsettings_desc = "Seleccione el tipo de documento y seleccione los campos de propiedad que los usuarios pueden visualizar y editar al escanear. Los usuarios no pueden editar valores de propiedad generados automáticamente."/>

<#assign fieldsettings_desc_networkfolder = "Seleccione el tipo de documento y seleccione los campos de propiedad que los usuarios pueden visualizar y editar al escanear. Los usuarios no pueden editar valores de propiedad generados automáticamente. Para escaneados a carpetas de red, el valor del campo Título se usará como nombre de archivo del documento.  Los otros campos se exportarán en el archivo XML complementario si la opción Exportar metadatos se activa."/>

<#assign fieldsettings_desc_email = "Seleccione el tipo de documento y seleccione los campos de propiedad que los usuarios pueden visualizar y editar al escanear. Los usuarios no pueden editar valores de propiedad generados automáticamente. Para escaneados a e-mail, el valor del campo Título se usará como nombre de archivo de los datos adjuntos del e-mail. Los otros campos se exportarán en el archivo XML adjunto si la opción Exportar metadatos se activa."/>


<#assign propLabel_doctype = "Tipo de documento:"/>
<#assign propLabelHint_doctype = "El tipo de documento en el que se guardarán los documentos escaneados."/>
<#assign doctype_change_confirm = "¿Seguro que desea pasar a otro tipo de documento? Se suprimirá la configuración del campo actual."/>
<#assign propLabel_autoFillProfile = "Perfil de relleno automático:"/>
<#assign propLabelHint_autoFillProfile = "Seleccione un perfil para este tipo de documento para especificar los campos que, al rellenarse al realizar el escaneado, harán que otros campos de propiedades se rellenen automáticamente con los valores correspondientes de un determinado origen de datos."/>
<#assign optionLabel_autoFillProfile_noProfile ="Sin perfil"/>
<#assign afp_missingfields_error = "Los siguientes campos de perfiles de relleno automático deben agregarse a la tabla de campos de metadatos:"/>
<#assign dms_missingfields_error = "Los siguientes campos de conjuntos de menús dependientes deben agregarse a la tabla de campos de metadatos:"/>
<#assign afp_mappedfield_defaultval_hint = "El valor de este campo está controlado por el perfil de relleno automático y no se puede editar manualmente. Se rellena de forma dinámica después de que se rellenen los campos de relleno automático."/>

<#assign propLabel_propName="Campo"/>
<#assign propLabelHint_propName="El campo de la propiedad que se muestra a los usuarios al escanear. Los campos que requieren un valor se indican con el texto Obligatorio y no se pueden quitar."/>
<#assign propLabel_defaultValue="Valor prefijado"/>
<#assign propLabelHint_defaultValue="El valor prefijado del campo de la propiedad."/>

<#assign propLabel_displayOptions="Opciones de visualización"/>
<#assign propLabelHint_displayOptions="Cómo mostrar el campo de la propiedad a los usuarios al escanear."/>
<#assign optionLabel_displayOptions_readonly="Solo lectura"/>
<#assign optionLabelHint_displayOptions_readonly="El campo se puede visualizar al realizar el escaneado, pero no se puede editar."/>
<#assign optionLabel_displayOptions_editable="Se puede editar al realizar el escaneado"/>
<#assign optionLabelHint_displayOptions_editable="El campo se puede editar al realizar el escaneado."/>
<#assign optionLabel_displayOptions_editablerequired="Editable y obligatorio al escanear"/>
<#assign optionLabelHint_displayOptions_editablerequired="El campo se puede editar y es obligatorio al realizar el escaneado."/>
<#assign optionLabel_displayOptions_hidden="Oculto"/>
<#assign optionLabelHint_displayOptions_hidden="El campo no se puede editar o visualizar al realizar el escaneado."/>

<#assign propLabel_AppendInfo="Anexar información"/>
<#assign propLabelHint_AppendInfo_networkfile="Permite anexar información adicional al nombre del archivo."/>
<#assign optionLabelHint_AppendInfo_networkfile_none="No anexa información adicional al nombre del archivo."/>

<#assign propLabelHint_AppendInfo="Permite anexar información adicional al valor prefijado."/>
<#assign optionLabel_AppendInfo_none="Sin información anexada"/>
<#assign optionLabelHint_AppendInfo_none="No anexa información adicional al valor prefijado."/>
<#assign optionLabel_AppendInfo_none_folder="Identificador único"/>
<#assign optionLabelHint_AppendInfo_none_folder="Agrega una cadena de identificación única al valor predefinido. (Solo escaneados de carpeta de red)"/>
<#assign optionLabel_AppendInfo_timestamp="Marca de hora"/>
<#assign optionLabelHint_AppendInfo_timestamp>Agrega la fecha y la hora al valor prefijado. Por ejemplo: <code>ScanDoc-10.22.13</code></#assign>
<#assign optionLabel_AppendInfo_number="Número incremental"/>
<#assign optionLabelHint_AppendInfo_number>Agrega al valor prefijado un número que aumenta automáticamente. Por ejemplo: <code>ScanDoc-00312</code></#assign>
<#assign optionLabel_AppendInfo_CurrentYear="Año actual"/>
<#assign optionLabelHint_AppendInfo_CurrentYear="Agrega el año actual al valor prefijado."/>
<#assign optionLabel_AppendInfo_CurrentMonth="Mes actual"/>
<#assign optionLabelHint_AppendInfo_CurrentMonth="Agrega el mes actual al valor prefijado."/>
<#assign optionLabel_AppendInfo_CurrentDayOfMonth="Día del mes"/>
<#assign optionLabelHint_AppendInfo_CurrentDayOfMonth="Agrega el día actual del mes (por ejemplo, el 20) al valor prefijado."/>
<#assign optionLabel_AppendInfo_CurrentDayOfWeek="Día de la semana"/>
<#assign optionLabelHint_AppendInfo_CurrentDayOfWeek="Agrega el día actual de la semana (por ejemplo, el lunes) al valor prefijado."/>
<#assign optionLabel_AppendInfo_Username="Nombre de usuario"/>
<#assign optionLabelHint_AppendInfo_Username="Agrega el nombre de usuario al valor prefijado."/>
<#assign optionLabel_AppendInfo_Firstname="Nombre"/>
<#assign optionLabelHint_AppendInfo_Firstname="Agrega el nombre del usuario conectado al valor prefijado."/>
<#assign optionLabel_AppendInfo_Lastname="Apellido"/>
<#assign optionLabelHint_AppendInfo_Lastname="Agrega el apellido del usuario conectado al valor prefijado."/>
<#assign optionLabel_AppendInfo_Fullname="Nombre completo"/>
<#assign optionLabelHint_AppendInfo_Fullname="Agrega el nombre completo del usuario conectado al valor prefijado."/>

<#assign propLabel_appendLoc="Ubicación anexada"/>
<#assign propLabelHint_appendLoc="Especifica la ubicación de la información anexada."/>
<#assign optionLabel_appendLoc_after="Después del valor prefijado"/>
<#assign optionLabelHint_appendLoc_after="Agrega la información anexada después del valor prefijado."/>
<#assign optionLabel_appendLoc_before="Antes del valor prefijado"/>
<#assign optionLabelHint_appendLoc_before="Agrega la información anexada antes del valor prefijado."/>

<#assign optionLabel_appendLoc_networkfolder_after="Después del nombre de archivo"/>
<#assign optionLabelHint_appendLoc_networkfolder_after="Agrega la información anexada después del nombre de archivo."/>
<#assign optionLabel_appendLoc_networkfolder_before="Antes del nombre de archivo"/>
<#assign optionLabelHint_appendLoc_networkfolder_before="Agrega la información anexada antes del nombre de archivo."/>
<#assign menuAgentLabel = "Usar el menú ODBC:"/>
<#assign menuAgentTip = "Seleccione un menú predefinido cuyos valores se recuperan de un origen de datos ODBC."/>
<#assign menuAgent_none = "Sin asignaciones"/>
<#assign odbcMenu_optgrouplabel_simplemenu = "Menús ODBC"/>
<#assign odbcMenu_optgrouplabel_dmsets = "Conjuntos de menús dependientes"/>
<#assign autofillProfile_isMappedField = "Esta propiedad es utilizada por el perfil de relleno automático seleccionado y se rellena automáticamente cuando se rellenan uno o varios campos necesarios para el relleno automático."/>
<#assign autofillProfile_isMappedFieldRequired = "Esta propiedad es utilizada por el perfil de relleno automático seleccionado y es obligatoria para el relleno automático de campos asignados."/>
<#assign menuAgent_optionsRequestError = "Error: Se ha producido un error al intentar recuperar la lista de opciones del origen de datos."/>

<#assign fieldlist_requiredtag="(obligatorio)"/>
<#assign btn_addfield="Agregar campo"/>
<#assign btn_removefield="Quitar"/>

<#assign propLabel_accessMethod ="Nivel de acceso:"/>
<#assign propLabelHint_accessMethod ="El nivel de acceso al botón: Grupo de DocuShare específico o invitado."/>
<#assign optionLabel_accessMethod_guest = "Invitado"/>
<#assign optionLabelHint_accessMethod_guest = "Permite que cualquier usuario utilice el botón."/>
<#assign optionLabel_accessMethod_group = "Grupo de DocuShare"/>
<#assign optionLabelHint_accessMethod_group>Limita el acceso del botón a los usuarios que pertenecen a un determinado grupo de DocuShare (por ejemplo, <code>Grupo-123</code>).</#assign>

<#assign optionLabel_inherit = "Heredado del botón primario:"/>
<#assign optionLabelHint_inherit = "Utiliza la opción de acceso al grupo del botón primario."/>

<#assign optionLabel_specificgroup = "Seleccionar grupo:"/>
<#assign optionLabelHint_specificgroup = "Escriba el título de un grupo de DocuShare para seleccionarlo (por ejemplo, marketing)."/>
<#assign fieldnote_usergroup = "Escriba el título de un grupo (por ejemplo, marketing) para realizar una búsqueda."/>

<#assign subFolderSection_title = "Configuración de subcarpeta"/>
<#assign subFolderSection_subtitle = "Especifique cómo generar carpetas automáticamente. Seleccione las propiedades de los menús más abajo para usarlas como título de cada subcarpeta. El título de cada subcarpeta se deriva de los valores de la propiedad especificada al escanear."/>

<#assign subFolderCollectionLabel_none = "Seleccionar una carpeta raíz..."/>
<#assign subFolderOptgroup_label_reqfield = "Propiedades necesarias"/>
<#assign subFolderOptgroup_label_optionalfield = "Propiedades opcionales"/>
<#assign subFolderOptgroup_label_userdata = "Propiedades del usuario de escaneado"/>
<#assign subFolderOptgroup_label_datadata = "Propiedades de la fecha"/>
<#assign subFolderSelectOption_label_none = "No"/>

<#assign subFolderSelectOption_label_day = "Día actual"/>
<#assign subFolderSelectOption_label_week = "Día de la semana actual"/>
<#assign subFolderSelectOption_label_month = "Mes actual"/>
<#assign subFolderSelectOption_label_year = "Año actual"/>

<#assign subFolderSelectOption_label_username = "Nombre de usuario"/>
<#assign subFolderSelectOption_label_lname = "Apellido"/>
<#assign subFolderSelectOption_label_fname = "Nombre"/>
<#assign subFolderSelectOption_label_fullname = "Nombre completo"/>
<#assign propRequiredbySubFolder ="(Necesario para la configuración de la subcarpeta)"/>

<#assign propRequiredbyAFP = "(Necesario para el relleno automático)"/>

<#assign svcbtnicon_label = "Icono del botón:"/>
<#assign svcbtnicon_hint = "El icono mostrado en el botón. Use el icono prefijado o seleccione otro icono."/>
<#assign btn_editicon_label = "Editar icono..."/>
<#assign btn_customizeicon_label = "Personalizar..."/>
<#assign customizeicon_dialog_title = "Personalizar icono del botón"/>
<#assign customizeicon_newval_uploadicon = "Carga de un nuevo icono:"/>
<#assign customizeicon_newval_default = "Uso del icono prefijado:"/>
<#assign customizeicon_newval_useexisting = "Uso de un icono existente:"/>

<#assign editsvcbtndialog_title = "Editar icono del botón"/>
<#assign editsvcbtndialog_subtitle = "Use el icono prefijado, cargue un archivo de imagen o seleccione un icono existente en el servidor."/>
<#assign icon_upload_label = "Cargar un nuevo icono:"/>
<#assign icon_upload_visiblehint>Seleccione cualquier formato de archivo de imagen que se pueda visualizar en la web. <code>.gif</code>,<code>.png</code>, o<code>.jpg</code>. El tamaño máximo es 128 x 128 píxeles.</#assign>
<#assign icon_filetypein_label = "Seleccionar un icono existente:"/>
<#assign icon_resetdefault_label = "Usar el icono prefijado:"/>
<#assign icon_resetdefault_hint = "Use el icono prefijado de botón."/>
<#assign icon_update_success = "El icono de botón se actualizó correctamente."/>
<#assign icon_update_failure = "Error: El icono de botón no se pudo actualizar."/>
<#assign editsvcbtndialog_subtitle_noexistingicons = "No se encontraron iconos en el servidor."/>


<#-- Configure Devices Page -->
<#assign btn_cancelLabel = "Cancelar"/>
<#assign btn_closeTip = "Cerrar"/>

<#assign action_viewDeviceLabel="Editar configuración del dispositivo&#8230;"/>
<#assign action_viewDeviceTip="Editar configuración del dispositivo"/>

<#assign action_reassignButtonsFailureMsg="Error: No se reasignaron los botones de algunos dispositivos."/>
<#assign action_reassignButtonsSuccessMsg="Las asignaciones de botones de los dispositivos seleccionados se actualizaron correctamente."/>
<#assign action_deleteSingleDeviceLabel="Quitar el dispositivo de la lista"/>
<#assign action_deleteSingleDeviceTip="Quitar dispositivo"/>
<#assign action_deleteSingleDeviceConfirmMsg="¿Está seguro de que desea eliminar este dispositivo? No se puede deshacer."/>
<#assign action_deleteSingleDeviceSuccessMsg="El dispositivo se eliminó correctamente."/>
<#assign action_deleteSingleDeviceFailureMsg="Error: El dispositivo no se pudo eliminar."/>

<#assign action_deleteMultiDeviceConfirmMsg="¿Está seguro de que desea eliminar los dispositivos seleccionados? No se puede deshacer."/>
<#assign action_deleteMultiDeviceSuccessMsg="Los dispositivos seleccionados se eliminaron correctamente."/>
<#assign action_deleteMultiDeviceFailureMsg="Error: Error: los dispositivos seleccionados no se pudieron eliminar."/>

<#assign configDevices_title = "Configurar dispositivos"/>
<#assign configDevices_subtitle = "Use esta página para configurar las impresoras multifunción que desea usar con Scan Service de DocuShare y para administrar los botones asignados a los dispositivos."/>
<#assign btn_reassignBtnsLabel = "Asignar/Anular la asignación de botones a dispositivos seleccionados&#8230;"/>
<#assign btn_reassignBtnsTip = "Asigne o anule la asignación de botones a dispositivos seleccionados."/>
<#assign btn_deleteSelDevices = "Eliminar seleccionados&#8230;"/>
<#assign btn_registerDevice = "Agregar nuevo dispositivo&#8230;"/>
<#assign btn_importDevices = "Importar dispositivos de archivo CSV&#8230;"/>
<#assign devicetable_cbx_selectAll_tip = "Seleccione/anule la selección de todos los dispositivos."/>
<#assign devicetable_colLabel_name = "Nombre de dispositivo"/>
<#assign devicetable_colLabel_address = "Host/Dirección IP"/>
<#assign devicetable_colLabel_buttons = "Botones de Scan Service"/>
<#assign devicetable_colLabel_actions = "Acciones"/>
<#assign devicetable_deviceLabel_tip = "Editar configuración del dispositivo"/>
<#assign devicetable_nobuttonsassigned = "Sin botones asignados."/>
<#assign devicetable_emptytablemsg = "Todavía no hay ninguna impresora multifunción registrada."/>
<#assign devicetable_emptytablemsg_registerlinklabel = "Haga clic aquí para agregar un nuevo dispositivo."/>
<#assign devicetable_deviceBehindFirewallTip = "El dispositivo está detrás de un firewall"/>
<#assign devicetable_deviceBehindFirewallColHeadingTip = "¿El dispositivo está detrás de un firewall?"/>

<#assign btn_updateAssignmentsLabel = "Actualizar asignaciones"/>
<#assign editSelectedBtns_dialogtitle = "Editar los botones de Scan Service en los dispositivos seleccionados"/>
<#assign editSelectedBtns_dialogsubtitle = "Asigne o anule la asignación de botones de Scan Service a los dispositivos seleccionados. De esta manera se sobrescribe la lista de los botones asignados actualmente para cada dispositivo. Si se cancela la selección de un determinado botón, se eliminará de los dispositivos seleccionados."/>
<#assign link_configurebuttons_label="Página Configuración de botones" />
<#macro nobuttonsinsystemmsg link>No se ha agregado ningún botón.  Vaya a ${link} para agregar botones.</#macro>

<#assign btn_importCSVLabel = "Importar"/>
<#assign importDialog_title="Importar dispositivos de un archivo CSV"/>
<#assign importDialog_subtitle="Navegue y seleccione un archivo CSV que contenga la lista de impresoras multifunción que desea agregar a Scan Service de DocuShare."/>
<#assign importCSV_error="Se ha producido un error al importar el archivo CSV."/>

<#assign failedBtnReassignDialogTitle = "No se pudieron realizar las reasignaciones de botones"/>
<#assign failedBtnReassignDialogSubtitle = "Se ha producido un error al intentar actualizar las asignaciones de botones en los dispositivos siguientes:"/>
<#assign failedBtnReassignDialog_idcolLabel = "ID"/>


<#-- Edit / Add Device Page -->
<#assign editDevicePage_title="Editar configuración del dispositivo:"/>
<#assign editDevicePage_subtitle1="Cambie la información del dispositivo."/>
<#assign editDevicePage_subtitle2="Cambie los botones de Scan Service de DocuShare asignados al dispositivo."/>

<#assign addDevicePage_title="Agregar un nuevo dispositivo"/>
<#assign addDevicePage_subtitle1="Escriba la información del dispositivo."/>
<#assign addDevicePage_subtitle2="Asigne los botones de Scan Service al dispositivo."/>

<#assign addDevice_successMsg="Se ha registrado un nuevo dispositivo."/>
<#assign addDevice_errorMsg="Error: No se pudo registrar el dispositivo."/>
<#assign editDevice_successMsg="Configuración del dispositivo actualizada"/>
<#assign editDevice_errorMsg="Error: No se pudieron guardar las actualizaciones del dispositivo."/>

<#assign deviceLabel_label="Etiqueta de dispositivo:"/>
<#assign deviceLabel_tip="El nombre descriptivo de la impresora multifunción de Xerox."/>

<#assign deviceAddress_label="Nombre de host/IP del dispositivo:"/>
<#assign deviceAddress_tip="La dirección de red (dirección IP o nombre de host DNS) de la impresora multifunción de Xerox."/>

<#assign deviceUsername_label="Nombre de usuario del dispositivo:"/>
<#assign deviceUsername_tip="El nombre de usuario del administrador de la impresora multifunción de Xerox."/>

<#assign devicePassword_label="Clave del dispositivo:"/>
<#assign devicePassword_tip="La clave del administrador de la impresora multifunción de Xerox."/>

<#assign deviceBehindFirewall_label="¿El dispositivo está detrás de un firewall?"/>
<#assign deviceBehindFirewall_tip="Active la casilla si el dispositivo está detrás de un firewall empresarial y Scan Service y los servidores de DocuShare están fuera del mismo."/>

<#assign serviceBtnSectionTitle="Botones de Scan Service"/>

<#assign advancedBtn="Mostrar configuración avanzada &#8250;"/>
<#assign advancedBtn_hide="&#8249; Ocultar configuración avanzada"/>
<#assign server_ip_label="Nombre de host/IP del servidor de Scan Service alternativo:"/>
<#assign server_ip_tip="Si la impresora multifunción no se puede conectar al nombre de host o la dirección IP prefijados del servidor de Scan Service (posiblemente porque se conectó a través de un túnel de VPN con una dirección NAT), escriba un nombre de host o una dirección IP alternativos."/>
<#assign server_defaultNameLabel="Nombre de host/IP del servidor de Scan Service prefijado:"/>
<#assign defaultServerTxt="(Prefijado)"/>

<#assign editDevicePage_btn_applyLabel="Aplicar"/>
<#assign editDevicePage_btn_addLabel="Agregar"/>
<#assign editDevicePage_btn_deleteButtonLabel="Eliminar dispositivo"/>
<#assign editDevicePage_link_returnToDeviceListLabel="&#8592; Volver a la página Lista de dispositivos"/>


<#--Scanning Log Page -->
<#assign scanningLog_title ="Registro de escaneado"/>
<#assign scanningLog_subtitle ="Use esta página para ver la actividad de escaneado más reciente y descargar el registro de todos los trabajos de escaneado."/>
<#assign scanningLog_retrieveErrorMsg="Error: No se pudo recuperar el registro de escaneado."/>
<#assign btn_downloadLogLabel = "Descargar el registro de escaneado como archivo CSV&#8230;"/>

<#assign logTable_colLabel_date="Fecha de escaneado"/>
<#assign logTable_colLabel_destination="Destino de escaneado"/>
<#assign logTable_colLabel_device="Dispositivo de escaneado"/>
<#assign logTable_colLabel_button="Botón"/>
<#assign logTable_colLabel_username="Nombre de usuario"/>
<#assign logTable_colLabel_status="Estado"/>

<#assign logLoadingMsg="Cargando registro de escaneado&#8230;"/>
<#assign logEmptyMsg="El registro de escaneado está vacío."/>
<#assign logpagesize_label = "Tamaño de página:"/>
<#assign logpagesize_help = "Número máximo de trabajos de escaneado que se mostrarán en la página."/>
<#assign logfilesize_label = "Tamaño del registro:"/>
<#assign logfilesize_help = "El número máximo de trabajos de escaneado que se almacenarán en un solo archivo de registro. Cambie esta opción al configurar por primera vez Scan Service de DocuShare."/>
<#assign btn_updateLogfilesize_label = "Actualizar"/>
<#assign updateLogFileSize_error = "Se ha producido un error al actualizar el tamaño del archivo de registro de escaneado."/>
<#assign updateLogFileSize_success = "El tamaño del archivo de registro de escaneado se actualizó correctamente."/>
<#assign status_succeeded = "Correcto"/>
<#assign status_failed = "Falló"/>

<#-- Server Log Page -->
<#assign serverLogPage_title = "Registro del servidor"/>
<#assign serverLogPage_subtitle = "Use esta página para cambiar el nivel de registro del servidor y descargar el registro del servidor."/>
<#assign loglevel_label="Nivel de registro"/>
<#assign logLevel_tip="El tipo de información de registro que desea que el servidor registre. Los niveles de registro se enumeran en orden descendente de gravedad con la información registrada solo para niveles iguales o mayores de gravedad que el nivel de registro seleccionado. Por ejemplo, el nivel TRACE registra información para todos los niveles, mientras que WARN solo registra información de nivel WARN, ERROR y FATAL."/>
<#assign btn_logDownloadLabel="Descargar archivo de registro&#8230;"/>

<#-- Email Service Page -->
<#assign EmailServicePage_title = "Configuración de e-mail"/>
<#assign EmailServicePage_subtitle = "Use esta página para configurar un servidor de e-mail y para poder agregar los botones de escaneado a e-mail."/>
<#assign EmailSetup_serverSectionLabel = "Configuración del servidor de e-mail de salida"/>
<#assign EmailSetup_servernameLabel = "Dirección/Nombre del servidor:"/>
<#assign EmailSetup_servernameTip = "El nombre del dominio o la dirección IP del servidor de e-mail."/>
<#assign EmailSetup_protocolLabel = "Protocolo:"/>
<#assign EmailSetup_protocolTip = "El protocolo del servidor de correo electrónico de salida. Los valores son SMTP (prefijado), SMTP-TLS, SMTP-SSL."/>
<#assign EmailSetup_portLabel = "Puerto:"/>
<#assign EmailSetup_portTip = "El número del puerto del servidor de correo electrónico de salida. El valor prefijado de cada protocolo es SMTP:25, SMTP-TLS:250, SMTP-SSL:2500."/>
<#assign EmailSetup_emailUsernameLabel = "Nombre de usuario:"/>
<#assign EmailSetup_emailUsernameTip = "El nombre de usuario de la cuenta autorizada a enviar e-mail a través del servidor de e-mail de salida."/>
<#assign EmailSetup_passwordLabel = "Clave:"/>
<#assign EmailSetup_passwordTip = "La clave de la cuenta de usuario especificada."/>
<#assign EmailSetup_messageSectionLabel = "Configuración de la función de escaneado a e-mail"/>
<#assign EmailSetup_defaultFromAddressLabel = "Campo De prefijado: Dirección:"/>
<#assign EmailSetup_defaultFromAddressTip = "La dirección de e-mail que se muestra en el campo De de todos los correos electrónicos enviados por Scan Service de DocuShare."/>
<#assign EmailSetup_defaultFromAddressExample = "Por ejemplo: scan-services-scan@mycompany.com"/>
<#assign EmailSetup_subjectLabel = "Tema predefinido del e-mail:"/>
<#assign EmailSetup_subjectTip = "El tema predefinido de todos los correos electrónicos enviados por Scan Service de DocuShare si ningún botón especifica un tema."/>
<#assign EmailSetup_subjectExample = "Por ejemplo: Nuevo documento escaneado mediante Scan Service de DocuShare"/>
<#assign EmailSetup_bodyLabel = "Cuerpo del e-mail:"/>
<#assign EmailSetup_bodyTip = "El cuerpo del e-mail de todos los e-mails enviados por Scan Service de DocuShare."/>
<#assign EmailSetup_bodyExample = "Por ejemplo: Se le ha enviado un nuevo documento escaneado mediante Scan Service de DocuShare"/>
<#assign EmailSetup_isHTML_label = "Usar HTML para el cuerpo del e-mail:"/>
<#assign EmailSetup_isHTML_tip = "Seleccione esta opción para usar etiquetas HTML en el cuerpo del e-mail."/>
<#assign EmailSetup_advancedSectionLabel = "Opciones avanzadas"/>
<#assign EmailSetup_timeoutLabel = "Tiempo de espera:"/>
<#assign EmailSetup_timeoutTip = "Intervalo de tiempo en milisegundos para dejar de intentar enviar un e-mail o de conectarse al servidor. El intervalo predefinido es de 30000 ms."/>
<#assign EmailSetup_sslcertkeystoreLabel = "Archivo de Keystore de certificado de SSL:"/>
<#assign EmailSetup_sslcertkeystoreTip = "La ubicación del archivo de clave de SSL en el sistema de archivos del servidor. Es obligatorio si el protocolo del servidor de e-mail se ha configurado como SMTP-SSL o SMTP-TLS. Es posible que no sea obligatorio para algunas cuentas de servidor como Google o Yahoo, que tienen dominios que son de confianza y se han registrado en la tienda de confianza de Java."/>
<#assign EmailSetup_sslcertkeystorePassLabel = "Clave del archivo de Keystore de certificado de SSL:"/>
<#assign EmailSetup_sslcertkeystorePassTip = "Clave del archivo de Keystore."/>
<#assign EmailServicePage_formsubmit_success = "La configuración de e-mail se ha guardado correctamente."/>
<#assign EmailServicePage_formsubmit_error = "Se ha producido un error al intentar guardar la configuración de e-mail."/>

<#assign EmailServicePage_SendTestEmail_btnLabel = "Enviar e-mail de prueba..."/>
<#assign EmailSetup_testConnectionWait = "Se está enviando el e-mail. Espere..."/>
<#assign EmailSetup_testConnectionFailure = "Error: Error de conexión con el servidor de e-mail. Compruebe su configuración y vuelva a intentarlo."/>
<#assign EmailSetup_testConnectionSuccess = "El servidor envió correctamente el e-mail. Compruebe la bandeja de entrada de su e-mail de prueba para ver si el mensaje llegó correctamente. En caso afirmativo, asegúrese de hacer clic en Aplicar si ha realizado cambios en la configuración."/>
<#assign EmailSetup_testConnection_dialog_title ="Enviar un e-mail de prueba"/>
<#assign EmailSetup_testConnection_dialog_subtitle ="Pruebe la configuración mediante el envío de un e-mail."/>
<#assign EmailSetup_testConnection_emaillabel ="E-mail de prueba:"/>
<#assign EmailSetup_testConnection_emailtip ="La dirección de e-mail de destino que desea usar para probar la configuración."/>

<#-- Server Setup Page -->
<#assign ServerSetupPage_title = "Configuración del servidor"/>
<#assign ServerSetupPage_subtitle = "Utilice esta página para configurar el servidor que se va a utilizar con el servicio de escaneado de DocuShare."/>
<#assign ServerSetupPage_subtitle2 = "Si desea cambiar la configuración del servidor después de registrar los dispositivos, se recomienda quitar los botones asignados a los dispositivos antes de realizar los cambios."/>
<#assign ServerSetupPage_subtitle3 = "Puede cambiar la clave del firewall en cualquier momento sin volver a registrar dispositivos."/>
<#assign ServerSetup_nameLabel = "Dirección/Nombre del servidor:"/>
<#assign ServerSetup_nameTip = "El nombre del dominio o la dirección IP del servidor."/>
<#assign ServerSetup_protocolLabel = "Protocolo:"/>
<#assign ServerSetup_prototolTip = "El protocolo de transferencia (por ejemplo, http, https)."/>
<#assign ServerSetup_portLabel = "Puerto:"/>
<#assign ServerSetup_portTip = "El puerto del servidor (por ejemplo, 8000)."/>
<#assign ServerSetup_passwordLabel = "La clave de la utilidad de actualización de dispositivos:"/>
<#assign ServerSetup_passwordTip = "La clave para acceder a la utilidad de actualización que se usa para reconfigurar dispositivos. Proporcione la clave a la persona autorizada a realizar la administración de las impresoras multifunción para que los dispositivos puedan usarse con el firewall."/>
<#assign ServerSetup_domainLabel = "Dominio de DocuShare:"/>
<#assign ServerSetup_domainTip = "El dominio del grupo o usuario en DocuShare."/>
<#assign ServerSetup_firewallPasscodeSubtitle = "Para que los dispositivos que están detrás de un firewall puedan conectarse a un servidor del servicio de escaneado de DocuShare, los dispositivos deben configurarse mediante la Utilidad de actualización de dispositivos. Proporcione a la persona que está detrás del firewall y que tiene autorización para administrar los dispositivos la clave y la dirección URL de descarga de la Utilidad de actualización de dispositivos. Se necesita la clave para acceder a la Utilidad de actualización. Si cambia la configuración del servidor o registra o anula el registro de un dispositivo detrás de un firewall, deberá proporcionar la clave de la Utilidad de actualización de dispositivos y la dirección URL de descarga de nuevo para poder volver a ejecutar la utilidad. <p>Antes de proporcionar la utilidad, asegúrese de haber registrado como mínimo un dispositivo detrás del firewall, y de haberle asignado un botón. De lo contrario, la persona autorizada para administrar los dispositivos no podrá acceder a la utilidad.</p>"/>
<#assign ServerSetup_registerDeviceBehindFirewallURLLabel = "Dirección URL de descarga de la Utilidad de actualización de dispositivos:"/>
<#assign ServerSetup_registerDeviceBehindFirewallURLTip = "La ubicación de la página web mediante la que la persona autorizada a administrar las impresoras multifunción puede descargar un archivo autoejecutable para configurar dispositivos."/>
<#assign ServerSetup_registerDeviceBehindFirewallURLEndNote = "Seleccione la dirección URL para copiarla, pulse Ctrl-C (Cmd-C en sistemas Mac) y, a continuación, inclúyala en un e-mail."/>
<#macro devicesRegisteredEditWarning deviceNum> <strong>Nota:</strong> ${deviceNum} Algún dispositivo ya se ha registrado mediante esta configuración. Si cambia la configuración, los dispositivos no se podrán conectar al servidor del servicio de escaneado de DocuShare. En primer lugar, anule la asignación de los botones de cada dispositivo y, a continuación, vuelva a esta página para cambiar la configuración del servidor.</#macro>
<#assign editServerSettingsWhileRegisteredBtnLabel = "Editar de todas formas"/>
<#assign ServerSetup_ServerSettingsSectionLabel = "Configuración del servidor"/>
<#assign ServerSetup_FirewallPasscodeSectionLabel = "Configuración del firewall"/>
<#assign ServerSetup_formsubmit_success = "La configuración del servidor se ha guardado correctamente."/>
<#assign ServerSetup_formsubmit_error = "Se ha producido un error al intentar guardar la configuración del servidor."/>

<#assign ServerSetup_buttonSettings = "Configuración de botones de escaneado"/>
<#assign ServerSetup_dateFormatLabel = "Formato de fecha"/>
<#assign ServerSetup_dateFormatHelp = "El formato de fecha se utiliza cuando algún botón de escaneado incluye un campo de propiedades de fecha. La configuración de formato de fecha no se utiliza para las propiedades de cadena."/>
<#assign ServerSetup_dateFormatMonthFirst = "mm/dd/aaaa"/>
<#assign ServerSetup_dateFormatDayFirst = "dd/mm/aaaa"/>
<#assign ServerSetup_dateFormatYearFirst = "aaaa-mm-dd"/>
<#assign ServerSetup_dateFormatYearFirst2 = "aaaammdd"/>

<#assign ServerSetup_xeroxAppGallery = "Xerox&#174; App Gallery"/>
<#assign ServerSetup_xeroxAppGallerySubtitle = "Xerox&#174; App Gallery ofrece aplicaciones del servicio de escaneado de DocuShare para ampliar las funciones de los equipos multifunción compatibles con Scan Service de DocuShare. La aplicación de escaneado de Xerox&#174; para DocuShare permite a los usuarios de DocuShare escanear y enviar documentos a sus carpetas personales. <p>Al habilitar el uso de la aplicación se agrega un botón de Scan Service de DocuShare denominado aplicación Escanear a DocuShare y un botón de escaneado Carpeta personal a la página Lista de botones. Al desactivar la aplicación se eliminan los botones de la página. Si la aplicación se utiliza en un equipo multifunción que no se ha configurado, se utilizará una de las conexiones de su equipo multifunción con licencia.</p>"/>
<#assign ServerSetup_xeroxAppGalleryEnable = "Activar la aplicación de escaneado para DocuShare"/>
<#assign ServerSetup_xeroxAppGalleryEnableHelp = "Seleccione esta opción para permitir el uso de la aplicación Scan Service de DocuShare, que permite a los usuarios DocuShare escanear documentos a sus carpetas personales."/>

<#-- Common dbAgent Page Messages. -->
<#assign dsConnectionProgress="Se está estableciendo la conexión. Espere"/>
<#assign dsProperty_noMapping = "Ninguno"/>
<#assign dsWizard_next = "Siguiente &#8250;"/>
<#assign dsWizard_back = "&#8249; Anterior"/>
<#assign dbsmPage_delete_btn_label = "Suprimir menú"/>
<#assign dbsmPage_apply_btn_label = "Aplicar"/>
<#assign dbsmPage_return_to_listing_page = "&#8592; Volver a la página Lista de menús ODBC"/>
<#assign dataSourceTable_col_actions = "Acciones" />
<#assign dataSourceTable_action_Edit_label = "Editar"/>
<#assign dataSourceTable_action_Delete_label = "Eliminar"/>
<#assign dsAssignedButtons = "Botones asignados:" />
<#assign dsAssignedDMS = "Conjuntos de menús dependientes asignados:" />
<#assign dsColumnLookupError = "No se pudieron cargar las columnas de origen de datos."/>
<#assign dsConnectionError = "No se pudo conectar con el origen de datos. Compruebe su configuración de conexión y vuelva a intentarlo."/>
<#assign dsObjPropsRequiredLookupError = "No se pudieron cargar las propiedades opcionales para el tipo de documento seleccionado."/>
<#assign dsObjPropsOptionalLookupError = "No se pudieron cargar las propiedades necesarias para el tipo de documento seleccionado."/>
<#assign dbsmNoIllegalCharsError = "Estos caracteres no se admiten:"/>
<#assign datasource_prop_mapping_restricted = "¿Por qué no puedo editarlo?"/>
<#assign datasource_prop_mapping_restricted_delete = "¿Por qué no puedo eliminarlo?"/>
<#assign datasource_restricted_modify = "¿Por qué no puedo aplicarlo o eliminarlo?"/>

<#-- Autofill Profiles Listing Page -->
<#assign AutoFillProfilePage_title = "Perfiles de relleno automático"/>
<#assign AutoFillProfilePage_subtitle = "Use esta página para agregar perfiles de relleno automático para varios tipos de documentos. Al usar un perfil de relleno automático con un botón de escaneado, se almacenan valores adicionales de propiedades en los documentos escaneados según los valores de la propiedad especificados por los usuarios en la pantalla táctil de la impresora multifunción."/>
<#assign btnLabel_AddAutofillProfile = "Agregar perfil de relleno automático..."/>
<#assign btnLabel_DeleteSelAutofillProfiles = "Eliminar seleccionados"/>
<#assign autofillTable_col_name = "Nombre del perfil" />
<#assign autofillTable_col_datasource = "Ubicación y tipo de ODBC" />
<#assign autofillTable_col_mapping = "Asignación de columna &rarr; propiedad"/>
<#assign autofillTable_col_tablename = "Tabla/hoja de cálculo" />
<#assign autofillTable_col_doctype = "Tipo de documento" />
<#assign autofillTable_col_actions = "Acciones" />
<#assign autofillTable_col_buttonsUsing = "Asignaciones del botón de escaneado"/>
<#assign action_deleteAFPConfirmMsg = "¿Está seguro de que desea eliminar los perfiles seleccionados?" />
<#assign action_deleteAFPSuccessMsg = "Los perfiles se eliminaron correctamente." />
<#assign action_deleteAFPFailureMsg = "Se ha producido un error al eliminar los perfiles seleccionados." />
<#assign action_deleteAFPMappedFailureMsg = "Error: No se pueden eliminar uno o varios perfiles seleccionados porque se están usando como botones de escaneado." />
<#assign useforAutofillTip = "Use este campo de propiedades para rellenar automáticamente todos los campos asignados."/>
<#assign autofillTable_noAssignedButtons = "Ninguno"/>
<#assign autofillTable_noProfiles = "No se han configurado perfiles de relleno automático. Haga clic en el botón Agregar perfil de relleno automático para crear un perfil."/>
<#assign autofillTable_action_DeleteDisabled = "No se puede eliminar este perfil de relleno automático porque está siendo usado por uno o varios botones de escaneado. Cancele su utilización en la página de edición de la configuración de cada botón para eliminarlo."/>

<#-- Autofill Profile Add/Edit Page -->
<#assign AutoFillProfilePage_add_title = "Agregar perfil de relleno automático" />
<#assign AutoFillProfilePage_add_subtitle = "Para agregar un perfil de relleno automático, en primer lugar configure la conexión ODBC y, a continuación, asigne las propiedades del documento DocuShare a las columnas de la tabla. " />
<#assign AutoFillProfilePage_edit_title = "Editar perfil de relleno automático:" />
<#assign AutoFillProfilePage_edit_subtitle = "Cambie cualquiera de las opciones de perfil de relleno automático." />
<#assign AutoFillProfilePage_mappedBtnWarning = "<strong>Nota:</strong> El perfil es utilizado por uno o varios botones de escaneado, por lo que no se puede eliminar ni modificar. Cancele su utilización en la página de edición de la configuración de cada botón para eliminarlo o modificarlo."/>

<#assign afp_name_label = "Nombre del perfil:" />
<#assign afp_name_tip = "Un nombre único para el perfil de relleno automático." />
<#assign afp_name_fielderror_duplicatename="El nombre ya se usa. Escriba otro nombre."/>
<#assign afp_dsconn_heading ="Paso 1 de 2: Configure la conexión ODBC"/>
<#assign afp_dsconn_subheading ="Escriba la información de conexión al origen de datos."/>
<#assign afp_datasource_label = "Tipo de ODBC:" />
<#assign afp_datasource_tip = "El tipo del origen de datos." />
<#assign afp_dbname_label = "Ubicación del archivo/nombre de ODBC:" />
<#assign afp_dbname_tip = "Especifique el nombre de la base de datos, si usa una base de datos basada en un servidor, o la ubicación del archivo si usa un archivo de base de datos en el sistema de archivos o una hoja de cálculo de Microsoft Excel." />
<#assign afp_username_label = "Nombre de usuario:" />
<#assign afp_username_tip = "El nombre de usuario de la base de datos." />
<#assign afp_password_label = "Clave:" />
<#assign afp_password_tip = "La clave del nombre de usuario de la base de datos." />
<#assign afp_host_label = "Host:" />
<#assign afp_host_tip = "La dirección IP o el DNS de la base de datos." />
<#assign afp_port_label = "Puerto:" />
<#assign afp_port_tip = "El número de puerto de la base de datos." />
<#assign afp_table_label = "Nombre de la hoja de cálculo/tabla:" />
<#assign afp_table_tip = "Especifica el nombre de una tabla de una base de datos o el nombre de una hoja de cálculo de Microsoft Excel." />
<#assign afp_doctype_label = "Tipo de documento:" />
<#assign afp_doctype_tip = "Tipo de documento de DocuShare." />

<#assign afp_return_to_listing_page = "&#8592; Volver a la página Lista de perfiles de relleno automático"/>
<#assign afp_delete_profile_btn_label = "Eliminar perfil"/>
<#assign afp_dbsettings_heading = "Configuración de ODBC"/>

<#assign afp_mapping_heading = "Paso 2 de 2: Asigne las propiedades del documento de DocuShare a las columnas de la tabla"/>
<#assign afp_mapping_subheading = "Asigne las columnas de la tabla del origen de datos especificado a las propiedades del tipo de documento seleccionado. Cuando los usuarios escanean documentos en un dispositivo y escriben valores para las propiedades marcadas como Necesario para el relleno automático, todas las propiedades asignadas se rellenarán automáticamente mediante los valores correctos del origen de datos ODBC asignado. Nota: Para agregar o guardar un perfil, necesitará como mínimo un campo asignado obligatorio (Necesario para el relleno automático) y un campo asignado opcional."/>
<#assign afp_mapping_table_colhead_name = "Nombre de columna"/>
<#assign afp_mapping_table_colhead_dsprop = "Propiedad de DocuShare"/>
<#assign afp_mapping_table_colhead_primary = "Necesario para el relleno automático"/>
<#assign afp_mapping_table_colhead_primary_tip = "Seleccione los campos que deberán tener un valor para que los otros campos asignados se rellenen automáticamente."/>
<#assign afp_mapping_table_notsetup = "Seleccione una hoja de cálculo o una tabla de origen de datos y un tipo de documento de DocuShare para configurar la asignación de propiedades para la función de relleno automático."/>

<#assign afp_mapping_property_requiredFields = "Campos obligatorios"/>
<#assign afp_mapping_property_optionalFields = "Campos opcionales"/>
<#assign afp_edit_successMsg = "El perfil de relleno automático se ha actualizado correctamente."/>
<#assign afp_edit_failureMsg = "Error: Se produjo un error al actualizar el perfil de relleno automático."/>
<#assign afp_add_successMsg = "El perfil de relleno automático se ha agregado correctamente."/>
<#assign afp_add_failureMsg = "Error: Se produjo un error al agregar el perfil de relleno automático."/>
<#assign action_deleteSingleAFPConfirmMsg = "¿Está seguro de que desea eliminar este perfil de relleno automático? No se puede deshacer."/>
<#assign action_deleteSingleAFPSuccessMsg = "El perfil de relleno automático se ha eliminado correctamente."/>
<#assign action_deleteSingleAFPFailureMsg = "Error: Se produjo un error al eliminar el perfil de relleno automático."/>
<#assign noAutofillCbxError = "Seleccione como mínimo una casilla de Necesario para el relleno automático."/>
<#assign twoMappedFieldMinimumError = "Para agregar o guardar un perfil, necesitará como mínimo un campo asignado obligatorio (Necesario para el relleno automático) y un campo asignado opcional."/>
<#assign afp_EditDisabled = "No se puede eliminar ni modificar este perfil de relleno automático porque está siendo usado por uno o varios botones de escaneado. Cancele su utilización en la página de edición de la configuración de cada botón para eliminarlo o modificarlo. Consulte la lista de botones de escaneado asignados."/>



<#-- Simple Datasource Menus Listing Page -->
<#assign DatasourceMenuPage_title = "Menús ODBC" />
<#assign DatasourceMenuPage_subtitle = "Utilice esta página para agregar menús ODBC. Agregue un menú ODBC para recuperar valores de orígenes de datos que se usan en menús asignados a propiedades de documentos de DocuShare." />
<#assign btnLabel_AddDatasourceMenu = "Agregar menú de ODBC..."/>
<#assign btnLabel_DeleteSelDataSourceMenus = "Eliminar seleccionados"/>
<#assign dataSourceTable_col_menuname = "Nombre" />
<#assign dataSourceTable_col_type = "Tipo" />
<#assign dataSourceTable_col_datasource = "Ubicación y tipo de ODBC" />
<#assign dataSourceTable_col_tablesource = "Etiqueta del menú y origen del valor (Tabla/Columna)"/>
<#assign dataSourceTable_col_tablesource_label = "Etiqueta:"/>
<#assign dataSourceTable_col_tablesource_value = "Valor:"/>
<#assign dataSourceTable_col_property = "Asignado a la propiedad de DocuShare (Propiedad/Tipo del documento)" />
<#assign dataSourceTable_col_dms = "Asignaciones de conjunto de menús dependientes">
<#assign dataSourceTable_type_dsMenuTip = "Menú ODBC simple">
<#assign dataSourceTable_empty = "No se han configurado menús ODBC. Haga clic en el botón Agregar menú ODBC para crear un menú."/>

<#assign dsm_deleteaction_mappedbtn_msg="El menú ODBC es usado por uno o diversos <strong>botones de escaneado</strong>. Cancele su utilización en la página de edición de la configuración de cada botón para eliminarlo."/>
<#assign dsm_deleteaction_dm_msg="El menú ODBC es utilizado por uno o diversos <strong>conjuntos de menús dependientes</strong>. Cancele su utilización en cada menú dependiente antes de realizar la eliminación."/>
<#assign dsm_deleteaction_mappedbtnanddm_msg="Este menú ODBC es utilizado por uno o varios <strong>conjuntos de menús dependientes</strong> y <strong>botones de escaneado</strong>.  La eliminación del menú hará que los botones de escaneado asignados o los conjuntos de menús dependientes dejen de funcionar. Cancele su utilización en cada menú dependiente asignado y cada botón de escaneado antes de realizar la eliminación."/>
<#assign dbsmPage_mappingDisabledPropTip = "El menú ODBC es usado por uno o diversos botones de escaneado asignados. La edición del menú hará que los botones de escaneado asignados dejen de funcionar. Elimine la utilización en cada botón de escaneado asignado antes de editar esta propiedad."/>

<#-- ODBC Menu Add/Edit Page -->
<#assign dbsmPage_add_title = "Agregar menú ODBC" />
<#assign dbsmPage_add_subtitle = "Para agregar un menú ODBC, en primer lugar configure la conexión ODBC y, a continuación, asigne el menú ODBC a una propiedad del documento de DocuShare." />
<#assign dbsmPage_edit_title = "Editar el menú ODBC:" />

<#assign dbsmPage_mappedBtnWarning = "El menú ODBC es utilizado por uno o diversos <strong>botones de escaneado</strong>, por lo que los valores de las propiedades de DocuShare y de tipo de documento asignados (que se muestran en el paso 2) no se pueden editar. En primer lugar, cancele su utilización en los botones asignados (se muestran en la lista de asignaciones) y, a continuación, vuelva a esta pantalla para editar las propiedades o eliminar el menú."/>
<#assign dbsmPage_mappedDMSWarning = "Este menú ODBC es utilizado por uno o varios <strong>conjuntos de menús dependientes</strong>, por lo que las opciones no se pueden modificar. En primer lugar, cancele su utilización en los conjuntos de menús dependientes asignados indicados y, a continuación, vuelva a esta pantalla para realizar los cambios."/>
  <#assign dbsmPage_mappedBtnAndDMSWarning = "Este menú ODBC es utilizado por uno o varios <strong>conjuntos de menús dependientes</strong> y <strong>botones de escaneado</strong>. Este menú es utilizado en conjuntos de menús dependientes, por lo que las opciones no se pueden modificar. En primer lugar, cancele su utilización en los conjuntos de menús dependientes asignados indicados y, a continuación, vuelva a esta pantalla para realizar los cambios. Si este menú está asignado a un botón de escaneado, sus valores de propiedades de DocuShare y el tipo de documento (se muestran en el paso 2) no se pueden modificar."/>

<#assign dbsmPage_edit_subtitle = "Cambie cualquiera de las opciones del menú ODBC." />
<#assign dbsm_name_label = "Nombre del menú:"/>
<#assign dbsm_name_tip = "Un nombre único para el menú ODBC."/>
<#assign dbsm_name_fielderror_duplicatedtitle="Hay otro menú ODBC con este nombre. Introduzca un nombre exclusivo."/>
<#assign dbsm_property_label = "Propiedad de DocuShare:"/>
<#assign dbsm_property_tip = "La propiedad de DocuShare que se usará para el menú con opciones de los datos ODBC."/>
<#assign dbsm_columnforlabel_label = "Columna para la etiqueta del menú:"/>
<#assign dbsm_columnforlabel_tip = "La columna de origen de datos que se usará para la lista de etiquetas de opciones de menú. De manera prefijada, se configura con la misma columna asignada al valor del menú."/>
<#assign dbsm_columnforvalue_label = "Columna para valor de menú:"/>
<#assign dbsm_columnforvalue_tip = "La columna de origen de datos que se usará para la lista de valores de opciones de menú."/>
<#assign dbsmPage_mapping_title = "Paso 2 de 2: Asignar el menú ODBC a una propiedad de DocuShare"/>
<#assign dbsmPage_mapping_subtitle = "Seleccione una tabla o una hoja de trabajo y una columna del origen de datos seleccionado que se usarán como valores de un determinado menú ODBC. Opcionalmente, puede seleccionar una columna que se usará como etiqueta de elemento del menú. A continuación, seleccione un tipo de documento de DocuShare y una de sus propiedades para su utilización en el menú cuyas opciones se rellenarán al realizar el escaneado."/>

<#assign dbsmPage_prop_mappingdisabledwarningtp = ""/>

<#assign dbsmPage_edit_successMsg = "El menú ODBC se ha actualizado correctamente."/>
<#assign dbsmPage_edit_failureMsg = "Error: Se produjo un error al actualizar el menú ODBC."/>
<#assign dbsmPage_add_successMsg = "El menú ODBC se ha agregado correctamente."/>
<#assign dbsmPage_add_failureMsg = "Error: Se produjo un error al agregar el menú ODBC."/>

<#assign action_deleteDSMenuConfirmMsg = "¿Está seguro de que desea eliminar los menús ODBC seleccionados? No se puede deshacer."/>
<#assign action_deleteDSMenuSuccessMsg = "Ha eliminado correctamente los menús ODBC seleccionados."/>
<#assign action_deleteDSMenuFailureMsg = "Error: Se produjo un error al eliminar los menús ODBC seleccionados."/>
<#assign action_deleteDSMenuMappedFailureMsg = "Error: Uno o varios de los menús ODBC seleccionados son usados por botones de escaneado o conjuntos de menús dependientes y no se pueden suprimir."/>

<#assign action_deleteSingleDSMenuConfirmMsg = "¿Está seguro de que desea eliminar este menú ODBC? No se puede deshacer."/>
<#assign action_deleteSingleDSMenuSuccessMsg = "El menú ODBC se ha eliminado correctamente."/>
<#assign action_deleteSingleDSMenuFailureMsg = "Error: Se produjo un error al eliminar el menú ODBC."/>


<#-- ODBC Dependent Menu Set Listing Page -->
<#assign dmsPage_title = "Conjuntos de menús dependientes ODBC" />
<#assign dmsPage_subtitle = "Use esta página para agregar un conjunto de menús dependientes ODBC para vincular uno o varios menús ODBC predefinidos." />
<#assign dmsPage_addBtn = "Agregar conjuntos de menús dependientes ODBC..."/>
<#assign dmsPage_deleteSelectedBtn = "Eliminar seleccionados"/>

<#assign dmsPage_action_deleteConfirmMsg_multi = "¿Está seguro de que desea eliminar los conjuntos de menús dependientes ODBC seleccionados?" />
<#assign dmsPage_action_deleteSuccessMsg_multi = "Los conjuntos de menús dependientes ODBC seleccionados se han eliminado correctamente." />
<#assign dmsPage_action_deleteFailureMsg_multi = "Se ha producido un error al eliminar los conjuntos de menús dependientes ODBC seleccionados." />
<#assign dmsPage_action_deleteFailureMappingMsg_multi = "Error: Uno o varios conjuntos seleccionados están siendo utilizados en botones de escaneado y no se pueden eliminar." />
<#assign dmsPage_action_deleteConfirmMsg_single = "¿Está seguro de que desea eliminar el conjunto de menús dependientes ODBC seleccionado?" />
<#assign dmsPage_action_deleteSuccessMsg_single= "El conjunto de menús dependientes ODBC seleccionado se ha eliminado correctamente." />
<#assign dmsPage_action_deleteFailureMsg_single = "Se ha producido un error al eliminar el conjunto de menús dependientes ODBC seleccionado." />

<#assign dmsPage_table_empty = "No se han configurado conjuntos de menús ODBC dependientes. Haga clic en el botón Agregar conjunto de menús ODBC dependientes para crear un nuevo menú.">
<#assign dmsPage_table_iconTip = "Conjunto de menús dependientes ODBC">
<#assign dmsPage_table_col_name = "Nombre del conjunto de menús">
<#assign dmsPage_table_col_menus = "Menús usados">
<#assign dmsPage_table_col_btnsassigned = "Botones que los usan">
<#assign dmsPage_table_col_actions = "Acciones">
<#assign dmsPage_table_col_action_DeleteDisabled = "No se puede eliminar este conjunto de menús dependientes porque uno o varios botones de escaneado lo usan. Cancele su utilización en la página de edición de la configuración de cada botón antes de eliminarlo."/>


<#-- ODBC Dependent Menu Set Add/Edit Page -->
<#assign dmPage_add_title = "Agregar conjuntos de menús dependientes ODBC"/>
<#assign dmPage_add_subtitle = "Seleccione una serie de menús ODBC existentes con valores dependientes entre ellos. Seleccione un menú principal y, a continuación, seleccione uno o varios menús dependientes. Asigne la etiqueta de cada opción del menú a un valor de una columna de la tabla del origen de datos para vincular el menú dependiente."/>
<#assign dmPage_edit_title = "Editar conjuntos de menús dependientes ODBC:"/>
<#assign dmPage_edit_subtitle = "Cambie la configuración de cualquiera de los conjuntos de menús dependientes ODBC."/>
<#assign dmPage_mappedBtnWarning = "<strong>Nota:</strong> Dado que este conjunto de menús dependientes es usado por uno o varios botones de escaneado, no podrá cambiar sus selecciones de menú de origen de datos ni suprimirlo. En primer lugar, cancele la utilización del conjunto de menús dependientes en la página de edición de la configuración de cada botón y, a continuación, vuelva a esta página para cambiar las selecciones del menú de origen de datos o para suprimirlo. Puede cambiar la configuración en la sección Asignar valores del menú."/>
<#assign dmPage_mappedBtnNoDeleteTip = ""/>

<#assign dmPage_profileName_label="Nombre de conjunto de menús dependientes:"/>
<#assign dmPage_profileName_tip="Un nombre único para el conjunto de menús dependientes ODBC."/>
<#assign dmPage_profileName_fielderror_duplicatedtitle="Hay otro conjunto de menús ODBC dependientes con este nombre. Introduzca un nombre exclusivo."/>
<#assign dmPage_section_SelectODBCMenus = "Seleccionar los menús de origen de datos"/>
<#assign dmPage_section_SelectODBCMenus_subtitle = "Seleccione un menú principal y, a continuación, seleccione uno o varios menús cuyos valores dependen entre ellos."/>
<#assign dmPage_primaryMenuLabel= "Menú principal:"/>
<#assign dmPage_primaryMenuTip= "El menú ODBC principal del conjunto. Usa la configuración de columna, tabla y base de datos del menú de ODBC."/>
<#assign dmPage_dependentMenuLabel1= "Menú dependiente 1:"/>
<#assign dmPage_dependentMenuTip1= "El primer menú ODBC dependiente del conjunto. Solo usa la configuración de tabla y base de datos del menú de ODBC."/>
<#assign dmPage_dependentMenuLabel2= "Menú dependiente 2:"/>
<#assign dmPage_dependentMenuTip2= "El segundo menú ODBC dependiente del conjunto. Solo usa la configuración de tabla y base de datos del menú de ODBC."/>
<#assign dmPage_add_dm="Agregar menú dependiente"/>
<#assign dmPage_remove_dm="Eliminar menú dependiente"/>
<#assign dmPage_menuoption_none="Ninguno"/>
<#assign dmPage_noODBCMenus = "No puede agregar un conjunto de menús dependientes ODBC porque no hay menús ODBC. Vaya a la página Menús ODBC para agregar uno."/>

<#assign dmPage_section_MapMenuValues = "Asignar valores del menú"/>
<#assign dmPage_section_MapMenuValues_subtitle = "Asigne los valores de cada opción de menú a su menú dependiente mediante la configuración de los valores del menú y, opcionalmente, de sus etiquetas, en la columna de origen de datos."/>
<#assign dmPage_returntolisting = "&#8592; Volver a la página Lista de conjuntos de menús dependientes ODBC"/>
<#assign dmPage_mapingtable_emptyoptionshelp="&larr; Seleccione las columnas para los valores y las etiquetas de opciones."/>
<#assign dmPage_addBtnLabel="Agregar"/>
<#assign dmPage_deleteBtnLabel="Eliminar conjunto de menús"/>
<#assign dmPage_colMenuNoSelection="Seleccionar una columna&#8230;"/>
<#assign dmPage_maptblhdr_mapping ="Asignación"/>
<#assign dmPage_maptblhdr_options ="Opciones"/>
<#assign dmPage_maptblhdr_optscolsubheading ="Etiqueta: Valor"/>
<#assign dmPage_maptblhdr_colforlabel ="Columna para la etiqueta"/>
<#assign dmPage_maptblhdr_colforvalue ="Columna para el valor"/>


<#-------------------------------------->
<#---------- MFD UI Messages ----------->
<#-------------------------------------->
<#assign browseCollection_MenuLabel = "Seleccionar una carpeta:">
<#assign browseCollection_selectBtnLabel = "Seleccionar una carpeta"/>
<#assign browseCollection_ResponseError = "Error: la carpeta no se encontró o hay un problema de conexión con el servidor de DocuShare."/>
<#assign browseCollection_UpOneLevel = "Subir un nivel"/>

<#assign browseFolder_MenuLabel = "Seleccionar una carpeta:">
<#assign browseFolder_selectBtnLabel = "Seleccionar una carpeta"/>
<#assign browseFolder_ResponseError = "Error: la carpeta de red no se encontró o hay un problema de conexión de red."/>
<#assign emailSubjectLabel = "Tema del e-mail"/>
<#assign folderSubjectLabel = "Nombre de archivo"/>
<#assign sendingScanToTxt = "El escaneado se está enviando a:"/>

<#-- MFP Device Emulator List Page -->

<#assign EmulatorPage_title="Emulador del dispositivo MFP"/>
<#assign EmulatorPage_subtitle="Use esta página para emular la funcionalidad de la MFP. Haga clic en cualquier botón para empezar a escanear."/>


