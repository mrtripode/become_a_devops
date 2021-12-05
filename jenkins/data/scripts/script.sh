#!/bin/bash

NAME=$1
SECOND_NAME=$2
LAST_NAME=$3
SHOW=$4

#if [$SHOW -eq true];
if $SHOW
then
    echo "Hello, $NAME $SECOND_NAME $LAST_NAME"
else
    echo "Error, to print the great you must set up true the SHOW parameter"
fi
