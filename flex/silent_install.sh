#!/bin/bash
export JRE_HOME=`pwd`/jre
export ANT_HOME=`pwd`/ant
export PATH=${ANT_HOME}/bin:${JRE_HOME}/bin:${PATH}

java -Dfalcon.auth.type=basic -Djava.util.logging.config.file=installer_logging.properties -jar falconInstaller.jar -f $1
