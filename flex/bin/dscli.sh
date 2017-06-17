#!/bin/sh

if [ "${DOCUSHARE_HOME}" = "" ]
then
  . ./setup_docushare.sh
else
  . ${DOCUSHARE_HOME}/bin/setup_docushare.sh
fi

MY_HOLD=${MY_CLASSPATH}
MY_CLASSPATH=${LIB_JARS}/dsutil.jar:${MY_CLASSPATH}
MY_CLASSPATH=${LIB_JARS}/i18nfix.jar:${MY_CLASSPATH}
MY_CLASSPATH=${LIB_JARS}/dscli.jar:${MY_CLASSPATH}

java -cp ${MY_CLASSPATH} -Dcom.xerox.docushare.install=${DOCUSHARE_HOME} com.xerox.docushare.cli.impl.DSImport -h $*

java -cp ${MY_CLASSPATH} -Dcom.xerox.docushare.install=${DOCUSHARE_HOME} com.xerox.docushare.cli.impl.DSExport -h $*

java -cp ${MY_CLASSPATH} -Dcom.xerox.docushare.install=${DOCUSHARE_HOME} com.xerox.docushare.cli.impl.DSDelete -h $*

java -cp ${MY_CLASSPATH} -Dcom.xerox.docushare.install=${DOCUSHARE_HOME} com.xerox.docushare.cli.impl.DSGetProp -h $*

java -cp ${MY_CLASSPATH} -Dcom.xerox.docushare.install=${DOCUSHARE_HOME} com.xerox.docushare.cli.impl.DSListProp -h $*

java -cp ${MY_CLASSPATH} -Dcom.xerox.docushare.install=${DOCUSHARE_HOME} com.xerox.docushare.cli.impl.DSSetProp -h $*

java -cp ${MY_CLASSPATH} -Dcom.xerox.docushare.install=${DOCUSHARE_HOME} com.xerox.docushare.cli.impl.DSLock -h $*

java -cp ${MY_CLASSPATH} -Dcom.xerox.docushare.install=${DOCUSHARE_HOME} com.xerox.docushare.cli.impl.DSUnlock -h $*

java -cp ${MY_CLASSPATH} -Dcom.xerox.docushare.install=${DOCUSHARE_HOME} com.xerox.docushare.cli.impl.DSTrashcan -h $*

java -cp ${MY_CLASSPATH} -Dcom.xerox.docushare.install=${DOCUSHARE_HOME} com.xerox.docushare.cli.impl.DSOrphan -h $*

. ./dsservice.sh -h $*

MY_CLASSPATH=${MY_HOLD}






