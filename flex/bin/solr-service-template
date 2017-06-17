#!/bin/sh
#
# solr-service.sh
# root?
if [ ${EUID} -ne 0 ]
then
	ISROOT=0
else
	ISROOT=1
fi

# Find the name of the script
NAME=`basename $0`
if [ ${ISROOT} = "0" ]
then
	echo "script must be run as root"
	exit
fi

# Set defaults for configuration variables
FalconHome=@install_dir@
SolrHome=@install_dir@/Solr

install() {
	echo "Installing Solr as a Linux service"
	cp ${FalconHome}/bin/solr /etc/init.d
#	cp ${FalconHome}/bin/solr.in.sh /etc/default
	echo "Installed Solr as a Linux service"
}

remove() {
	echo "Removing Solr as a Linux service"
	rm /etc/init.d/solr
#	rm /etc/default/solr.in.sh
	echo "Removed SolrFalcon as a Linux service"
}

# See how we were called.
case "$1" in
  install)
	install
	;;
  remove)
	remove
	;;
  *)
	echo $"Usage: $0 {install|remove}"
	exit 2
esac

exit $script_result


