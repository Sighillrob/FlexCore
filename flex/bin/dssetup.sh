#!/bin/sh

if [ "$1" = "installdir" ]; then
  DOCUSHARE_HOME=$2
  POLICY_FILE=${DOCUSHARE_HOME}/config/policy
  LIB_JARS=${DOCUSHARE_HOME}/lib
  DRALA_JARS=${DOCUSHARE_HOME}/drala/dwe/lib
  MY_CLASSPATH=
  MY_CLASSPATH=${LIB_JARS}/jdom.jar:${MY_CLASSPATH}
  MY_CLASSPATH=${LIB_JARS}/jdomutil.jar:${MY_CLASSPATH}
  MY_CLASSPATH=${LIB_JARS}/xercesImpl.jar:${MY_CLASSPATH}
  MY_CLASSPATH=${LIB_JARS}/xml-apis.jar:${MY_CLASSPATH}
  MY_CLASSPATH=${LIB_JARS}/xalan.jar:${MY_CLASSPATH}
  MY_CLASSPATH=${LIB_JARS}/log4j.jar:${MY_CLASSPATH}
  MY_CLASSPATH=${LIB_JARS}/docushare3.jar:${MY_CLASSPATH}
  MY_CLASSPATH=${LIB_JARS}/cryptoContent.jar:${MY_CLASSPATH}
  MY_CLASSPATH=${LIB_JARS}/monitor.jar:${MY_CLASSPATH}
  MY_CLASSPATH=${LIB_JARS}/conversion.jar:${MY_CLASSPATH}
  MY_CLASSPATH=${LIB_JARS}/finder.jar:${MY_CLASSPATH}
  MY_CLASSPATH=${LIB_JARS}/indexserver.jar:${MY_CLASSPATH}
  MY_CLASSPATH=${LIB_JARS}/searchserver.jar:${MY_CLASSPATH}
  MY_CLASSPATH=${LIB_JARS}/subscription.jar:${MY_CLASSPATH}
  MY_CLASSPATH=${LIB_JARS}/scan.jar:${MY_CLASSPATH}
  MY_CLASSPATH=${LIB_JARS}/jms.jar:${MY_CLASSPATH}
  MY_CLASSPATH=${LIB_JARS}/bcprov.jar:${MY_CLASSPATH}
  MY_CLASSPATH=${LIB_JARS}/bcmail.jar:${MY_CLASSPATH}
  MY_CLASSPATH=${LIB_JARS}/mailagent.jar:${MY_CLASSPATH}
  MY_CLASSPATH=${LIB_JARS}/amber.jar:${MY_CLASSPATH}
  MY_CLASSPATH=${LIB_JARS}/pgjdbc2.jar:${MY_CLASSPATH}
  MY_CLASSPATH=${LIB_JARS}/mysql.jar:${MY_CLASSPATH}
  MY_CLASSPATH=${LIB_JARS}/d4oracle.jar:${MY_CLASSPATH}
  MY_CLASSPATH=${LIB_JARS}/d4sqlserver.jar:${MY_CLASSPATH}
  MY_CLASSPATH=${LIB_JARS}/d4db2.jar:${MY_CLASSPATH}
  MY_CLASSPATH=${LIB_JARS}/oracle.jar:${MY_CLASSPATH}
  MY_CLASSPATH=${LIB_JARS}/mssql.jar:${MY_CLASSPATH}
  MY_CLASSPATH=${LIB_JARS}/dscommon.jar:${MY_CLASSPATH}
  MY_CLASSPATH=${LIB_JARS}/dsworkflow.jar:${MY_CLASSPATH}
  MY_CLASSPATH=${LIB_JARS}/sparrow.jar:${MY_CLASSPATH}
  MY_CLASSPATH=${LIB_JARS}/KeyView.jar:${MY_CLASSPATH}
  MY_CLASSPATH=${LIB_JARS}/dsarchive.jar:${MY_CLASSPATH}
  MY_CLASSPATH=${LIB_JARS}/AutonomyACIAPI-4.9.4.jar:${MY_CLASSPATH}
  MY_CLASSPATH=${LIB_JARS}/dsrme.jar:${MY_CLASSPATH}
  MY_CLASSPATH=${JAVA_HOME}/jre/lib/rt.jar:${MY_CLASSPATH}
  MY_CLASSPATH=${LIB_JARS}/dscli.jar:${MY_CLASSPATH}
  MY_CLASSPATH=${LIB_JARS}/dsutil.jar:${MY_CLASSPATH}
  MY_CLASSPATH=${LIB_JARS}/i18nfix.jar:${MY_CLASSPATH}
  MY_CLASSPATH=${LIB_JARS}/jakarta-oro-2.0.jar:${MY_CLASSPATH}
  MY_CLASSPATH=${DRALA_JARS}/dw.jar:${MY_CLASSPATH}
  MY_CLASSPATH=${DRALA_JARS}/mail.jar:${MY_CLASSPATH}
  if [ "${LD_LIBRARY_PATH}" = "" ]; then
    LD_LIBRARY_PATH=${DOCUSHARE_HOME}/bin:/lib:/usr/lib
  else
    LD_LIBRARY_PATH=${DOCUSHARE_HOME}/bin:${LD_LIBRARY_PATH}:/lib:/usr/lib
  fi
  export LD_LIBRARY_PATH
  ${DOCUSHARE_HOME}/jre/bin/java -cp ${MY_CLASSPATH} -Djava.security.policy=file:${POLICY_FILE} -Dcom.xerox.docushare.install=${DOCUSHARE_HOME}  com.xerox.docushare.cli.ConfigDriver iconfig $@
else
  if [ "${DOCUSHARE_HOME}" = "" ]; then
    . ./setup_docushare.sh
  else
    . ${DOCUSHARE_HOME}/bin/setup_docushare.sh
  fi
  DRALA_JARS=${DOCUSHARE_HOME}/drala/dwe/lib
  MY_CLASSPATH=${LIB_JARS}/dscli.jar:${MY_CLASSPATH}
  MY_CLASSPATH=${LIB_JARS}/dsutil.jar:${MY_CLASSPATH}
  MY_CLASSPATH=${LIB_JARS}/i18nfix.jar:${MY_CLASSPATH}
  MY_CLASSPATH=${LIB_JARS}/jakarta-oro-2.0.jar:${MY_CLASSPATH}
  MY_CLASSPATH=${LIB_JARS}/jaxen.jar:${MY_CLASSPATH}
  MY_CLASSPATH=${LIB_JARS}/saxpath.jar:${MY_CLASSPATH}
  MY_CLASSPATH=${LIB_JARS}/docushare3.jar:${MY_CLASSPATH}
  MY_CLASSPATH=${LIB_JARS}/conversion.jar:${MY_CLASSPATH}
  MY_CLASSPATH=${LIB_JARS}/sparrow.jar:${MY_CLASSPATH}
  MY_CLASSPATH=${LIB_JARS}/dsworkflow.jar:${MY_CLASSPATH}
  MY_CLASSPATH=${DRALA_JARS}/dw.jar:${MY_CLASSPATH}
  MY_CLASSPATH=${DRALA_JARS}/mail.jar:${MY_CLASSPATH}
  java -cp ${MY_CLASSPATH} -Djava.security.policy=file:${POLICY_FILE} -Dcom.xerox.docushare.install=${DOCUSHARE_HOME}  com.xerox.docushare.cli.ConfigDriver iconfig $@
fi
