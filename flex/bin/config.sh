#!/bin/sh

LIB_JARS=../lib
DRALA_JARS=../drala/dwe/lib
MY_CLASSPATH=.:${JAVA_HOME}/lib/classes.zip
MY_CLASSPATH=${LIB_JARS}/installer.jar:${MY_CLASSPATH}
MY_CLASSPATH=${LIB_JARS}/jdom.jar:${MY_CLASSPATH}
MY_CLASSPATH=${LIB_JARS}/jdomutil.jar:${MY_CLASSPATH}
MY_CLASSPATH=${LIB_JARS}/jaxen.jar:${MY_CLASSPATH}
MY_CLASSPATH=${LIB_JARS}/saxpath.jar:${MY_CLASSPATH}
MY_CLASSPATH=${LIB_JARS}/xercesImpl.jar:${MY_CLASSPATH}
MY_CLASSPATH=${LIB_JARS}/xml-apis.jar:${MY_CLASSPATH}
MY_CLASSPATH=${LIB_JARS}/xalan.jar:${MY_CLASSPATH}
MY_CLASSPATH=${LIB_JARS}/log4j.jar:${MY_CLASSPATH}
MY_CLASSPATH=${LIB_JARS}/log4j-core.jar:${MY_CLASSPATH}
MY_CLASSPATH=${LIB_JARS}/docushare3.jar:${MY_CLASSPATH}
MY_CLASSPATH=${LIB_JARS}/monitor.jar:${MY_CLASSPATH}
MY_CLASSPATH=${LIB_JARS}/dscli.jar:${MY_CLASSPATH}
MY_CLASSPATH=${LIB_JARS}/dscommon.jar:${MY_CLASSPATH}
MY_CLASSPATH=${LIB_JARS}/conversion.jar:${MY_CLASSPATH}
MY_CLASSPATH=${LIB_JARS}/dsworkflow.jar:${MY_CLASSPATH}
MY_CLASSPATH=${LIB_JARS}/jakarta-oro-2.0.jar:${MY_CLASSPATH}
MY_CLASSPATH=${LIB_JARS}/oracle.jar:${MY_CLASSPATH}
MY_CLASSPATH=${LIB_JARS}/pgjdbc2.jar:${MY_CLASSPATH}
MY_CLASSPATH=${DRALA_JARS}/dw.jar:${MY_CLASSPATH}
MY_CLASSPATH=${DRALA_JARS}/mail.jar:${MY_CLASSPATH}

if [ "${LD_LIBRARY_PATH}" = "" ]
then
  LD_LIBRARY_PATH=.:/lib:/usr/lib 
else
  LD_LIBRARY_PATH=.:${LD_LIBRARY_PATH}
fi
export LD_LIBRARY_PATH

if [ "$1" = "config" ]
then
  ../jre/bin/java -cp ${MY_CLASSPATH} com.xerox.docushare.cli.ConfigDriver config $2
  ../jre/bin/java -cp ${MY_CLASSPATH} com.xerox.docushare.cli.ConfigDriver config2 $2
else
  ../jre/bin/java -cp ${MY_CLASSPATH} com.xerox.docushare.cli.ConfigDriver $*
fi
