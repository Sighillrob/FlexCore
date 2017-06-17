#!/bin/sh

if [ "${DOCUSHARE_HOME}" = "" ]
then
  . ./setup_docushare.sh
else
  . ${DOCUSHARE_HOME}/bin/setup_docushare.sh
fi

DRALA_JARS=${DOCUSHARE_HOME}/drala/dwe/lib
MY_CLASSPATH=${LIB_JARS}/dscli.jar:${MY_CLASSPATH}
MY_CLASSPATH=${LIB_JARS}/dsutil.jar:${MY_CLASSPATH}
MY_CLASSPATH=${LIB_JARS}/i18nfix.jar:${MY_CLASSPATH}
MY_CLASSPATH=${LIB_JARS}/jakarta-oro-2.0.jar:${MY_CLASSPATH}
MY_CLASSPATH=${DRALA_JARS}/dw.jar:${MY_CLASSPATH}
MY_CLASSPATH=${DRALA_JARS}/mail.jar:${MY_CLASSPATH}
MY_CLASSPATH=${DRALA_JARS}/commons-cli.jar:${MY_CLASSPATH}

java -cp ${MY_CLASSPATH} -Djava.security.policy=file:${POLICY_FILE} -Dcom.xerox.docushare.install=${DOCUSHARE_HOME}  com.xerox.docushare.cli.ConfigDriver migrate $@
