#!/bin/sh
#
# falcon-service.sh
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

install() {
	echo "Installing Falcon as a Linux service"
	cp ${FalconHome}/bin/falcon /etc/init.d
	echo "Installed Falcon as a Linux service"
}

remove() {
	echo "Removing Falcon as a Linux service"
	rm /etc/init.d/falcon
	echo "Removed Falcon as a Linux service"
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


