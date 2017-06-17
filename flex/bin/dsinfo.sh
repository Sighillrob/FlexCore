#!/bin/sh

if [ "${DOCUSHARE_HOME}" = "" ]
then
  . ./setup_docushare.sh
else
  . ${DOCUSHARE_HOME}/bin/setup_docushare.sh
fi

MY_HOLD=${MY_CLASSPATH}
MY_CLASSPATH=${LIB_JARS}/dscli.jar:${MY_CLASSPATH}

if [ "$1" = "" ]
then

java -cp ${MY_CLASSPATH} com.xerox.docushare.cli.DSVersionDriver help

else

java -cp ${MY_CLASSPATH} com.xerox.docushare.cli.DSVersionDriver "$@"

fi

MY_CLASSPATH=${MY_HOLD}
