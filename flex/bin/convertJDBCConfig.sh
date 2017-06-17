#!/bin/sh

if [ "${DOCUSHARE_HOME}" = "" ]
then
  . ./setup_docushare.sh
else
  . ${DOCUSHARE_HOME}/bin/setup_docushare.sh
fi

MY_HOLD=${MY_CLASSPATH}
MY_CLASSPATH=${LIB_JARS}/jdom.jar:${MY_CLASSPATH}
MY_CLASSPATH=${LIB_JARS}/jaxen-core.jar:${MY_CLASSPATH}
MY_CLASSPATH=${LIB_JARS}/jaxen-jdom.jar:${MY_CLASSPATH}
MY_CLASSPATH=${LIB_JARS}/saxpath.jar:${MY_CLASSPATH}
MY_CLASSPATH=${LIB_JARS}/kolvir.jar:${MY_CLASSPATH}
MY_CLASSPATH=${DOCUSHARE_HOME}/Crypto.jar:${MY_CLASSPATH}
MY_CLASSPATH=${LIB_JARS}/d4sqlserver.jar:${MY_CLASSPATH}
MY_CLASSPATH=${LIB_JARS}/d4oracle.jar:${MY_CLASSPATH}
MY_CLASSPATH=${LIB_JARS}/pgjdbc2.jar:${MY_CLASSPATH}

echo "Running convertJDBCConfig $@"

java -cp ${MY_CLASSPATH} -Dcom.xerox.docushare.install=${DOCUSHARE_HOME} com.xerox.elf.kolvir.dbc.impl.setupDatabase -convert $@

MY_CLASSPATH=${MY_HOLD}
