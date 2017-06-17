#!/bin/sh

if [ "${DOCUSHARE_HOME}" = "" ]
then
  . ./setup_docushare.sh
else
  . ${DOCUSHARE_HOME}/setup_docushare.sh
fi

MY_HOLD=${MY_CLASSPATH}
MY_CLASSPATH=${LIB_JARS}/dsutil.jar:${MY_CLASSPATH}
MY_CLASSPATH=${LIB_JARS}/i18nfix.jar:${MY_CLASSPATH}
MY_CLASSPATH=${LIB_JARS}/dscli.jar:${MY_CLASSPATH}

echo "Running dstrashcan $@"

if [ "$1" = "" ]
then

java -cp ${MY_CLASSPATH} -Dcom.xerox.docushare.install=${DOCUSHARE_HOME} com.xerox.docushare.cli.impl.DSTrashcan -h "$@"

else

java -cp ${MY_CLASSPATH} -Dcom.xerox.docushare.install=${DOCUSHARE_HOME} -Xms80m -Xmx100m com.xerox.docushare.cli.impl.DSTrashcan "dstrashcan" "$@"

fi

MY_CLASSPATH=${MY_HOLD}
