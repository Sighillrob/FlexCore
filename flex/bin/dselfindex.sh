#!/bin/sh

CUR_DIR=`pwd`
JAVA_HOME=../jre
SAVE_PATH=${PATH}
PATH=${JAVA_HOME}/bin:${PATH}

cd ..
FALCON_INSTALL=`pwd`
cd ${CUR_DIR}

CLASSPATH=${FALCON_INSTALL}/lib/dselfcli.jar
CLASSPATH=${CLASSPATH}:${FALCON_INSTALL}/lib/dscommon.jar
CLASSPATH=${CLASSPATH}:${FALCON_INSTALL}/lib/commons-io-2.4.jar
CLASSPATH=${CLASSPATH}:${FALCON_INSTALL}/lib/log4j.jar
CLASSPATH=${CLASSPATH}:${FALCON_INSTALL}/lib/jdom.jar
CLASSPATH=${CLASSPATH}:${FALCON_INSTALL}/lib/jdomutil.jar
CLASSPATH=${CLASSPATH}:${FALCON_INSTALL}/lib/xercesImpl.jar
CLASSPATH=${CLASSPATH}:${FALCON_INSTALL}/lib/jaxen.jar
CLASSPATH=${CLASSPATH}:${FALCON_INSTALL}/lib/org.restlet.jar
CLASSPATH=${CLASSPATH}:${FALCON_INSTALL}/lib/kolvir.jar
CLASSPATH=${CLASSPATH}:${FALCON_INSTALL}/lib/xml-apis.jar
# for solr
CLASSPATH=${CLASSPATH}:${FALCON_INSTALL}/lib/solr-solrj-4.6.0.jar
CLASSPATH=${CLASSPATH}:${FALCON_INSTALL}/lib/httpclient-4.2.6.jar
CLASSPATH=${CLASSPATH}:${FALCON_INSTALL}/lib/httpcore-4.2.5.jar
CLASSPATH=${CLASSPATH}:${FALCON_INSTALL}/lib/httpmime-4.2.6.jar
CLASSPATH=${CLASSPATH}:${FALCON_INSTALL}/lib/tika-app-1.5.jar

if [ $1 = "" ]
then

  java -cp "${CLASSPATH}" -Dcom.xerox.docushare.install=${FALCON_INSTALL} com.xerox.docushare.elf.cli.impl.DSIndex help

else

  echo "-------"
  echo "Running dselfindex " $*
  
  java -cp "${CLASSPATH}" -Dcom.xerox.docushare.install=${FALCON_INSTALL} -Xms80m -Xmx100m com.xerox.docushare.elf.cli.impl.DSIndex $*

#  if [ $1 = "index_all" ]
#  then
  
#    echo "-------"
#   call DSIndex to log a message
#    java -cp "${CLASSPATH}" -Dcom.xerox.docushare.install=${FALCON_INSTALL} -Xms80m -Xmx100m com.xerox.docushare.elf.cli.impl.DSIndex -message dsindex.recoverindexstart log
  
#    echo "-------"
#    sh ./recoverIndex.sh -autorecover

#  fi

fi

PATH=${SAVE_PATH}


