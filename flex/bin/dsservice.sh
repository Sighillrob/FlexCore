#!/bin/sh

if [ "${DOCUSHARE_HOME}" = "" ]
then
  . ./setup_docushare.sh
else
  . ${DOCUSHARE_HOME}/bin/setup_docushare.sh
fi

MY_HOLD=${MY_CLASSPATH}

echo "Running dsservice $@"

if [ "$1" = "" ]
then

java -cp ${MY_CLASSPATH} -Djava.security.policy=file:${POLICY_FILE} -Dcom.xerox.docushare.install=${DOCUSHARE_HOME} com.xerox.docushare.monitor.impl.MonitorControl help

else

java -cp ${MY_CLASSPATH} -Djava.security.policy=file:${POLICY_FILE} -Dcom.xerox.docushare.install=${DOCUSHARE_HOME} com.xerox.docushare.monitor.impl.MonitorControl "$@"

fi

MY_CLASSPATH=${MY_HOLD}
