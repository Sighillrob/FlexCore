#!/bin/sh

if [ "${DOCUSHARE_HOME}" = "" ]
then
  . ./setup_docushare.sh
else
  . ${DOCUSHARE_HOME}/bin/setup_docushare.sh
fi

echo "Running dsfind " $*

java -cp "${MY_CLASSPATH}:$LIB_JARS/DocushareFinder.jar:$LIB_JARS/LanguageIdentifier.jar" -Dcom.xerox.docushare.install=${DOCUSHARE_HOME} -DcopyFinder.configuration=%DOCUSHARE_HOME%/lib/CF/conf/copyFinder.conf -DcopyFinder.home=%DOCUSHARE_HOME%/lib/CF -DlanguageIdentifier.home=%DOCUSHARE_HOME%/lib/CF/ -Xmx256m com.xerox.docushare.finder.FinderCommand $*



