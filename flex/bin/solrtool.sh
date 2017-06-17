#!/bin/sh

if [ "${DOCUSHARE_HOME}" = "" ]
then
  . ./setup_docushare.sh
else
  . ${DOCUSHARE_HOME}/bin/setup_docushare.sh
fi

MY_HOLD=${MY_CLASSPATH}
MY_CLASSPATH=$LIB_JARS/dselfcli.jar:${MY_CLASSPATH}
MY_CLASSPATH=$LIB_JARS/solr-solrj-4.6.0.jar:${MY_CLASSPATH}
MY_CLASSPATH=$LIB_JARS/httpclient-4.2.6.jar:${MY_CLASSPATH}
MY_CLASSPATH=$LIB_JARS/httpcore-4.2.5.jar:${MY_CLASSPATH}
MY_CLASSPATH=$LIB_JARS/httpmime-4.2.6.jar:${MY_CLASSPATH}
MY_CLASSPATH=$LIB_JARS/slf4j-api-1.6.6.jar:${MY_CLASSPATH}
MY_CLASSPATH=$LIB_JARS/slf4j-log4j12-1.6.6.jar:${MY_CLASSPATH}
MY_CLASSPATH=$LIB_JARS/jcl-over-slf4j-1.6.6.jar:${MY_CLASSPATH}
MY_CLASSPATH=$LIB_JARS/jul-to-slf4j-1.6.6.jar:${MY_CLASSPATH}
MY_CLASSPATH=$LIB_JARS/commons-io-2.4.jar:${MY_CLASSPATH}
MY_CLASSPATH=$LIB_JARS/commons-logging-1.1.jar:${MY_CLASSPATH}
MY_CLASSPATH=$LIB_JARS/noggit-0.5.jar:${MY_CLASSPATH}
MY_CLASSPATH=$LIB_JARS/log4j.jar:${MY_CLASSPATH}
MY_CLASSPATH=$LIB_JARS/xml-apis.jar:${MY_CLASSPATH}

echo "-------"
echo "Running solrtool " $*

java -cp "${MY_CLASSPATH}" -Xms80m -Xmx100m -Dcom.xerox.docushare.install=${DOCUSHARE_HOME} com.xerox.docushare.elf.cli.impl.SolrTool $*

MY_CLASSPATH=${MY_HOLD}




