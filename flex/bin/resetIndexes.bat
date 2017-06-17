@echo off
echo Dropping and recreating indexes...

call setupDatabase_kolvir -resetIndexes %*

echo Finished reset indexes

@echo on
