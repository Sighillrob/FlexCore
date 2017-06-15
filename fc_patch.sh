#!/bin/bash

error(){
    echo "You did not Choose the Falcon home."
	exit 0
}
javaError(){
    echo "Java not found at $FALCON_HOME/jre/bin/java. Please choose the correct Falcon home folder."
	exit 0
}

if [ -z "$1" ];
then
    FALCON_HOME=`zenity --file-selection --directory --title="Kindly choose your Falcon Home Directory"`
	ARGS=$FALCON_HOME
    
elif [ "$1" == "-s" ];
then
    if [ "$2" == "-y" ];
	then
	    if [ "$3" == "" ];
	    then
		    error
		fi
        FALCON_HOME=$3
	    ARGS="-s -y $FALCON_HOME"
    else
	    if [ "$2" == "" ];
	    then
		    error
		fi
	    FALCON_HOME=$2
	    ARGS="-s $FALCON_HOME"
	fi
else
    if [ "$1" == "" ];
	then
	    error
	fi
    FALCON_HOME=$1
	ARGS=$FALCON_HOME
fi

if [ -f "$FALCON_HOME/jre/bin/java" ]
then
	echo "\"$FALCON_HOME\" selected."
    $FALCON_HOME/jre/bin/java -jar lib/falconPatchInstaller.jar $ARGS
else
	javaError
fi
