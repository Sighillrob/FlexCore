#!/bin/sh

if [ "${DOCUSHARE_HOME}" = "" ]
then
  . ./setup_docushare.sh
else
  . ${DOCUSHARE_HOME}/bin/setup_docushare.sh
fi

MY_CLASSPATH=${LIB_JARS}/dscli.jar:${LIB_JARS}/docushare3.jar:${LIB_JARS}/mssql.jar:${LIB_JARS}/oracle.jar:${LIB_JARS}/mysql.jar:${LIB_JARS}/pgjdbc2.jar:${LIB_JARS}/d4oracle.jar:${LIB_JARS}/d4sqlserver.jar:${LIB_JARS}/d4db2.jar:${MY_CLASSPATH}


java -classpath ${MY_CLASSPATH} -Dcom.xerox.docushare.install=${DOCUSHARE_HOME} -Xms256m -Xmx512m com.xerox.docushare.cli.impl.resetIndexes "$@"
