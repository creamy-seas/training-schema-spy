#!/usr/bin/env bash

PROP_FILE=$1
if [ -z $1 ]; then
    echo "Need to supply the *.properties file"
    exit
fi

WORKING_DIRECTORY=$(pwd)
echo "Output mapping: $WORKING_DIRECTORY/output:/output"
echo "Driver mapping: $WORKING_DIRECTORY/drivers:/drivers"
echo "Property mapping: $WORKING_DIRECTORY/$PROP_FILE:/schemaspy.properties"

docker run \
       -v "$WORKING_DIRECTORY/output:/output" \
       -v "$WORKING_DIRECTORY/$PROP_FILE:/schemaspy.properties" \
       -v "$WORKING_DIRECTORY/drivers:/drivers" \
       schemaspy/schemaspy:snapshot
