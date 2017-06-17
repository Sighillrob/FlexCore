HOW TO INSTALL FALCON
=====================

This document describes the steps needed to install Falcon on a target Windows 2008 server, 2012 server, or Windows 10 x64.
Currently the databases supported are PostgreSQL 9.x and SQLServer 2012 only. Older versions of SQL 
Server will not work. This install will only work on 64 bit machines.

The document that describes the LDAP integration and setup is found at:
http://docushare.usa.xerox.com/dsweb/Services/Document-203776
Note:  The Apache HTTP server installation described in the document is 32bit.  It order for it 
to work correctly with LDAP and the bridge you will need to install the 32bit c++ libraries located
in the mslibs directory.  
**For Windows 10 x64**: Apache 2.4 x64 can be used, and the binaries can be found at the Apache Lounge website.

The installation consist of four steps.
1. Environment setup.
2. Updating the localhost.properties and setup_docushare.bat with the values for your target machine.
3. Running the ant script commands to update the instance configuration.
4. Starting Falcon, logging is as admin, and installing services, the default schema, and default objects.
5. License Falcon


Step 1 - Setup Environment
--------------------------
1. Install the Microsoft 2005, 2008, and 2010 (and 2015) runtime libraries.  Install the Libraries to your system located at <installDir>/mslibs directory 
   (vcredist_x64_2005.exe, and vcredist_x64_2010.exe)
3. Install Java SDK (not the standalone JRE)
   3.a Edit your system variables - add "JAVA_HOME" and assign it to your java install directory
   3.b Add "%ANT_HOME%\bin" to your PATH variable.
4. Install ant
   4.a Edit your system variables - add "ANT_HOME" and assign it to your ant install directory
   4.b Add "%ANT_HOME%\bin" to your PATH variable.
5. Install postgres
6. Run "ant recycle" inside the /DocuShare3 directory to create the /dist subdirectory.

As mentioned in LDAP Integration Document: (with additional notes below)
1. If using Windows 10, install Apache Web Server 2.4 x64
   - Binaries can be found at the Apache Lounge website.
   - Editing the httpd.conf file will require you to run your text editor as and Administrator if it was installed inside either the /Program Files or /Program Files x86 directories (left click -> Run As Administrator) when the service has been stopped.
   - See README.txt file in the Apache Lounge download for details on needed Microsoft runtime libraries and how to install the Apache Web Server a service.
2. Install Apache Directory Server (see LDAP integration document mentioned above)


Step 2 - Update the localhost.properties & setup_docushare.bat files
--------------------------------------------------------------------
1. Edit the localhost.properties file that you will find in the top directory of the instance.  Check each of the values and update each for your 
environment such as the database user and password.  Remove the entries from the file that don't pertain to your 
database type, and uncomment the remaining entries (e.g., remove the # from the start of each line)
2. Edit the /DocuShare3/dist/bin/setup_docushare.bat file to set DOCUSHARE_HOME to its location on your server.


Step 3 - Run the ant script command to update the instance configuration
------------------------------------------------------------------------
The full ant command sequence for falcon is:
1.  Run "setup_ant.bat" - For Linux the command will be "source setup_ant".  This will set the environment so the following commands will have access to ant and java.
2.  Run "ant parse_config" - This will combine the default config.properties with the target machine properties file.
3.  Run "ant drop_database" - Optional - This will drop the current database if it exists.  
4.  Run "ant create_database" - Optional - This will create an empty database.
5.  Run "ant load_database" - This will load the schema into the database
6.  Run "ant falcon_install_mode" - This will put the server into install mode
7.  Run "ant config_jdbc" - This will configure the database setting for Falcon
8.  Run "ant config_server" - This will configure the Falcon instance
9.  Run "ant convertJDBCConfig" - This will convert the database config file to xml
10. Run "ant install_suite" - This will install the office conversion service (default is LibreOffice in localhost.properties)

For Windows:

NOTE: A CMD window Run as Administrator,  is required to install idol and tomcat for the following steps. 
      Open a new cmdline window if not currently running as administrator.

10. Run "ant install_idol" - This will install IDOL service into OS system
11. Currently not a step.
12. Run "ant start_idol" - This will start IDOL service, so IDOL Advanced search will work
13. Edit dist/tomcat/bin/falcon-service.bat: change
    set FALCON_INSTALL=C:\svntree\trunk\DocuShare3\dist
    to point to your installation directory.
  Rem set FALCON_JAVA_OPTS=%FALCON_JAVA_OPTS%;-Dcom.xerox.docushare.shadow.debugjar=true    
    (Remove “rem” text before this path)
  Rem set FALCON_JAVA_OPTS=%FALCON_JAVA_OPTS%;-Dcom.xerox.docushare.shadow.showResources=all
    (Remove “rem” text before this path if exists)
14. Edit dist/config/amber.xml.  Put in the host and root for your server.
      Example:
            <?xml version="1.0" encoding="UTF-8" ?>
            <site>
              <scheme>http</scheme>
              <port>80</port>
              <host>localhost</host>
              <root>xcm</root>
              <defaultLocale>en</defaultLocale>
            </site>
15. Make sure that Apache configuration points to the right root. In "<apache_dir>\conf\extra" find httpd-falcon.conf. Make sure you got these lines:
  JkMount /xcm ajp13 
  JkMount /xcm/* ajp13 
16. Run "ant install_tomcat" - This will install tomcat as a service. (This runs falcon-service.bat.)

End of Windows:

For Linux:

10. In the dist/bin directory there is a script "idol" that will control IDOL.  You can run IDOL directly from this
    script or add it to the boot sequence for your machine.  
10.1 To run from your dist/bin directory you can use the ant scripts or the script directly
10.1.1 Direct.  Cd into dist/bin and run "idol start".  This will start of IDOL and let it running.  You can use
       "idol stop" to stop IDOL.
10.1.2 Ant Scripts.  run "ant start_idol" to start and "ant stop_idol" to stop.
10.2 To run IDOL as a Linux service
10.2.1 Run "ant install_idol" as root - This will install IDOL service into OS system
10.2.1 Run "ant start_idolService" as root - This will stop IDOL service into OS system
11. Currently not a step.
12. Currently not a step.
13. Currently not a step.
14. Edit dist/config/amber.xml.  Put in the host and root for your server.
      Example:
            <?xml version="1.0" encoding="UTF-8" ?>
            <site>
              <scheme>http</scheme>
              <port>80</port>
              <host>localhost</host>
              <root>xcm</root>
              <defaultLocale>en</defaultLocale>
            </site>
15. Make sure that Apache configuration points to the right root. In "<apache_dir>/conf/extra" find httpd-falcon.conf. Make sure you got these lines:
  JkMount /xcm ajp13 
  JkMount /xcm/* ajp13 
16. In the dist/bin directory there is a script "falcon" that will control falcon.  You can run falcon directly from this
    script or add it to the boot sequence for your machine.  
16.1 To run from your dist/bin directory you can use the ant scripts or the script directly
16.1.1 Direct.  Cd into dist/bin and run "falcon start".  This will start of falcon and let it running.  You can use
       "falcon stop" to stop falcon.
16.1.2 Ant Scripts.  run "ant startFalcon" to start and "ant stopFalcon" to stop.
16.2 To run falcon as a Linux service
16.2.1 Run "ant install_tomcat" as root - This will install falcon service into OS system
16.2.1 Run "ant startFalconService" as root - This will stop falcon service into OS system

End of Linux:

For Both:

17. Examine the contents of your file config/kvService.xml.  If it does not have the following two elements, add them:

  <service name="com.xerox.docushare.elf.index.server.IndexServerImpl"/>
  <service name="com.xerox.docushare.elf.search.server.SearchServerImpl"/>
  
example file:

<?xml version="1.0" encoding="UTF-8" ?>
<services mode="readWrite" version="1" maxSize="10" maxIndex="10" webLogLevel="DEBUG">
  <service name="com.xerox.elf.kolvir.dbc.impl.DatabaseImpl" required="true" logLevel="DEBUG" />
  <!--<service name="com.xerox.elf.kolvir.content.ContentStoreServiceImpl" required="true" logLevel="info"/>-->
  <service name="com.xerox.elf.kolvir.content.ContentStoreServiceImpl" logLevel="DEBUG" />
  <service name="com.xerox.raptor.kite.service.ContentIntakeService" logLevel="info" />
  <service name="com.xerox.docushare.elf.index.server.IndexServerImpl" logLevel="info" />
  <service name="com.xerox.docushare.elf.search.server.SearchServerImpl" logLevel="info" />
  <service name="com.xerox.docushare.avalon.elfbase.contentRules.shadow.ContentRuleService" logLevel="info" />
  <service name="com.xerox.falcon.directory.service.KVServiceImpl" logLevel="info" />
  <service name="com.xerox.docushare.avalon.elfbase.alarm.AlarmService" logLevel="info" />
  <service name="com.xerox.docushare.emailservicefalcon.KVServiceImpl" logLevel="info" />
</services>



Step 4 - Install services, default classes, and example objects
----------------------------------------------------------------

1. Run "ant startFalcon" - Optional - One way to start the server.  (if you use this, then "ant stopFalcon" stops it)
   You may want to update DatabaseProperties.xml to update the database password.

   *Alternative:* Run "ant start_suite" to start Falcon with LibreOffice.

2. After Falcon has started, go to this web address (substituting your host name for 
   "localhost" if necessary):  http://localhost:8080/xcm/spyglass/falcon/install. These bootstrapping steps 
   are interim steps.  Login in as Mr.11, password: secret

   From the install page, take these steps:
  2A.  Press "Browse"(Firefox) or "Choose File"(Chrome) next to com.xerox.docushare.elf.search.server.SearchServerImpl, and navigate to your
        config directory and choose the file "SearchServerConfig.xml".  Press Configure Service.
  2B.  Press "Browse"(Firefox) or "Choose File"(Chrome) next to com.xerox.docushare.elf.index.server.IndexServerImpl, and navigate to your 
        config directory and choose the file "IndexServerConfig.xml".  Press Configure Service.
  2C.  Edit the file contentStoreProperties.xml on your config to makes sure that it has the following structure
        but to include the full path name of a directory that's suitable for content storage, in the <path> element.

            <?xml version="1.0" encoding="UTF-8"?>
            <contentStore>   
                  <rootDirectories>
                     <rootDirectory> 
                        <path> Your content store root directory here </path>
                  <limit> 99 </limit>
                  <limitUnits> % </limitUnits>
                     </rootDirectory>                            
                  </rootDirectories>
                  <overwriteIfFileExists> true </overwriteIfFileExists>
                  <logLevel>DEBUG</logLevel>
                  <sleepTime>60000</sleepTime>
            </contentStore>

            Assure that the directory that you name above exists and is writeable and is empty.

  2D. Press "Browse"(Firefox) or "Choose File"(Chrome) next to com.xerox.elf.kolvir.content.ContentStoreServiceImpl, and navigate to your 
        config directory and choose the file "contentStoreProperties.xml".  Press Configure Service.
  2E. Press "Browse"(Firefox) or "Choose File"(Chrome) next to
      com.xerox.docushare.avalon.elfbase.contentRules.shadow.ContentRuleService and navigate to your
        config directory and choose the file "contentRuleConfig.xml". Press Configure Service.
  2F. Edit the file the DirectoryService.xml under the config. Look at DirConfigLDAPServers/DirConfigLDAP/Config/BasicConfig.
      BaseConfig should have a child element called ServerName.  <Hosts> should be 127.0.0.1 if you have installed your own LDAP server.  If you are using a different LDAP server, then use its IP address. 
      To use QA LDAP server, the line should look like: <Hosts>ad2008-hv.na.xerox.org</Hosts>
  2G. Press "Browse"(Firefox) or "Choose File"(Chrome) next to com.xerox.falcon.directory.service.KVServiceImpl, and navigate to
      your config directory and choose the file " DirectoryService.xml". Press Configure Service.

  2H. Edit the file OAuthService.xml under the /config directory. <serviceAccount> should be 137.  
  
  2I. Press "Browse"(Firefox) or "Choose File"(Chrome) next to your config directory and choose file "OAuthService.xml".  Press Configure Service.
  
  2J. Edit Email Service Config File.  Go to config directory, open and edit file "EmailServiceConfig.xml" and put in the follow basic settings: (Edit <testDestinationEmail> with your own email)
    
      <?xml version="1.0" encoding="UTF-8"?>
      <EmailServiceConfig>
        <OutgoingMailServer serverAlias="Falcon Outgoing Mail Server">
          <host>mailhost.adoc.xerox.com</host>
          <protocol>smtp</protocol>
          <port>25</port>
          <enable>true</enable>
          <username>thuypop</username>
          <password>ttran12345</password>
          <timeout>100000</timeout>
          <bulkMailLimit>0</bulkMailLimit>
          <defaultFrom />
          <defaultTo />
          <maxAttachmentSize>20</maxAttachmentSize>
          <testDestinationEmail>myEmailAddress@company.com</testDestinationEmail>
        </OutgoingMailServer>
        <setup>
          <!-- if there is emailReceive license, provide these fields -->
          <TempDir />
          <maxNFailures>3</maxNFailures>
          <sleepTimeAfterMaxFailure>5</sleepTimeAfterMaxFailure>
          <!-- if there is either emailSend or print or emailReceive license, provide these fields -->
          <SSLCertKeystore />
          <KeystorePassword />
        </setup>
      </EmailServiceConfig>

  2K. Press "Browse"(Firefox) or "Choose File"(Chrome) next to your config directory and choose the file "EmailServiceConfig.xml".  Press Configure Service.


  **Do not choose a file for the remaining subsystems.  They are not supported in this interim release.**


3. Go to your browser settings or options to change the preferred Language. 
   Set the language to either 'en' or 'en-US'. If there are no languages set in the browser, the default locale 'en', will be used.

4. Still on the install page, now press the Install button.  If successful, this button will turn into an Uninstall button and  a number
   of Falcon class names will be shown, all with zero instances.

5. Still on the install page, now press Create objects.  If successful, an alert box will say "Successfully created objects" and the number
   of instances will be non-zero for some classes.

6. Proceed to http://localhost/xcm/spyglass/falcon/HomePage
   Falcon is up and running.



Step 5: License Falcon
----------------------

Build DocuLicense modules:

1. Go to the /DocuLicense/xmlsign directory.  Run "ant"

Sign the licenses:

1. Go to the /DocuShare3 directory.
2. To sign Falcon license:
   - Edit /dist/config/falconLicenseUnsigned.xml.  Put in your hostname in place of placeholder %localhost% in the <dns> element.
   - Run "ant -f build_license.xml only_sign_license  -Dlicense=falcon"
   This creates /dist/config/falconLicenseSigned.xml

3. To sign Policies & Procedures license:
   - Edit /dist/config/pnpLicenseUnsigned.xml.  Put in your hostname in place of placeholder %localhost% in the <dns> element.
   - Run "ant -f build_license.xml only_sign_license  -Dlicense=pnp"
   This creates /dist/config/pnpLicenseSigned.xml

Install the licenses:

1. Go to the Admin page, License subpage. (http://localhost/xcm/spyglass/admin/index/siteConfiguration/License)

2. Install Falcon license:
  Put “falcon” in the license name, browse to dist/config/falconLicenseSigned.xml and then clicked on Install License.  After the license is installed you should see a new entry “Content Management Application”.

3. To install pnp license
   Put “pnp” in the license name, browse to the dist/config/pnpLicenseSigned.xml and then click on Install License.  After the license is installed, you should be taken to a view page for the installed pnp license.



How to install the web server bridge
------------------------------------

For Windows and IIS:
The Falcon software suite is based on and hosted by the Apache Tomcat Servlet container.  This setup requires external authentication provided by a hosting web server such as Apache HTTPD or Microsoft IIS.  The two software frameworks need to be bridged together to provide the software environment for the Falcon software suite.  This section will provide guidance on the installation of the Microsoft IIS/Apache Tomcat bridge.
1. The bridge installation wizard is located in <FalconInstall>/bridge and is named iistool.exe.  Execute this wizard as administrator.  It will first check that IIS is installed on the server.
2. The first dialog of the wizard will ask where you would like the bridge installed on the server.  The default will suffice.
3. The second dialog of the wizard will ask for four items.  The defaults for the first two of port 8009 and port 80 will work.  The next two need to be updated.  The DocuShare Root value should be changed to "xcm" and the Host DNS name should be changed to the fully qualified name of the server.
4. The last dialog verifies that you want to install the bridge.  When you click on the next button the bridge will be installed into the IIS server.
5. Verify the installation by accessing Falcon through IIS.

For Windows and Apache HTTPD

For Linux and Apache HTTPD
