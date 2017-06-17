service httpd start
service postgresql start
service apacheds-2.0.0_M23-default start

sh /usr/share/prizm/pas/pm2/pas.sh start


cd /opt/flex/

source setup_ant

ant startFalcon start_solr

