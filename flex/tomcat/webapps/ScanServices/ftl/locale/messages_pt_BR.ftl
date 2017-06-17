<#-------------------------------------->
<#-------- Admin UI Messages ----------->
<#-------------------------------------->

<#-- StandAlone Menu -->
<#assign standalone_menu_title = "Menu do Scan Service"/>
<#assign link_configBtnsLabel="Configurar botões"/>
<#assign link_configBtnsTip="Adicione e configure botões do Scan Service para uso em impressoras multifuncionais."/>
<#assign link_configDevicesLabel="Configurar dispositivos"/>
<#assign link_configDevicesTip="Configure as impressoras multifuncionais para uso com o DocuShare Scan Service e gerencie os botões atribuídos aos dispositivos."/>
<#assign link_scanLogLabel="Log de digitalização"/>
<#assign link_scanLogTip="Exiba atividades recentes de digitalização e faça download do log de todos os trabalhos de digitalização."/>
<#assign link_logSettingsLabel="Log do servidor"/>
<#assign link_logSettingsTip="Modifique o nível de registro em log do servidor e faça download do log do servidor."/>
<#assign link_emailServiceLabel="Configuração de email"/>
<#assign link_emailServiceTip="Configurar o serviço de email."/>
<#assign link_configureServerLabel="Configuração do servidor" />
<#assign link_configureServerTip="Defina as configurações do servidor do DocuShare Scan Service." />
<#assign link_autoFillProfileLabel = "Perfis de preenchimento automático"/>
<#assign link_autoFillProfileTip = "Use esta página para adicionar perfis de preenchimento automático para os tipos de documentos. Adicione um perfil de preenchimento automático para ter valores de propriedade adicionais incluídos com os documentos digitalizados com base nos valores de propriedade que os usuários inseriram na tela de toque da MFP."/>
<#assign link_dataSourceMenusLabel = "Menus ODBC"/>
<#assign link_dataSourceMenusTip = "Use esta página para adicionar menus ODBC. Adicione um menu ODBC para recuperar valores de uma fonte de dados usada em um menu atribuído a um documento de propriedade do DocuShare. É possível adicionar dois tipos de menus: menus simples ou conjuntos de menus dependentes."/>
<#assign link_dataSourceDependentMenusLabel = "Conjuntos de menus dependentes ODBC"/>
<#assign link_dataSourceDependentMenusTip = "Use esta página para adicionar um conjunto de menus dependentes ODBC ao criar um link com um ou mais menus ODBC predefinidos."/>
<#assign link_heading_serverconfig = "Configuração do servidor"/>
<#assign link_heading_logs = "Logs"/>
<#assign link_heading_odbc = "Conectores ODBC"/>
<#assign link_heading_Emulator = "Emulador de dispositivo"/>
<#assign link_EmulatorTip = "Use esta página para emular o dispositivo."/>
<#assign link_EmulatorLabel="Emulador"/>

<#-- Form validation general strings -->
<#assign validationErrorGeneralMsg="Corrija os erros abaixo."/>
<#assign fieldErrorTitle="Erro:"/>
<#assign fielderror_empty="Este campo não pode estar vazio."/>


<#-- Configure Buttons List Page -->
<#assign deleteAction_confirm="Tem certeza de que deseja excluir este botão? Essa ação não poderá ser desfeita. Continuar?"/>
<#assign deleteAction_error="Erro: Não foi possível excluir o botão."/>
<#assign deleteAction_success="O botão foi excluído com êxito."/>

<#assign configBtnPage_title="Configurar botões"/>
<#assign configBtnPage_subtitle="Use esta página para adicionar e configurar botões do DocuShare Scan Service para uso em impressoras multifuncionais. Para iniciar, adicione um novo botão do DocuShare Scan Service. Em seguida, adicione botões secundários de digitalização e de pasta (para organizar os botões de digitalização) sob o botão do DocuShare Scan Service."/>
<#assign link_addScanButtonLabel="Novo botão do Scan Service&#8230;"/>
<#assign emptyBtnListMsg="Nenhum botão foi criado ainda."/>
<#assign link_emptyBtnListNewLink="Clique aqui para criar um novo botão."/>
<#assign listheading_button="Botão"/>
<#assign listheading_type="Tipo"/>
<#assign listheading_access="Acessar"/>
<#assign listheading_actions="Ações"/>

<#assign buttonTip="Exibir/editar botão..."/>
<#assign btnTreeBtn_collapse_label="Recolher"/>
<#assign btnTreeBtn_expand_label="Expandir"/>
<#assign btnTreeBtn_collapse_tooltip="Oculte a lista de botões secundários."/>
<#assign btnTreeBtn_expand_tooltip="Mostre a lista de botões secundários."/>

<#assign btnType_service="Botão do DocuShare Scan Service"/>
<#assign btnType_folder="Botão de pasta"/>
<#assign btnType_scan="Botão de digitalização"/>
<#assign groupAccessOnlyLabel="Somente acesso de grupo"/>
<#macro groupAccessOnlyTip handle>Restrito ao grupo do DocuShare (${handle})</#macro>

<#assign action_addFolderBtnLabel="Adicionar botão de pasta secundário"/>
<#assign action_addFolderBtnTip="Adicionar botão de pasta secundário"/>
<#assign action_addScanBtnLabel="Adicionar botão de digitalização secundário"/>
<#assign action_addScanBtnTip="Adicionar botão de digitalização secundário"/>
<#assign action_editPropsBtnLabel="Exibir/editar configurações"/>
<#assign action_editPropsBtnTip="Exibir/editar configurações"/>
<#assign action_editPermissionsBtnLabel="Alterar permissões"/>
<#assign action_editPermissionsBtnTip="Alterar permissões"/>
<#assign action_deleteBtnLabel="Excluir botão"/>
<#assign action_deleteBtnTip="Excluir botão"/>
<#assign btn_expandtree_label="Expandir tudo"/>
<#assign btn_expandtree_help="Mostrar todos os botões secundários."/>
<#assign btn_collapsetree_label="Recolher tudo"/>
<#assign btn_collapsetree_help="Ocultar todos os botões secundários."/>
<#assign colhead_tip_accessLevel="Nível de acesso (Convidado ou Grupo do DocuShare)"/>
<#assign colhead_tip_scanType="Tipo de digitalização (pasta do DocuShare, pasta de rede ou email)"/>
<#assign scantype_tip_DocuShare="Digitalizar para pasta do DocuShare"/>
<#assign scantype_tip_NetworkFolder="Digitalizar para pasta de rede"/>
<#assign scantype_tip_Email="Digitalizar para email"/>


<#-- Edit Button Settings, Edit Button Permissions, Add Buttons Pages -->
<#macro title_editsettings buttontypelabel buttonlabel>Editar configurações de ${buttontypelabel}: <span class="quiet">${buttonlabel}</span></#macro>
<#assign subtitle_editsettings="Use esta página para editar as configurações do botão."/>
<#macro title_editpermissions buttontypelabel buttonlabel>Editar permissões de ${buttontypelabel}: <span class="quiet">${buttonlabel}</span></#macro>
<#assign subtitle_editpermissions="Use esta página para controlar o acesso ao botão no dispositivo."/>
<#macro title_add buttontypelabel>Adicionar ${buttontypelabel}</#macro>
<#macro subtitle_add buttontypelabel>Use esta página para adicionar um novo ${buttontypelabel}.</#macro>


<#macro fielderror_userHandleNotFound handle>O usuário com o identificador <code>${handle}</code> não está mais no site. Selecione um usuário diferente.</#macro>
<#macro fielderror_groupHandleNotFound handle>O grupo com o identificador <code>${handle}</code> não está mais no site. Selecione um grupo diferente.</#macro>
<#macro fielderror_CollectionHandleNotFound handle>A pasta com o identificador <code>${handle}</code> não está mais no site. Selecione uma pasta diferente.</#macro>
<#assign editbtn_formsubmit_success = "As configurações do botão foram atualizadas com êxito."/>
<#assign editbtn_formsubmit_error = "Erro. Não foi possível salvar as atualizações do botão."/>

<#assign btn_apply="Aplicar"/>
<#assign btn_addButton="Adicionar botão"/>
<#assign btn_deleteButton="Excluir botão"/>
<#assign link_returnToButtonList="Voltar para a página Lista de botões"/>
<#assign btntitle_Scan="Botão de digitalização"/>
<#assign btntitle_Service="Botão de serviço do dispositivo"/>
<#assign btntitle_Folder="Botão de pasta"/>

<#assign scanOwner_title = "Proprietário do botão"/>
<#assign scanOwner_description = "Selecione um usuário do DocuShare como o proprietário do botão de digitalização. Se o usuário não estiver autenticado no momento com o sistema de serviços de digitalização, uma senha será exigida."/>
<#assign scanSettings_title = "Configurações de digitalização"/>
<#assign propLabel_ButtonLabel="Rótulo do botão:"/>
<#assign propHelp_ButtonLabel="O nome do botão exibido na tela de toque do dispositivo."/>

<#assign propLabel_ScanType = "Tipo de digitalização:"/>
<#assign propHelp_ScanType = "O tipo de destino no qual os documentos digitalizados serão armazenados."/>
<#assign optionLabel_ScanType_DocuShare = "Pasta do DocuShare"/>
<#assign optionLabelHint_ScanType_DocuShare = "Envia documentos digitalizados a uma pasta do DocuShare."/>
<#assign optionLabel_ScanType_Folder = "Pasta de rede"/>
<#assign optionLabelHint_ScanType_Folder = "Envia documentos digitalizados a uma pasta de rede."/>
<#assign optionLabel_ScanType_Email = "Email"/>
<#assign optionLabelHint_ScanType_Email = "Envia documentos digitalizados para um endereço de email."/>
<#assign optionLabel_ScanType_Email_ServerNotConfiguredLabel = "(Servidor não configurado)"/>
<#assign optionLabel_ScanType_Email_ServerNotConfiguredTip = "O servidor de email não está configurado. Vá para a página Configurar email e verifique se as configurações de conexão de email estão corretas."/>

<#assign propLabel_ScanToCollection="Digitalizar para pasta do DocuShare:"/>
<#assign propHelp_ScanToCollection="A pasta do DocuShare de destino para os documentos digitalizados."/>
<#assign propNote_ScanToCollection="Realize uma pesquisa digitando o título da pasta do DocuShare. NOTA IMPORTANTE: Somente as pastas para as quais o proprietário tem permissão de gravação serão retornadas."/>
<#assign noCollectionFoundPlaceholder="Atribua o proprietário do botão acima antes de inserir a pasta."/>
<#assign propLabel_ScanToPerCollEnable="Digitalizar para pasta pessoal:"/>
<#assign propHelp_ScanToPerCollEnable="Quando marcada, essa opção substituirá a pasta inserida no campo Digitalizar para pasta do DocuShare e digitalizará documentos para a pasta pessoal do usuário conectado. Os documentos digitalizados de um usuário convidado são enviados para a pasta definida no campo Digitalizar para pasta do DocuShare."/>
<#assign folderNotFound_msg = "Pasta não encontrada no DocuShare."/>

<#assign propLabel_Owner="Proprietário:"/>
<#assign propHelp_Owner="O proprietário atribuído aos documentos digitalizados."/>
<#assign propNote_Owner>Realize uma pesquisa digitando um nome de usuário (por exemplo: <code>jdoe</code>). NOTA IMPORTANTE: Somente usuários em nível de Coordenador devem ser usados.</#assign>
<#assign propLabel_OwnerPassword="Senha do proprietário:"/>
<#assign ownerAuthenticated_msg = "Proprietário autenticado"/>
<#assign ownerNotAuthenticated_msg = "Proprietário não autenticado. Digite uma senha e clique no botão Autenticar proprietário."/>
<#assign btn_AuthenticateOwner_label="Autenticar proprietário"/>
<#assign ownerNotFound_msg = "Proprietário não encontrado no sistema. Tente realizar a pesquisa novamente."/>

<#assign propLabel_folderPath="Digitalizar para pasta:"/>
<#assign propHelp_folderPath="A pasta de rede de destino dos documentos digitalizados."/>
<#assign propNote_folderPath>Digite um caminho de pasta de rede usando a convenção de nomenclatura UNC. (por exemplo: <code>\\server\share</code>)</#assign>
<#assign propLabel_folderUser="Nome de usuário da pasta:"/>
<#assign propHelp_folderUser="O nome de usuário da pasta de rede selecionada."/>
<#assign propLabel_folderPassword="Senha da pasta:"/>
<#assign propHelp_folderPassword="A senha da pasta de rede selecionada."/>
<#assign folderTestConnBtn_label="Testar conexão"/>
<#assign folderTestConn_pleasewait = "Testando. Aguarde..."/>
<#assign folderTestConnBtn_success="Conexão bem-sucedida!"/>
<#assign folderTestConnBtn_failure_authenticate="Falha de logon: nome de usuário ou senha desconhecidos."/>
<#assign folderTestConnBtn_failure_unknownDomain="Falha na conexão: domínio desconhecido."/>
<#assign folderTestConnBtn_failure_badNetworkPath="Falha na conexão: Não foi possível localizar a pasta de rede."/>
<#assign folderTestConnBtn_failure_others="Falha na conexão: Não foi possível estabelecer conexão com a pasta de rede selecionada."/>
<#assign propLabel_exportMeta = "Exportar metadados:"/>
<#assign propNote_exportMeta = "Exportar propriedades selecionadas de metadados (na tabela de campos de propriedade abaixo) como um arquivo xml."/>
<#assign propLabel_browseCollection = "Procurar em subpastas no momento da digitalização:"/>
<#assign propNote_browseCollection = "Selecione para procurar subpastas na página de digitalização do dispositivo. (Somente para os tipos de digitalização para pasta do DocuShare ou pastas de rede.)"/>
<#assign propLabel_defaultEmailAddress = "Endereço “Para:” do email:"/>
<#assign propNote_defaultEmailAddress = "O endereço de email para o qual a digitalização será enviada. Se deixado em branco, o endereço de email do usuário conectado será usado, se disponível."/>
<#assign propLabel_scanConfirmation = "Exibir Confirmação de digitalização:"/>
<#assign propNote_scanConfirmation = "Selecione para exibir uma mensagem de confirmação na tela de toque do dispositivo quando o documento digitalizado é armazenado na localização definida.Com base no tamanho do documento e no processamento necessário, poderá demorar mais até a mensagem de confirmação ser exibida."/>

<#assign propLabel_DefaultFormat="Formato padrão:"/>
<#assign propHelp_DefaultFormat="O formato de arquivo padrão do documento."/>
<#assign optionLabel_DefaultFormat_pdf="Portable Document Format (PDF)"/>
<#assign optionLabelHint_DefaultFormat_pdf="Salva os documentos em formato PDF."/>
<#assign optionLabel_PDF_A = "Portable Document Archive Format (PDF-A)"/>
<#assign optionLabelHint_PDF_A = "Salva documentos no formato PDF-A, formato de arquivo que inclui os recursos de PDF ideais para a preservação digital em longo prazo. Essa opção poderá ser selecionada somente se o dispositivo ou o servidor do DocuShare oferecer suporte a ela."/>
<#assign optionLabel_MRC_PDF = "PDF (MRC) de alta compactação" />
<#assign optionLabelHint_MRC_PDF = "Salva os documentos em formato PDF Mixed Raster Content (MRC) altamente compactado para criar arquivos menores, porém de qualidade inferior. Essa opção poderá ser selecionada somente se o dispositivo ou o servidor do DocuShare oferecer suporte a ela."/>
<#assign optionLabel_MRC_PDF_A = "PDF-A (MRC) de alta compactação"/>
<#assign optionLabelHint_MRC_PDF_A = "Salva os documentos em formato PDF-A Mixed Raster Content (MRC) altamente compactado para criar arquivos menores, porém de qualidade inferior, para a preservação digital em longo prazo. Essa opção poderá ser selecionada somente se o dispositivo ou o servidor do DocuShare oferecer suporte a ela."/>

<#assign propLabel_DefaultOCR="OCR padrão:"/>
<#assign propHelp_DefaultOCR="A configuração padrão de OCR (reconhecimento óptico de caracteres)."/>
<#assign optionLabel_DefaultOCR_imageonly="Somente imagem"/>
<#assign optionLabelHint_DefaultOCR_imageonly="Converte uma digitalização em um documento somente imagem."/>

<#assign optionLabel_DefaultOCR_searchable="Pesquisável"/>
<#assign optionLabelHint_DefaultOCR_searchable="Converte uma digitalização em um documento de texto que pode ser pesquisado."/>

<#assign optionLabel_DefaultOCR_searchableByServer="Pesquisável – convertido pelo DocuShare"/>
<#assign optionLabelHint_DefaultOCR_searchableByServer="Converte uma digitalização em um documento de texto que pode ser pesquisado usando o software de OCR do DocuShare."/>
<#assign optionLabel_DefaultOCR_searchableByDevice="Pesquisável – convertido pelo dispositivo"/>
<#assign optionLabelHint_DefaultOCR_searchableByDevice="Converte uma digitalização em um documento de texto que pode ser pesquisado usando o software de OCR da impressora multifuncional."/>

<#assign optionLabel_SEARCHABLE_IMAGE="Pesquisável"/>
<#assign optionLabel_IMAGE_ONLY="Somente imagem"/>

<#assign propLabel_DefaultResolution="Resolução padrão:"/>
<#assign propHelp_DefaultResolution="A resolução padrão da digitalização."/>
<#assign optionLabel_DefaultResolution_300x300="Alta qualidade (300 x 300 dpi)"/>
<#assign optionLabelHint_DefaultResolution_300x300="Digitalização de alta resolução"/>
<#assign optionLabel_DefaultResolution_200x200="Qualidade média (200 x 200 dpi)"/>
<#assign optionLabelHint_DefaultResolution_200x200="Digitalização de resolução média"/>

<#assign propLabel_scanColor = "Cor da digitalização padrão:"/>
<#assign propHelp_scanColor = "A configuração de cor de digitalização do documento."/>
<#assign scanColorOption_AUTO ="Auto"/>
<#assign scanColorOption_FULL_COLOR ="Em cores"/>
<#assign scanColorOption_GRAYSCALE ="Tons de cinza"/>
<#assign scanColorOption_BLACK_AND_WHITE ="Preto e branco"/>

<#assign propLabel_ScanOrientation="Orientação da digitalização:"/>
<#assign propHelp_ScanOrientation="A orientação da digitalização do documento."/>
<#assign scanOrientationOption_Portrait="Retrato"/>
<#assign scanOrientationOption_Landscape="Paisagem"/>
<#assign scanSizeOption_Auto="Auto"/>
<#assign scanSizeOption_Mixed="Misto"/>

<#assign propLabel_ExportScanSettings="Exportar configurações de digitalização:"/>
<#assign propHelp_ExportScanSettings="Selecione para habilitar os usuários da MFP a alterarem as configurações de OCR, Formato de arquivo, Resolução e Cor da digitalização antes de digitalizar."/>

<#assign propLabel_MfpScanPage="Digitalização da página"/>
<#assign optionLabel_OneSided="1 Face"/>
<#assign optionLabel_TwoSided="2 Faces"/>
<#assign optionLabel_SecondSideRotation="2 Faces, Girar Face 2"/>

<#assign label_MfpScanSettings="Configurações de digitalização..."/>
<#assign propLabel_MfpAdv_OCR="OCR da digitalização"/>
<#assign propLabel_MfpAdv_Format="Formato da digitalização"/>
<#assign propLabel_MfpAdv_Resolution="Resolução da digitalização"/>
<#assign propLabel_MfpAdv_Color="Cor da digitalização"/>
<#assign propLabel_MfpAdv_Orientation="Orientação da digitalização"/>
<#assign propLabel_MfpAdv_Size="Tamanho do papel da digitalização"/>

<#assign networkfilenamesettings_title = "Configurar nome de arquivo"/>
<#assign networkfilenamesettings_desc = "Informe um nome de arquivo para os documentos digitalizados e, como opção, acrescente informações adicionais."/>
<#assign propLabel_networkfilename = "Nome de arquivo"/>
<#assign propLabel_emailfilename = "Assunto do email"/>
<#assign propLabelHint_networkfilename = "O nome de arquivo base dos documentos digitalizados."/>

<#assign fieldsettings_title = "Configuração de propriedade do documento (metadados)"/>
<#assign fieldsettings_desc = "Selecione o tipo de documento para salvar os documentos digitalizados e escolha os campos de propriedade que os usuários poderão exibir e editar durante a digitalização. Os usuários não poderão editar valores de propriedade gerados automaticamente."/>

<#assign fieldsettings_desc = "Selecione o tipo de documento e escolha os campos de propriedade que os usuários poderão exibir e editar durante a digitalização. Os usuários não poderão editar valores de propriedade gerados automaticamente."/>

<#assign fieldsettings_desc_networkfolder = "Selecione o tipo de documento e escolha os campos de propriedade que os usuários poderão exibir e editar durante a digitalização. Os usuários não poderão editar valores de propriedade gerados automaticamente. Para digitalizações para pasta de rede, o valor do campo Título será usado como o nome do arquivo do documento. Todos os outros campos serão exportados para um arquivo XML associado se a opção “Exportar metadados” estiver habilitada."/>

<#assign fieldsettings_desc_email = "Selecione o tipo de documento e escolha os campos de propriedade que os usuários poderão exibir e editar durante a digitalização. Os usuários não poderão editar valores de propriedade gerados automaticamente. Para digitalizações para email, o valor do campo Título será usado como o nome do arquivo do anexo do email. Todos os outros campos serão exportados para um arquivo XML anexado se a opção “Exportar metadados” estiver habilitada."/>


<#assign propLabel_doctype = "Tipo de documento:"/>
<#assign propLabelHint_doctype = "O tipo de documento no qual todas as digitalizações serão salvas."/>
<#assign doctype_change_confirm = "Tem certeza de que deseja mudar para outro tipo de documento? Isso removerá suas configurações de campo atuais."/>
<#assign propLabel_autoFillProfile = "Perfil de preenchimento automático:"/>
<#assign propLabelHint_autoFillProfile = "Escolha um perfil para este Tipo de documento que especifica certos campos que, uma vez preenchidos, no momento da digitalização, farão com que outros campos de propriedade também sejam preenchidos automaticamente com os valores apropriados com base em uma fonte de dados específica."/>
<#assign optionLabel_autoFillProfile_noProfile ="Sem perfil"/>
<#assign afp_missingfields_error = "Os campos de perfil de preenchimento automático a seguir devem ser adicionados à tabela de campos de metadados:"/>
<#assign dms_missingfields_error = "Os campos do conjunto de menus dependentes a seguir devem ser adicionados à tabela de campos de metadados:"/>
<#assign afp_mappedfield_defaultval_hint = "Esse valor de campo é controlado pelo perfil de preenchimento automático e não pode ser editado manualmente. Ele é preenchido dinamicamente após o preenchimento dos campos “Exigido para preenchimento automático”."/>

<#assign propLabel_propName="Campo"/>
<#assign propLabelHint_propName="O campo de propriedade a ser exibido aos usuários durante a digitalização. O campo que exige valor é indicado com o texto (Obrigatório) e não pode ser removido."/>
<#assign propLabel_defaultValue="Valor padrão"/>
<#assign propLabelHint_defaultValue="O valor padrão do campo de propriedade."/>

<#assign propLabel_displayOptions="Opções de exibição"/>
<#assign propLabelHint_displayOptions="O modo de exibição do campo de propriedade aos usuários durante a digitalização."/>
<#assign optionLabel_displayOptions_readonly="Somente leitura"/>
<#assign optionLabelHint_displayOptions_readonly="O campo pode ser exibido no momento da digitalização, mas não pode ser editado."/>
<#assign optionLabel_displayOptions_editable="Editável no momento da digitalização"/>
<#assign optionLabelHint_displayOptions_editable="O campo pode ser editado no momento da digitalização."/>
<#assign optionLabel_displayOptions_editablerequired="Editável e exigido no momento da digitalização"/>
<#assign optionLabelHint_displayOptions_editablerequired="O campo pode ser editado e é exigido no momento da digitalização."/>
<#assign optionLabel_displayOptions_hidden="Oculto"/>
<#assign optionLabelHint_displayOptions_hidden="O campo não pode ser exibido nem editado no momento da digitalização."/>

<#assign propLabel_AppendInfo="Acrescentar informações"/>
<#assign propLabelHint_AppendInfo_networkfile="Permite acrescentar informações adicionais ao nome de arquivo."/>
<#assign optionLabelHint_AppendInfo_networkfile_none="Não acrescenta informações adicionais ao nome de arquivo."/>

<#assign propLabelHint_AppendInfo="Permite acrescentar informações adicionais ao valor padrão."/>
<#assign optionLabel_AppendInfo_none="Nenhuma informação adicionada"/>
<#assign optionLabelHint_AppendInfo_none="Não acrescenta informações adicionais ao valor padrão."/>
<#assign optionLabel_AppendInfo_none_folder="ID exclusiva"/>
<#assign optionLabelHint_AppendInfo_none_folder="Adiciona uma cadeia de id exclusiva ao valor padrão. (Apenas digitalizações para pasta de rede)"/>
<#assign optionLabel_AppendInfo_timestamp="Carimbo de data e hora"/>
<#assign optionLabelHint_AppendInfo_timestamp>Adiciona a data e a hora ao valor padrão. Exemplo: <code>ScanDoc-10.22.13</code></#assign>
<#assign optionLabel_AppendInfo_number="Número de incremento"/>
<#assign optionLabelHint_AppendInfo_number>Adiciona um número de incremento automático ao valor padrão. Exemplo: <code>ScanDoc-00312</code></#assign>
<#assign optionLabel_AppendInfo_CurrentYear="Ano atual"/>
<#assign optionLabelHint_AppendInfo_CurrentYear="Adiciona o ano atual ao valor padrão."/>
<#assign optionLabel_AppendInfo_CurrentMonth="Mês atual"/>
<#assign optionLabelHint_AppendInfo_CurrentMonth="Adiciona o mês atual ao valor padrão."/>
<#assign optionLabel_AppendInfo_CurrentDayOfMonth="Dia atual do mês"/>
<#assign optionLabelHint_AppendInfo_CurrentDayOfMonth="Adiciona o dia atual do mês (por exemplo, 20) ao valor padrão."/>
<#assign optionLabel_AppendInfo_CurrentDayOfWeek="Dia atual da semana"/>
<#assign optionLabelHint_AppendInfo_CurrentDayOfWeek="Adiciona o dia atual da semana (por exemplo, segunda-feira) ao valor padrão."/>
<#assign optionLabel_AppendInfo_Username="Nome de usuário"/>
<#assign optionLabelHint_AppendInfo_Username="Adiciona o nome de usuário ao valor padrão."/>
<#assign optionLabel_AppendInfo_Firstname="Nome"/>
<#assign optionLabelHint_AppendInfo_Firstname="Adiciona o nome do usuário conectado ao valor padrão."/>
<#assign optionLabel_AppendInfo_Lastname="Sobrenome"/>
<#assign optionLabelHint_AppendInfo_Lastname="Adiciona o sobrenome do usuário conectado ao valor padrão."/>
<#assign optionLabel_AppendInfo_Fullname="Nome completo"/>
<#assign optionLabelHint_AppendInfo_Fullname="Adiciona o nome completo do usuário conectado ao valor padrão."/>

<#assign propLabel_appendLoc="Localização adicionada"/>
<#assign propLabelHint_appendLoc="Especifica a localização das informações adicionadas."/>
<#assign optionLabel_appendLoc_after="Após o valor padrão"/>
<#assign optionLabelHint_appendLoc_after="Adiciona as informações extras após o valor padrão."/>
<#assign optionLabel_appendLoc_before="Antes do valor padrão"/>
<#assign optionLabelHint_appendLoc_before="Adiciona as informações extras antes do valor padrão."/>

<#assign optionLabel_appendLoc_networkfolder_after="Após o nome de arquivo"/>
<#assign optionLabelHint_appendLoc_networkfolder_after="Adiciona as informações extras após o nome de arquivo."/>
<#assign optionLabel_appendLoc_networkfolder_before="Antes do nome de arquivo"/>
<#assign optionLabelHint_appendLoc_networkfolder_before="Adiciona as informações extras antes do nome de arquivo."/>
<#assign menuAgentLabel = "Usar o menu ODBC:"/>
<#assign menuAgentTip = "Selecione um menu pré-definido cujos valores são recuperados de uma fonte de dados ODBC."/>
<#assign menuAgent_none = "Nenhum atribuído"/>
<#assign odbcMenu_optgrouplabel_simplemenu = "Menus ODBC"/>
<#assign odbcMenu_optgrouplabel_dmsets = "Conjuntos de menus dependentes"/>
<#assign autofillProfile_isMappedField = "Esta propriedade é usada pelo perfil de preenchimento automático selecionado e é preenchida automaticamente quando um ou mais campos exigidos de perfil de preenchimento automático são preenchidos."/>
<#assign autofillProfile_isMappedFieldRequired = "Esta propriedade é usada pelo perfil de preenchimento automático selecionado e é exigida para o preenchimento automático de campos mapeados."/>
<#assign menuAgent_optionsRequestError = "Erro: Erro ao tentar recuperar a lista de opções da fonte de dados."/>

<#assign fieldlist_requiredtag="(Obrigatório)"/>
<#assign btn_addfield="Adicionar campo"/>
<#assign btn_removefield="Remover"/>

<#assign propLabel_accessMethod ="Nível de acesso:"/>
<#assign propLabelHint_accessMethod ="O nível de acesso ao botão: Convidado ou um grupo do DocuShare específico."/>
<#assign optionLabel_accessMethod_guest = "Convidado"/>
<#assign optionLabelHint_accessMethod_guest = "Permite que qualquer pessoa use esse botão."/>
<#assign optionLabel_accessMethod_group = "Grupo do DocuShare"/>
<#assign optionLabelHint_accessMethod_group>Limita o acesso aos botões a usuários que são membros de um grupo específico do DocuShare (por exemplo, <code>Grupo-123</code>).</#assign>

<#assign optionLabel_inherit = "Herdar do pai:"/>
<#assign optionLabelHint_inherit = "Use a configuração de acesso de grupo do botão pai."/>

<#assign optionLabel_specificgroup = "Selecionar grupo:"/>
<#assign optionLabelHint_specificgroup = "Escolha um grupo do DocuShare digitando o título (por exemplo, Marketing)."/>
<#assign fieldnote_usergroup = "Realize uma pesquisa digitando o título de um grupo (por exemplo, Marketing)."/>

<#assign subFolderSection_title = "Configuração de subpasta"/>
<#assign subFolderSection_subtitle = "Especifique como gerar subpastas automaticamente. Selecione as propriedades nos menus abaixo para usar como título de cada subpasta. O título real de cada subpasta é derivado dos valores de propriedade inseridos durante a digitalização."/>

<#assign subFolderCollectionLabel_none = "Escolha uma pasta raiz..."/>
<#assign subFolderOptgroup_label_reqfield = "Propriedades obrigatórias"/>
<#assign subFolderOptgroup_label_optionalfield = "Propriedades opcionais"/>
<#assign subFolderOptgroup_label_userdata = "Propriedades de digitalização do usuário"/>
<#assign subFolderOptgroup_label_datadata = "Propriedades de data"/>
<#assign subFolderSelectOption_label_none = "Nenhum"/>

<#assign subFolderSelectOption_label_day = "Dia atual"/>
<#assign subFolderSelectOption_label_week = "Semana atual"/>
<#assign subFolderSelectOption_label_month = "Mês atual"/>
<#assign subFolderSelectOption_label_year = "Ano atual"/>

<#assign subFolderSelectOption_label_username = "Nome de usuário"/>
<#assign subFolderSelectOption_label_lname = "Sobrenome"/>
<#assign subFolderSelectOption_label_fname = "Nome"/>
<#assign subFolderSelectOption_label_fullname = "Nome completo"/>
<#assign propRequiredbySubFolder ="(Exigido pela configuração da subpasta)"/>

<#assign propRequiredbyAFP = "(Exigido para o preenchimento automático)"/>

<#assign svcbtnicon_label = "Ícone do botão:"/>
<#assign svcbtnicon_hint = "O ícone exibido no botão. Use o ícone padrão ou escolha um ícone diferente."/>
<#assign btn_editicon_label = "Editar ícone..."/>
<#assign btn_customizeicon_label = "Personalizar..."/>
<#assign customizeicon_dialog_title = "Personalizar ícone de botão"/>
<#assign customizeicon_newval_uploadicon = "Carregamento de um novo ícone:"/>
<#assign customizeicon_newval_default = "Usando o ícone padrão:"/>
<#assign customizeicon_newval_useexisting = "Usando um ícone existente:"/>

<#assign editsvcbtndialog_title = "Editar ícone do botão"/>
<#assign editsvcbtndialog_subtitle = "Use o ícone padrão, carregue um arquivo de imagem ou selecione um ícone existente no servidor."/>
<#assign icon_upload_label = "Carregar um novo ícone:"/>
<#assign icon_upload_visiblehint>Selecione qualquer formato de arquivo de imagem que possa ser exibido na Web: <code>.gif</code>,<code>.png</code> ou<code>.jpg</code>. O tamanho máximo é de 128 x 128 pixels.</#assign>
<#assign icon_filetypein_label = "Selecionar um ícone existente:"/>
<#assign icon_resetdefault_label = "Usar o ícone padrão:"/>
<#assign icon_resetdefault_hint = "Usar o ícone do botão padrão."/>
<#assign icon_update_success = "O ícone do botão foi atualizado com êxito."/>
<#assign icon_update_failure = "Erro: Não foi possível atualizar o ícone do botão."/>
<#assign editsvcbtndialog_subtitle_noexistingicons = "Nenhum ícone existente foi encontrado no servidor."/>


<#-- Configure Devices Page -->
<#assign btn_cancelLabel = "Cancelar"/>
<#assign btn_closeTip = "Fechar"/>

<#assign action_viewDeviceLabel="Editar configurações do dispositivo&#8230;"/>
<#assign action_viewDeviceTip="Editar configurações do dispositivo"/>

<#assign action_reassignButtonsFailureMsg="Erro: Os botões de alguns dispositivos não foram reatribuídos."/>
<#assign action_reassignButtonsSuccessMsg="As atribuições de botão dos dispositivos selecionados foram atualizadas com êxito."/>
<#assign action_deleteSingleDeviceLabel="Remover este dispositivo da lista"/>
<#assign action_deleteSingleDeviceTip="Remover dispositivo"/>
<#assign action_deleteSingleDeviceConfirmMsg="Tem certeza de que deseja excluir este dispositivo? Essa ação não poderá ser desfeita."/>
<#assign action_deleteSingleDeviceSuccessMsg="O dispositivo foi excluído com êxito."/>
<#assign action_deleteSingleDeviceFailureMsg="Erro: Não foi possível excluir o dispositivo."/>

<#assign action_deleteMultiDeviceConfirmMsg="Tem certeza de que deseja excluir os dispositivos selecionados? Essa ação não poderá ser desfeita."/>
<#assign action_deleteMultiDeviceSuccessMsg="Os dispositivos selecionados foram excluídos com êxito."/>
<#assign action_deleteMultiDeviceFailureMsg="Erro: Não foi possível excluir os dispositivos selecionados."/>

<#assign configDevices_title = "Configurar dispositivos"/>
<#assign configDevices_subtitle = "Use esta página para configurar as impressoras multifuncionais para uso com o DocuShare Scan Service e para gerenciar os botões atribuídos aos dispositivos."/>
<#assign btn_reassignBtnsLabel = "Atribuir/retirar atribuição de botões aos dispositivos selecionados&#8230;"/>
<#assign btn_reassignBtnsTip = "Atribua/retire a atribuição de botões aos dispositivos selecionados."/>
<#assign btn_deleteSelDevices = "Excluir seleção&#8230;"/>
<#assign btn_registerDevice = "Adicionar novo dispositivo&#8230;"/>
<#assign btn_importDevices = "Importar dispositivos do arquivo CSV&#8230;"/>
<#assign devicetable_cbx_selectAll_tip = "Selecionar/desfazer a seleção de todos os dispositivos."/>
<#assign devicetable_colLabel_name = "Nome do dispositivo"/>
<#assign devicetable_colLabel_address = "Host/Endereço IP"/>
<#assign devicetable_colLabel_buttons = "Botões do Scan Service"/>
<#assign devicetable_colLabel_actions = "Ações"/>
<#assign devicetable_deviceLabel_tip = "Editar configurações do dispositivo"/>
<#assign devicetable_nobuttonsassigned = "Nenhum botão atribuído."/>
<#assign devicetable_emptytablemsg = "Nenhuma impressora multifuncional foi registrada ainda."/>
<#assign devicetable_emptytablemsg_registerlinklabel = "Clique aqui para adicionar um novo dispositivo."/>
<#assign devicetable_deviceBehindFirewallTip = "Este dispositivo está por trás de um firewall"/>
<#assign devicetable_deviceBehindFirewallColHeadingTip = "O dispositivo está por trás de um firewall?"/>

<#assign btn_updateAssignmentsLabel = "Atualizar atribuições"/>
<#assign editSelectedBtns_dialogtitle = "Editar botões do Scan Service nos dispositivos selecionados"/>
<#assign editSelectedBtns_dialogsubtitle = "Atribua/retire a atribuição dos botões do Scan Service dos dispositivos selecionados. Ao fazer isso, a lista dos botões atribuídos no momento de cada dispositivo será substituída. Desmarcar um botão o removerá de todos os dispositivos selecionados."/>
<#assign link_configurebuttons_label="Página Configurar botões" />
<#macro nobuttonsinsystemmsg link>Nenhum botão foi adicionado. Vá para ${link} para adicionar botões.</#macro>

<#assign btn_importCSVLabel = "Importar"/>
<#assign importDialog_title="Importar dispositivos de um arquivo CSV"/>
<#assign importDialog_subtitle="Procure e selecione um arquivo CSV que contenha a lista de impressoras multifuncionais que você deseja adicionar com o DocuShare Scan Service."/>
<#assign importCSV_error="Erro ao importar o arquivo CSV."/>

<#assign failedBtnReassignDialogTitle = "Falha em reatribuições de botões"/>
<#assign failedBtnReassignDialogSubtitle = "Erro ao tentar atualizar as atribuições de botões nos seguintes dispositivos:"/>
<#assign failedBtnReassignDialog_idcolLabel = "ID"/>


<#-- Edit / Add Device Page -->
<#assign editDevicePage_title="Editar configurações do dispositivo:"/>
<#assign editDevicePage_subtitle1="Altere as informações do dispositivo."/>
<#assign editDevicePage_subtitle2="Altere os botões do DocuShare Scan Service atribuídos ao dispositivo."/>

<#assign addDevicePage_title="Adicionar um novo dispositivo"/>
<#assign addDevicePage_subtitle1="Insira as informações do dispositivo."/>
<#assign addDevicePage_subtitle2="Atribua botões do Scan Service ao dispositivo."/>

<#assign addDevice_successMsg="O novo dispositivo foi registrado."/>
<#assign addDevice_errorMsg="Erro: Não foi possível registrar o dispositivo."/>
<#assign editDevice_successMsg="Configurações do dispositivo atualizadas"/>
<#assign editDevice_errorMsg="Erro: Não foi possível salvar as atualizações do dispositivo."/>

<#assign deviceLabel_label="Rótulo do dispositivo:"/>
<#assign deviceLabel_tip="O nome amigável da impressora multifuncional da Xerox."/>

<#assign deviceAddress_label="Nome de host/ IP do dispositivo:"/>
<#assign deviceAddress_tip="O endereço de rede (endereço IP ou nome de host DNS) da impressora multifuncional da Xerox."/>

<#assign deviceUsername_label="Nome de usuário do dispositivo:"/>
<#assign deviceUsername_tip="O nome de usuário do administrador da impressora multifuncional da Xerox."/>

<#assign devicePassword_label="Senha do dispositivo:"/>
<#assign devicePassword_tip="A senha do administrador da impressora multifuncional da Xerox."/>

<#assign deviceBehindFirewall_label="Dispositivo atrás de Firewall?"/>
<#assign deviceBehindFirewall_tip="Verifique se o dispositivo está por trás de um firewall corporativo e os servidores do Scan Service e do DocuShare estão fora do firewall."/>

<#assign serviceBtnSectionTitle="Botões do Scan Service"/>

<#assign advancedBtn="Mostrar configurações avançadas &#8250;"/>
<#assign advancedBtn_hide="&#8249; Ocultar configurações avançadas"/>
<#assign server_ip_label="Alternar nome do host/IP do servidor do Scan Service:"/>
<#assign server_ip_tip="Se a impressora multifuncional não puder estabelecer conexão com o nome do host/IP do servidor padrão do Scan Service (possivelmente por estar conectada via túnel VPN com endereço NAT), insira um nome do host/IP alternativo."/>
<#assign server_defaultNameLabel="Nome do host/IP do servidor do Scan Service padrão:"/>
<#assign defaultServerTxt="(Padrão)"/>

<#assign editDevicePage_btn_applyLabel="Aplicar"/>
<#assign editDevicePage_btn_addLabel="Adicionar"/>
<#assign editDevicePage_btn_deleteButtonLabel="Excluir dispositivo"/>
<#assign editDevicePage_link_returnToDeviceListLabel="&#8592; Voltar para a página Lista de dispositivos"/>


<#--Scanning Log Page -->
<#assign scanningLog_title ="Log de digitalização"/>
<#assign scanningLog_subtitle ="Use esta página para exibir a atividade recente de digitalização e baixar o log de todos os trabalhos de digitalização."/>
<#assign scanningLog_retrieveErrorMsg="Erro: Não foi possível recuperar o log de digitalização."/>
<#assign btn_downloadLogLabel = "Baixar log de digitalização como arquivo CSV&#8230;"/>

<#assign logTable_colLabel_date="Data da digitalização"/>
<#assign logTable_colLabel_destination="Destino da digitalização"/>
<#assign logTable_colLabel_device="Dispositivo de digitalização"/>
<#assign logTable_colLabel_button="Botão"/>
<#assign logTable_colLabel_username="Nome de usuário"/>
<#assign logTable_colLabel_status="Status"/>

<#assign logLoadingMsg="Carregando log de digitalização&#8230;"/>
<#assign logEmptyMsg="O log de digitalização está vazio."/>
<#assign logpagesize_label = "Tamanho da página:"/>
<#assign logpagesize_help = "O número máximo de trabalhos de digitalização a serem exibidos por página."/>
<#assign logfilesize_label = "Tamanho do log:"/>
<#assign logfilesize_help = "O número máximo de trabalhos de digitalização a serem armazenados em um único arquivo de log. Altere essa definição ao configurar o DocuShare Scan Service pela primeira vez."/>
<#assign btn_updateLogfilesize_label = "Atualizar"/>
<#assign updateLogFileSize_error = "Erro ao atualizar o tamanho do arquivo de log de digitalização."/>
<#assign updateLogFileSize_success = "O tamanho do arquivo de log de digitalização foi atualizado com êxito."/>
<#assign status_succeeded = "Êxito"/>
<#assign status_failed = "Falha"/>

<#-- Server Log Page -->
<#assign serverLogPage_title = "Log do servidor"/>
<#assign serverLogPage_subtitle = "Use esta página para alterar o nível de registro em log do servidor e baixar o log do servidor."/>
<#assign loglevel_label="Nível de registro em log"/>
<#assign logLevel_tip="O tipo de informação de registro em log que você deseja que o servidor registre. Os níveis de registro em log estão listados em ordem decrescente de gravidade, com as informações registradas iguais ou mais graves que o nível de registro em log selecionado. Por exemplo, o nível RASTREAMENTO registra informações de todos os níveis, enquanto AVISO registra apenas informações de AVISO, ERRO e FATAL."/>
<#assign btn_logDownloadLabel="Baixar arquivo de log&#8230;"/>

<#-- Email Service Page -->
<#assign EmailServicePage_title = "Configuração de email"/>
<#assign EmailServicePage_subtitle = "Use esta página para configurar um servidor de email para habilitar a adição de botões de digitalizar para email."/>
<#assign EmailSetup_serverSectionLabel = "Configurações de servidor de envio de email"/>
<#assign EmailSetup_servernameLabel = "Nome/endereço do servidor:"/>
<#assign EmailSetup_servernameTip = "O nome de domínio ou endereço IP do servidor de email."/>
<#assign EmailSetup_protocolLabel = "Protocolo:"/>
<#assign EmailSetup_protocolTip = "O protocolo do servidor de envio de email. Os valores são SMTP (padrão), SMTP-TLS, SMTP-SSL."/>
<#assign EmailSetup_portLabel = "Porta:"/>
<#assign EmailSetup_portTip = "O número da porta do servidor de envio de email. O padrão para cada protocolo é SMTP:25, SMTP-TLS:250, SMTP-SSL:2500."/>
<#assign EmailSetup_emailUsernameLabel = "Nome de usuário:"/>
<#assign EmailSetup_emailUsernameTip = "O nome de usuário da conta autorizada para enviar email por meio do servidor de envio de email."/>
<#assign EmailSetup_passwordLabel = "Senha:"/>
<#assign EmailSetup_passwordTip = "A senha para a conta de usuário especificada."/>
<#assign EmailSetup_messageSectionLabel = "Configurações de mensagem de digitalizar para email"/>
<#assign EmailSetup_defaultFromAddressLabel = "Endereço “De:” padrão:"/>
<#assign EmailSetup_defaultFromAddressTip = "O endereço de email exibido no campo De para todos os emails enviados pelo DocuShare Scan Service."/>
<#assign EmailSetup_defaultFromAddressExample = "Exemplo: scan-services-scan@mycompany.com"/>
<#assign EmailSetup_subjectLabel = "Assunto de email padrão:"/>
<#assign EmailSetup_subjectTip = "A linha de assunto padrão de todos os emails enviados pelo DocuShare Scan Service se um botão não especificar um assunto."/>
<#assign EmailSetup_subjectExample = "Exemplo: Nova digitalização de documento do DocuShare Scan Service"/>
<#assign EmailSetup_bodyLabel = "Corpo do email:"/>
<#assign EmailSetup_bodyTip = "O corpo do email de todos os emails enviados pelo DocuShare Scan Service."/>
<#assign EmailSetup_bodyExample = "Exemplo: &ldquo;Um novo documento digitalizado do DocuShare Scan Service foi enviado a você&rdquo;"/>
<#assign EmailSetup_isHTML_label = "Usar HTML para corpo:"/>
<#assign EmailSetup_isHTML_tip = "Marque para permitir o uso de tags HTML no corpo do email."/>
<#assign EmailSetup_advancedSectionLabel = "Configurações avançadas"/>
<#assign EmailSetup_timeoutLabel = "Tempo de espera:"/>
<#assign EmailSetup_timeoutTip = "O tempo, em milissegundos, para cessar as tentativas de envio de email ou de estabelecimento de conexão com o servidor. O padrão é 30.000 ms."/>
<#assign EmailSetup_sslcertkeystoreLabel = "Arquivo keystore de certificado SSL:"/>
<#assign EmailSetup_sslcertkeystoreTip = "A localização do arquivo keystore SSL no sistema de arquivos do servidor. Esse arquivo é necessário se o protocolo do servidor de email está configurado como SMTP-SSL ou SMTP-TLS. Ele pode não ser exigido para algumas contas de servidor, como Google ou Yahoo, que têm domínios confiáveis e registrados no armazenamento confiável Java."/>
<#assign EmailSetup_sslcertkeystorePassLabel = "Senha de arquivo keystore de certificado SSL:"/>
<#assign EmailSetup_sslcertkeystorePassTip = "Senha para o arquivo keystore."/>
<#assign EmailServicePage_formsubmit_success = "As configurações de email foram salvas com êxito."/>
<#assign EmailServicePage_formsubmit_error = "Erro ao tentar salvar as configurações de email."/>

<#assign EmailServicePage_SendTestEmail_btnLabel = "Enviar email de teste..."/>
<#assign EmailSetup_testConnectionWait = "Enviando email. Aguarde..."/>
<#assign EmailSetup_testConnectionFailure = "Erro: Erro ao estabelecer conexão com o servidor de email. Verifique as configurações e tente novamente."/>
<#assign EmailSetup_testConnectionSuccess = "O email foi enviado com êxito pelo servidor. Verifique a caixa de entrada de email de teste para ver se a mensagem chegou com êxito. Se sim, clique em Aplicar caso tenha feito alterações nas configurações."/>
<#assign EmailSetup_testConnection_dialog_title ="Enviar um email de teste"/>
<#assign EmailSetup_testConnection_dialog_subtitle ="Teste suas configurações enviando um email."/>
<#assign EmailSetup_testConnection_emaillabel ="Email de teste:"/>
<#assign EmailSetup_testConnection_emailtip ="O endereço de email de destino a ser usado para testar suas configurações."/>

<#-- Server Setup Page -->
<#assign ServerSetupPage_title = "Configuração do servidor"/>
<#assign ServerSetupPage_subtitle = "Use esta página para configurar o servidor a ser usado com o DocuShare Scan Service."/>
<#assign ServerSetupPage_subtitle2 = "Se você precisa alterar qualquer uma das configurações do servidor depois de os dispositivos estarem registrados, recomenda-se que remova os botões atribuídos aos dispositivos antes de fazer as alterações."/>
<#assign ServerSetupPage_subtitle3 = "É possível alterar a senha do firewall a qualquer momento sem ter que registrar novamente os dispositivos."/>
<#assign ServerSetup_nameLabel = "Nome/endereço do servidor:"/>
<#assign ServerSetup_nameTip = "O nome de domínio ou endereço IP do servidor."/>
<#assign ServerSetup_protocolLabel = "Protocolo:"/>
<#assign ServerSetup_prototolTip = "O protocolo de transferência (por exemplo: http, https)."/>
<#assign ServerSetup_portLabel = "Porta:"/>
<#assign ServerSetup_portTip = "A porta do servidor (por exemplo: 8000)."/>
<#assign ServerSetup_passwordLabel = "Senha do utilitário de atualização de dispositivo:"/>
<#assign ServerSetup_passwordTip = "A senha necessária para acessar o utilitário de atualização usado para reconfigurar dispositivos. Forneça essa senha para a pessoa autorizada a administrar as MFPs para que os dispositivos possam ser habilitados para uso com o firewall."/>
<#assign ServerSetup_domainLabel = "Domínio do DocuShare:"/>
<#assign ServerSetup_domainTip = "O domínio de usuário/grupo no DocuShare."/>
<#assign ServerSetup_firewallPasscodeSubtitle = "Para habilitar dispositivos protegidos por um firewall para se conectarem a um servidor do DocuShare Scan Service, os dispositivos deverão ser configurados usando o Utilitário de atualização de dispositivo. Forneça a URL de download e a Senha do utilitário de atualização de dispositivo à pessoa autorizada a administrar os dispositivos protegidos pelo firewall. A senha é necessária para acessar o utilitário de atualização. Se você alterar as configurações do servidor ou registrar/desfazer o registro de um dispositivo que está por trás de um firewall, será necessário fornecer a URL de download e a Senha do utilitário de atualização de dispositivo novamente para que o utilitário possa ser executado novamente. <p>Antes de fornecer o utilitário, certifique-se de ter registrado pelo menos um dispositivo por trás do firewall e de ter atribuído um botão a ele. Caso contrário, a pessoa autorizada a administrar os dispositivos não conseguirá acessar o utilitário.</p>"/>
<#assign ServerSetup_registerDeviceBehindFirewallURLLabel = "URL de download do utilitário de atualização de dispositivo:"/>
<#assign ServerSetup_registerDeviceBehindFirewallURLTip = "A localização da página da Web da qual a pessoa que está autorizada a administrar as MFPs faz download de um arquivo do utilitário de execução automática para configurar os dispositivos."/>
<#assign ServerSetup_registerDeviceBehindFirewallURLEndNote = "Copie esta URL selecionando-a e pressionando Ctrl-C (Cmd-C no Mac) e inclua a URL em um email."/>
<#macro devicesRegisteredEditWarning deviceNum> <strong>Nota:</strong> ${deviceNum} dispositivo(s) já foram registrados usando essas configurações. Se você alterar as configurações, a conexão desses dispositivos com o servidor do DocuShare Scan Service deixará de existir. Primeiro, desfaça a atribuição dos botões para cada dispositivo e volte a esta página para alterar as configurações do servidor.</#macro>
<#assign editServerSettingsWhileRegisteredBtnLabel = "Editar mesmo assim"/>
<#assign ServerSetup_ServerSettingsSectionLabel = "Configurações de servidor"/>
<#assign ServerSetup_FirewallPasscodeSectionLabel = "Configurações de firewall"/>
<#assign ServerSetup_formsubmit_success = "As configurações de servidor foram salvas com êxito."/>
<#assign ServerSetup_formsubmit_error = "Erro ao tentar salvar suas configurações de servidor."/>

<#assign ServerSetup_buttonSettings = "Configurações do botão de digitalização"/>
<#assign ServerSetup_dateFormatLabel = "Formato de data"/>
<#assign ServerSetup_dateFormatHelp = "O formato de data a ser usado quando os botões de digitalização contêm um campo de propriedade de data. A configuração do formato de data não é usada para as propriedades de cadeia."/>
<#assign ServerSetup_dateFormatMonthFirst = "mm/dd/aaaa"/>
<#assign ServerSetup_dateFormatDayFirst = "dd/mm/aaaa"/>
<#assign ServerSetup_dateFormatYearFirst = "aaaa-mm-dd"/>
<#assign ServerSetup_dateFormatYearFirst2 = "aaaammdd"/>

<#assign ServerSetup_xeroxAppGallery = "Xerox&#174; App Gallery"/>
<#assign ServerSetup_xeroxAppGallerySubtitle = "A Xerox&#174; App Gallery fornece aplicativos do DocuShare Scan Service para estender as funcionalidades das MFPs habilitadas para o DocuShare Scan Service. O Xerox&#174; Scanning App for DocuShare permite que os usuários do DocuShare digitalizem documentos para as suas pastas pessoais. <p>Habilitar o uso do aplicativo adiciona um botão do DocuShare Scan Service chamado Digitalizar para aplicativo DocuShare e um botão de digitalização para Pasta pessoal à página Lista de botões. Desabilitar o aplicativo removerá os botões da página. Se o aplicativo for usado em uma MFP que você não configurou, será usada uma das suas conexões de MFP licenciadas.</p>"/>
<#assign ServerSetup_xeroxAppGalleryEnable = "Habilitar o Scanning App for DocuShare"/>
<#assign ServerSetup_xeroxAppGalleryEnableHelp = "Marque para permitir o uso do aplicativo DocuShare Scan Service, que permite aos usuários do DocuShare digitalizarem documentos para as suas pastas pessoais."/>

<#-- Common dbAgent Page Messages. -->
<#assign dsConnectionProgress="Estabelecendo conexão. Aguarde&hellip;"/>
<#assign dsProperty_noMapping = "Nenhum"/>
<#assign dsWizard_next = "Seguinte &#8250;"/>
<#assign dsWizard_back = "&#8249; Anterior"/>
<#assign dbsmPage_delete_btn_label = "Excluir menu"/>
<#assign dbsmPage_apply_btn_label = "Aplicar"/>
<#assign dbsmPage_return_to_listing_page = "&#8592; Voltar para a página Lista de menus ODBC"/>
<#assign dataSourceTable_col_actions = "Ações" />
<#assign dataSourceTable_action_Edit_label = "Editar"/>
<#assign dataSourceTable_action_Delete_label = "Excluir"/>
<#assign dsAssignedButtons = "Botões atribuídos:" />
<#assign dsAssignedDMS = "Conjuntos de menus dependentes atribuídos:" />
<#assign dsColumnLookupError = "Falha ao carregar as colunas da fonte de dados."/>
<#assign dsConnectionError = "Falha ao estabelecer conexão com a fonte de dados. Verifique as configurações de conexão e tente novamente."/>
<#assign dsObjPropsRequiredLookupError = "Não foi possível carregar propriedades opcionais para o tipo de documento selecionado."/>
<#assign dsObjPropsOptionalLookupError = "Não foi possível carregar propriedades exigidas para o tipo de documento selecionado."/>
<#assign dbsmNoIllegalCharsError = "Os caracteres a seguir não são permitidos:"/>
<#assign datasource_prop_mapping_restricted = "Por que não consigo editar isto?"/>
<#assign datasource_prop_mapping_restricted_delete = "Por que não consigo excluir?"/>
<#assign datasource_restricted_modify = "Por que não consigo aplicar ou excluir?"/>

<#-- Autofill Profiles Listing Page -->
<#assign AutoFillProfilePage_title = "Perfis de preenchimento automático"/>
<#assign AutoFillProfilePage_subtitle = "Use esta página para adicionar perfis de preenchimento automático para os tipos de documentos. Ao usar um perfil de preenchimento automático com um botão de digitalização, valores de propriedade adicionais serão armazenados com os documentos digitalizados com base nos valores de propriedade que os usuários inseriram na tela de toque da MFP."/>
<#assign btnLabel_AddAutofillProfile = "Adicionar perfil de preenchimento automático..."/>
<#assign btnLabel_DeleteSelAutofillProfiles = "Excluir seleção"/>
<#assign autofillTable_col_name = "Nome do perfil" />
<#assign autofillTable_col_datasource = "Tipo e localização de ODBC" />
<#assign autofillTable_col_mapping = "Coluna &rarr; Mapeamento de propriedade"/>
<#assign autofillTable_col_tablename = "Tabela/planilha" />
<#assign autofillTable_col_doctype = "Tipo de documento" />
<#assign autofillTable_col_actions = "Ações" />
<#assign autofillTable_col_buttonsUsing = "Atribuições de botão de digitalização"/>
<#assign action_deleteAFPConfirmMsg = "Tem certeza de que deseja excluir os perfis selecionados?" />
<#assign action_deleteAFPSuccessMsg = "Perfis excluídos com êxito." />
<#assign action_deleteAFPFailureMsg = "Erro ao excluir os perfis selecionados." />
<#assign action_deleteAFPMappedFailureMsg = "Erro: Não foi possível excluir um ou mais dos perfis selecionados porque eles estão sendo usados atualmente em botões de digitalização." />
<#assign useforAutofillTip = "Use este campo de propriedade para o preenchimento automático de todos os outros campos mapeados."/>
<#assign autofillTable_noAssignedButtons = "Nenhum"/>
<#assign autofillTable_noProfiles = "Nenhum perfil de preenchimento automático foi configurado. Clique no botão “Adicionar perfil de preenchimento automático” acima para criar um perfil novo."/>
<#assign autofillTable_action_DeleteDisabled = "Não é possível excluir esse perfil de preenchimento automático porque ele é usado por um ou mais botões de digitalização. Remova seu uso em cada página de edição de configurações de botão antes de excluí-lo."/>

<#-- Autofill Profile Add/Edit Page -->
<#assign AutoFillProfilePage_add_title = "Adicionar perfil de preenchimento automático" />
<#assign AutoFillProfilePage_add_subtitle = "Para adicionar um perfil de preenchimento automático, primeiro é preciso definir a conexão ODBC e depois mapear as propriedades do documento do DocuShare para colunas de tabela. " />
<#assign AutoFillProfilePage_edit_title = "Editar perfil de preenchimento automático:" />
<#assign AutoFillProfilePage_edit_subtitle = "Altere qualquer uma das configurações do perfil de preenchimento automático." />
<#assign AutoFillProfilePage_mappedBtnWarning = "<strong>Nota:</strong> Este perfil é usado por um ou mais botões de digitalização, portanto ele não pode ser alterado nem excluído. Remova seu uso em cada página de edição de configurações de botão antes de alterá-lo ou excluí-lo."/>

<#assign afp_name_label = "Nome do perfil:" />
<#assign afp_name_tip = "Um nome exclusivo para o perfil de preenchimento automático." />
<#assign afp_name_fielderror_duplicatename="Este nome já está sendo usado. Insira outro nome."/>
<#assign afp_dsconn_heading ="Etapa 1 de 2: Configurar a conexão ODBC"/>
<#assign afp_dsconn_subheading ="Insira as informações de conexão da fonte de dados."/>
<#assign afp_datasource_label = "Tipo ODBC:" />
<#assign afp_datasource_tip = "O tipo da fonte de dados." />
<#assign afp_dbname_label = "Nome ODBC/ Localização do arquivo:" />
<#assign afp_dbname_tip = "Especifique o nome do banco de dados, se estiver usando um banco de dados com base em servidor, ou a localização do arquivo, se apontando para um arquivo de banco de dados no sistema de arquivos ou em um arquivo de planilha do Microsoft Excel." />
<#assign afp_username_label = "Nome de usuário:" />
<#assign afp_username_tip = "O nome de usuário do banco de dados." />
<#assign afp_password_label = "Senha:" />
<#assign afp_password_tip = "A senha do nome de usuário do banco de dados." />
<#assign afp_host_label = "Host:" />
<#assign afp_host_tip = "O endereço IP ou DNS do banco de dados." />
<#assign afp_port_label = "Porta:" />
<#assign afp_port_tip = "O número da porta do banco de dados." />
<#assign afp_table_label = "Nome de tabela/planilha:" />
<#assign afp_table_tip = "Especifica um nome de tabela de banco de dados ou um nome de planilha do Microsoft Excel." />
<#assign afp_doctype_label = "Tipo de documento:" />
<#assign afp_doctype_tip = "Tipo de documento DocuShare." />

<#assign afp_return_to_listing_page = "&#8592; Voltar para a página da lista de perfis de preenchimento automático"/>
<#assign afp_delete_profile_btn_label = "Excluir perfil"/>
<#assign afp_dbsettings_heading = "Configurações ODBC"/>

<#assign afp_mapping_heading = "Etapa 2 de 2: Mapear propriedades do documento do DocuShare para colunas de tabela"/>
<#assign afp_mapping_subheading = "Mapeie as colunas da tabela de fonte de dados especificada para as propriedades do tipo de documento selecionado. Quando os usuários digitalizarem documentos no dispositivo e inserirem valores para as propriedades marcadas como “Exigido para preenchimento automático”, todas as outras propriedades mapeadas serão preenchidas automaticamente com os valores corretos da fonte de dados ODBC atribuída. Nota: Para adicionar ou salvar um perfil, é preciso ter no mínimo um campo exigido mapeado (“Exigido para preenchimento automático”) e um campo mapeado opcional."/>
<#assign afp_mapping_table_colhead_name = "Nome da coluna"/>
<#assign afp_mapping_table_colhead_dsprop = "Propriedade do DocuShare"/>
<#assign afp_mapping_table_colhead_primary = "Exigido para preenchimento automático"/>
<#assign afp_mapping_table_colhead_primary_tip = "Selecione os campos que terão de conter um valor para que os outros campos mapeados sejam preenchidos automaticamente."/>
<#assign afp_mapping_table_notsetup = "Selecione uma tabela/planilha de fonte de dados e um tipo de documento DocuShare para configurar o mapeamento de propriedades para o recurso de preenchimento automático."/>

<#assign afp_mapping_property_requiredFields = "Campos obrigatórios"/>
<#assign afp_mapping_property_optionalFields = "Campos opcionais"/>
<#assign afp_edit_successMsg = "O perfil de preenchimento automático foi atualizado com êxito."/>
<#assign afp_edit_failureMsg = "Erro: Erro ao atualizar o perfil de preenchimento automático."/>
<#assign afp_add_successMsg = "Um perfil de preenchimento automático foi adicionado com êxito."/>
<#assign afp_add_failureMsg = "Erro: Erro ao adicionar o perfil de preenchimento automático."/>
<#assign action_deleteSingleAFPConfirmMsg = "Tem certeza de que deseja excluir este perfil de preenchimento automático? Essa ação não poderá ser desfeita."/>
<#assign action_deleteSingleAFPSuccessMsg = "O perfil de preenchimento automático foi excluído com êxito."/>
<#assign action_deleteSingleAFPFailureMsg = "Erro: Erro ao excluir o perfil de preenchimento automático."/>
<#assign noAutofillCbxError = "Selecione no mínimo uma caixa de seleção “Exigido para preenchimento automático”."/>
<#assign twoMappedFieldMinimumError = "Para adicionar ou salvar um perfil, é preciso ter no mínimo um campo exigido mapeado (“Exigido para preenchimento automático”) e um campo mapeado opcional."/>
<#assign afp_EditDisabled = "Não é possível excluir nem alterar esse perfil de preenchimento automático porque ele é usado por um ou mais botões de digitalização. Remova seu uso em cada página de edição de configurações de botão antes de excluí-lo ou alterá-lo. Consulte a lista de botões de digitalização atribuídos."/>



<#-- Simple Datasource Menus Listing Page -->
<#assign DatasourceMenuPage_title = "Menus ODBC" />
<#assign DatasourceMenuPage_subtitle = "Use esta página para adicionar menus ODBC. Adicione um menu ODBC para recuperar valores de uma fonte de dados usada em um menu atribuído a uma propriedade do documento do DocuShare." />
<#assign btnLabel_AddDatasourceMenu = "Adicionar menu ODBC..."/>
<#assign btnLabel_DeleteSelDataSourceMenus = "Excluir seleção"/>
<#assign dataSourceTable_col_menuname = "Nome" />
<#assign dataSourceTable_col_type = "Tipo" />
<#assign dataSourceTable_col_datasource = "Tipo e localização de ODBC" />
<#assign dataSourceTable_col_tablesource = "Rótulo do menu e fonte de valor (tabela/coluna)"/>
<#assign dataSourceTable_col_tablesource_label = "Rótulo:"/>
<#assign dataSourceTable_col_tablesource_value = "Valor:"/>
<#assign dataSourceTable_col_property = "Atribuído à propriedade DocuShare (tipo/propriedade de documento)" />
<#assign dataSourceTable_col_dms = "Atribuições de conjunto de menus dependentes">
<#assign dataSourceTable_type_dsMenuTip = "Menu ODBC simples">
<#assign dataSourceTable_empty = "Nenhum menu ODBC foi configurado. Clique no botão “Adicionar menu ODBC...” acima para criar um menu novo."/>

<#assign dsm_deleteaction_mappedbtn_msg="Este menu ODBC é usado por um ou mais <strong>botões de digitalização</strong>. Remova seu uso em cada página de edição de configurações de botão antes de excluí-lo."/>
<#assign dsm_deleteaction_dm_msg="Este menu ODBC é usado por um ou mais <strong>conjuntos de menus dependentes</strong>. Remova seu uso em cada conjunto de menus dependentes antes de excluí-lo."/>
<#assign dsm_deleteaction_mappedbtnanddm_msg="Este menu ODBC é usado por um ou mais <strong>conjuntos de menus dependentes</strong> e <strong>botões de digitalização</strong>. Excluir o menu fará com que todos os botões de digitalização atribuídos ou os conjuntos de menus dependentes deixem de funcionar. Remova seu uso em cada conjunto de menus dependentes e botão de digitalização atribuído antes de excluí-lo."/>
<#assign dbsmPage_mappingDisabledPropTip = "Este menu ODBC é usado por um ou mais botões de digitalização atribuídos. Editar o menu fará com que todos os botões de digitalização atribuídos deixem de funcionar. Remova seu uso em cada botão de digitalização atribuído antes de editar esta propriedade."/>

<#-- ODBC Menu Add/Edit Page -->
<#assign dbsmPage_add_title = "Adicionar menu ODBC" />
<#assign dbsmPage_add_subtitle = "Para adicionar um menu ODBC, é preciso primeiro configurar a conexão ODBC e depois atribuir o menu ODBC a uma propriedade de documento DocuShare." />
<#assign dbsmPage_edit_title = "Editar menu ODBC:" />

<#assign dbsmPage_mappedBtnWarning = "Este menu ODBC é usado por um ou mais <strong>botões de digitalização</strong>, portanto os valores das propriedades atribuídas Tipo de documento e DocuShare (exibidos na etapa 2) não podem ser editados. Primeiro remova seu uso nos botões atribuídos (exibidos na lista de atribuição) e depois volte aqui para editar as propriedades ou para excluir o menu."/>
<#assign dbsmPage_mappedDMSWarning = "Este menu ODBC é usado por um ou mais <strong>conjuntos de menus dependentes</strong>, portanto suas configurações não podem ser alteradas. Primeiro, remova seu uso nos conjuntos de menus dependentes atribuídos e depois volte aqui para fazer alterações."/>
  <#assign dbsmPage_mappedBtnAndDMSWarning = "Este menu ODBC é usado por um ou mais <strong>conjuntos de menus dependentes</strong> e <strong>botões de digitalização</strong>. Se este menu for usado em conjuntos de menus dependentes, suas configurações não poderão ser alteradas. Primeiro, remova seu uso nos conjuntos de menus dependentes atribuídos e depois volte aqui para fazer alterações. Se este menu for atribuído a um botão de digitalização, os valores das propriedades Tipo de documento e DocuShare (exibidos na etapa 2) não poderão ser alterados."/>

<#assign dbsmPage_edit_subtitle = "Altere qualquer configuração do menu ODBC." />
<#assign dbsm_name_label = "Nome do menu:"/>
<#assign dbsm_name_tip = "Um nome exclusivo para o menu ODBC."/>
<#assign dbsm_name_fielderror_duplicatedtitle="Existe outro menu ODBC com este nome. Insira um nome exclusivo."/>
<#assign dbsm_property_label = "Propriedade DocuShare:"/>
<#assign dbsm_property_tip = "A propriedade DocuShare a ser usada para o menu com opções dos dados ODBC."/>
<#assign dbsm_columnforlabel_label = "Coluna para rótulo do menu:"/>
<#assign dbsm_columnforlabel_tip = "A coluna de fonte de dados a ser usada para a lista de rótulos de opção do menu. Por padrão, isso é configurado para a mesma coluna atribuída ao valor de menu."/>
<#assign dbsm_columnforvalue_label = "Coluna para o valor de menu:"/>
<#assign dbsm_columnforvalue_tip = "A coluna de fonte de dados a ser usada para a lista de valores de opção de menu."/>
<#assign dbsmPage_mapping_title = "Etapa 2 de 2: Atribuir o menu ODBC a uma propriedade DocuShare"/>
<#assign dbsmPage_mapping_subtitle = "Escolha uma tabela/planilha e uma coluna da fonte de dados selecionada para ser usada como valores para um menu ODBC. Como opção, é possível selecionar uma coluna que será usada como um rótulo de item de menu. Depois, selecione um tipo de documento DocuShare e uma de suas propriedades para serem usados para o menu cujas opções serão preenchidas no momento da digitalização."/>

<#assign dbsmPage_prop_mappingdisabledwarningtp = ""/>

<#assign dbsmPage_edit_successMsg = "O menu ODBC foi atualizado com êxito."/>
<#assign dbsmPage_edit_failureMsg = "Erro: Erro ao atualizar o menu ODBC."/>
<#assign dbsmPage_add_successMsg = "Um menu ODBC foi adicionado com êxito."/>
<#assign dbsmPage_add_failureMsg = "Erro: Erro ao adicionar o menu ODBC."/>

<#assign action_deleteDSMenuConfirmMsg = "Tem certeza de que deseja excluir os menus ODBC selecionados? Essa ação não poderá ser desfeita."/>
<#assign action_deleteDSMenuSuccessMsg = "Você excluiu com êxito os menus ODBC selecionados."/>
<#assign action_deleteDSMenuFailureMsg = "Erro: Erro ao excluir os menus ODBC selecionados."/>
<#assign action_deleteDSMenuMappedFailureMsg = "Erro: Um ou mais dos menus ODBC selecionados são usados por botões de digitalização ou conjuntos de menus dependentes e não podem ser excluídos."/>

<#assign action_deleteSingleDSMenuConfirmMsg = "Tem certeza de que deseja excluir este menu ODBC? Essa ação não poderá ser desfeita."/>
<#assign action_deleteSingleDSMenuSuccessMsg = "O menu ODBC foi excluído com êxito."/>
<#assign action_deleteSingleDSMenuFailureMsg = "Erro: Erro ao excluir o menu ODBC."/>


<#-- ODBC Dependent Menu Set Listing Page -->
<#assign dmsPage_title = "Conjuntos de menus dependentes ODBC" />
<#assign dmsPage_subtitle = "Use esta página para adicionar um conjunto de menus dependentes ODBC ao criar um link com um ou mais menus ODBC predefinidos." />
<#assign dmsPage_addBtn = "Adicionar conjunto de menus dependentes ODBC..."/>
<#assign dmsPage_deleteSelectedBtn = "Excluir seleção"/>

<#assign dmsPage_action_deleteConfirmMsg_multi = "Tem certeza de que deseja excluir os conjuntos de menus dependentes ODBC selecionados?" />
<#assign dmsPage_action_deleteSuccessMsg_multi = "Os conjuntos de menus dependentes ODBC selecionados foram excluídos com êxito." />
<#assign dmsPage_action_deleteFailureMsg_multi = "Erro ao excluir os conjuntos de menus dependentes ODBC selecionados." />
<#assign dmsPage_action_deleteFailureMappingMsg_multi = "Erro: Um ou mais dos conjuntos selecionados estão sendo usados em botões de digitalização e não podem ser excluídos." />
<#assign dmsPage_action_deleteConfirmMsg_single = "Tem certeza de que deseja excluir o conjunto de menus dependentes ODBC?" />
<#assign dmsPage_action_deleteSuccessMsg_single= "O conjunto de menus dependentes ODBC selecionado foi excluído com êxito." />
<#assign dmsPage_action_deleteFailureMsg_single = "Erro ao excluir o conjunto de menus dependentes ODBC selecionado." />

<#assign dmsPage_table_empty = "Nenhum conjunto de menus dependentes ODBC foi definido. Clique no botão “Adicionar conjunto de menus dependentes ODBC” acima para criar um menu novo.">
<#assign dmsPage_table_iconTip = "Conjunto de menus dependentes ODBC">
<#assign dmsPage_table_col_name = "Nome do conjunto de menu">
<#assign dmsPage_table_col_menus = "Menus usados">
<#assign dmsPage_table_col_btnsassigned = "Botões usados">
<#assign dmsPage_table_col_actions = "Ações">
<#assign dmsPage_table_col_action_DeleteDisabled = "Não é possível excluir este conjunto de menus dependentes porque ele está sendo usado por um ou mais botões de digitalização. Remova seu uso na página de edição de configurações de botão para cada botão antes de excluí-lo."/>


<#-- ODBC Dependent Menu Set Add/Edit Page -->
<#assign dmPage_add_title = "Adicionar conjunto de menus dependentes ODBC"/>
<#assign dmPage_add_subtitle = "Selecione uma série de menus ODBC existentes que são dependentes uns dos outros por conta de seus valores. Selecione um menu primário e depois escolha um ou mais menus dependentes. Mapeie o rótulo de cada opção de menu para um valor da coluna da tabela de fonte de dados para vincular seu menu dependente."/>
<#assign dmPage_edit_title = "Editar conjunto de menus dependentes ODBC:"/>
<#assign dmPage_edit_subtitle = "Altere qualquer configuração do conjunto de menus dependentes ODBC."/>
<#assign dmPage_mappedBtnWarning = "<strong>Nota:</strong> Como esse conjunto de menus dependentes é usado por um ou mais botões de digitalização, não é possível alterar suas seleções de menu de fonte de dados nem o excluir. Primeiro remova o uso do conjunto de menus dependentes na página de edição de configurações de botão para cada botão e, em seguida, volte a esta página para alterar suas seleções de menu de fonte de dados ou para excluí-lo. É possível alterar as configurações na seção Mapear valores de menu."/>
<#assign dmPage_mappedBtnNoDeleteTip = ""/>

<#assign dmPage_profileName_label="Nome do conjunto de menus dependentes:"/>
<#assign dmPage_profileName_tip="Um nome exclusivo para o conjunto de menus dependentes ODBC."/>
<#assign dmPage_profileName_fielderror_duplicatedtitle="Existe outro conjunto de menus dependentes ODBC com este nome. Insira um nome exclusivo."/>
<#assign dmPage_section_SelectODBCMenus = "Selecionar menus de fonte de dados"/>
<#assign dmPage_section_SelectODBCMenus_subtitle = "Selecione um menu primário e depois escolha um ou mais menus que dependem uns dos outros para seus valores."/>
<#assign dmPage_primaryMenuLabel= "Menu primário:"/>
<#assign dmPage_primaryMenuTip= "O menu primário ODBC no conjunto. Ele usa as configurações de banco de dados, de tabela e de coluna do menu ODBC."/>
<#assign dmPage_dependentMenuLabel1= "Menu dependente 1:"/>
<#assign dmPage_dependentMenuTip1= "O primeiro menu ODBC dependente no conjunto. Ele usa apenas as configurações de banco de dados e de tabela do menu ODBC."/>
<#assign dmPage_dependentMenuLabel2= "Menu dependente 2:"/>
<#assign dmPage_dependentMenuTip2= "O segundo menu ODBC dependente no conjunto. Ele usa apenas as configurações de banco de dados e de tabela do menu ODBC."/>
<#assign dmPage_add_dm="Adicionar menu dependente"/>
<#assign dmPage_remove_dm="Remover menu dependente"/>
<#assign dmPage_menuoption_none="Nenhum"/>
<#assign dmPage_noODBCMenus = "Não é possível adicionar um conjunto de menus dependentes ODBC, pois não há nenhum menu ODBC. Vá para a página Menus ODBC para adicionar um menu."/>

<#assign dmPage_section_MapMenuValues = "Mapear valores de menu"/>
<#assign dmPage_section_MapMenuValues_subtitle = "Mapeia os valores de cada opção de menu ao seu menu dependente ao configurar a coluna de fonte de dados para seus valores de menu e, opcionalmente, para seus rótulos."/>
<#assign dmPage_returntolisting = "&#8592; Voltar para a página da lista de conjuntos de menus dependentes ODBC"/>
<#assign dmPage_mapingtable_emptyoptionshelp="&larr; Selecionar colunas para valores e rótulos de opção."/>
<#assign dmPage_addBtnLabel="Adicionar"/>
<#assign dmPage_deleteBtnLabel="Excluir conjunto de menu"/>
<#assign dmPage_colMenuNoSelection="Selecionar uma coluna&#8230;"/>
<#assign dmPage_maptblhdr_mapping ="Mapeamento"/>
<#assign dmPage_maptblhdr_options ="Opções"/>
<#assign dmPage_maptblhdr_optscolsubheading ="Rótulo: Valor"/>
<#assign dmPage_maptblhdr_colforlabel ="Coluna para rótulo"/>
<#assign dmPage_maptblhdr_colforvalue ="Coluna para valor"/>


<#-------------------------------------->
<#---------- MFD UI Messages ----------->
<#-------------------------------------->
<#assign browseCollection_MenuLabel = "Selecione uma pasta:">
<#assign browseCollection_selectBtnLabel = "Selecionar pasta"/>
<#assign browseCollection_ResponseError = "Erro: a pasta não foi encontrada ou há um problema de conexão com o servidor do DocuShare."/>
<#assign browseCollection_UpOneLevel = "Subir um nível"/>

<#assign browseFolder_MenuLabel = "Selecione uma pasta:">
<#assign browseFolder_selectBtnLabel = "Selecionar pasta"/>
<#assign browseFolder_ResponseError = "Erro: a pasta de rede não foi encontrada ou há um problema de conexão de rede."/>
<#assign emailSubjectLabel = "Assunto do email"/>
<#assign folderSubjectLabel = "Nome de arquivo"/>
<#assign sendingScanToTxt = "Enviando digitalização para:"/>

<#-- MFP Device Emulator List Page -->

<#assign EmulatorPage_title="Emulador de dispositivo MFP"/>
<#assign EmulatorPage_subtitle="Use esta página para emular a funcionalidade de MFP. Clique em qualquer botão para iniciar a digitalização."/>


