#!/bin/sh
#starts FileSystemFetch
cd ${FALCON_INSTALL}/IDOLServer/FileSystemFetch
./AutonomyFileSystemFetch.exe & >> ${FALCON_INSTALL}/logs/FSFService.log 2>&1 </dev/null

