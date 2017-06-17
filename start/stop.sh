service httpd stop
service postgresql stop
service apacheds-2.0.0_M23-default stop

cd /opt/flex/

source setup_ant

ant stopFalcon stop_solr

