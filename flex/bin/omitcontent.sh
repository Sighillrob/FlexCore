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

echo "-------"
echo "Running omitContent " $*
  
java -cp "${CLASSPATH}" -Dcom.xerox.docushare.install=${FALCON_INSTALL} -Xms80m -Xmx100m com.xerox.docushare.elf.cli.impl.OmitContent $*

PATH=${SAVE_PATH}


