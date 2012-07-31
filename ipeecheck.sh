#!/bin/bash

#exits if there is an unbound variable or an error
set -o nounset
set -o errexit

SERVER="http://icanhazip.com"
ADDR_HST_FILE="$HOME/.address_history"
EMAIL=name@host.com

#checks if file exists
if [ -f "$ADDR_HST_FILE" ]
then
    echo "File exists"
else
    echo "File doesn't exist"
    echo "Creating file..." $ADDR_HST_FILE
    touch $ADDR_HST_FILE
fi

CURRENT_ADDR=$(curl $SERVER)
PREVIOUS_ADDR=$(tail -n 1 "$ADDR_HST_FILE")

#checks if address has changed since previous execution
if [ "$CURRENT_ADDR" == "$PREVIOUS_ADDR"  ]
then
    echo "No changes"
    exit 0
else
    echo "IP addr has changed."
    echo "Storing new IP addr in $ADDR_HST_FILE"
    echo $CURRENT_ADDR >> "$ADDR_HST_FILE"

    echo -e "Your IP address has changed.\n\
Your new IP address is:\n$CURRENT_ADDR"\
| mailx -v -s "[IPEECHECK] Your ip address has changed" $EMAIL
fi
