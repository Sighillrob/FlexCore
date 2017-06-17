@echo off

if "%ENV_SETUP%" == "YES" goto runServer

call setup_docushare.bat

:runServer
SET MY_HOLD=%MY_CLASSPATH%
SET MY_CLASSPATH=%LIB_JARS%\jdom.jar;%MY_CLASSPATH%
SET MY_CLASSPATH=%LIB_JARS%\jaxen-core.jar;%MY_CLASSPATH%
SET MY_CLASSPATH=%LIB_JARS%\jaxen-jdom.jar;%MY_CLASSPATH%
SET MY_CLASSPATH=%LIB_JARS%\saxpath.jar;%MY_CLASSPATH%
SET MY_CLASSPATH=%LIB_JARS%\kolvir.jar;%MY_CLASSPATH%
SET MY_CLASSPATH=%DOCUSHARE_HOME%\Crypto.jar;%MY_CLASSPATH%

SET MY_CLASSPATH=%LIB_JARS%\mssql.jar;%MY_CLASSPATH%
SET MY_CLASSPATH=%LIB_JARS%\oracle.jar;%MY_CLASSPATH%
SET MY_CLASSPATH=%LIB_JARS%\pgjdbc2.jar;%MY_CLASSPATH%

echo -------
echo Running upgradeDatabase

"%JAVA_HOME%"\bin\java -cp %MY_CLASSPATH% -Dcom.xerox.docushare.install=%DOCUSHARE_HOME% -Xms256m -Xmx512m com.xerox.elf.kolvir.dbc.impl.setupDatabase -upgrade

SET MY_CLASSPATH=%MY_HOLD%

@echo on
