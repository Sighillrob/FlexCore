#!/bin/bash
source setup_ant

java -Dfalcon.auth.type=basic -Djava.util.logging.config.file=installer_logging.properties -jar falconInstaller.jar
