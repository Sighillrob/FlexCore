service httpd stop
service postgresql stop
service apacheds-2.0.0_M23-default start

cd /opt/flex/
rm -rf /opt/flex/documents
mkdir /opt/flex/documents

source setup_ant

ant stopFalcon uninstall_tomcat stop_solr drop_database

echo Update Answer.txt Change Hostname apply new certificate

exit

