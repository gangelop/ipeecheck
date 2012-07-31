#!/bin/bash

#exits if there is an unbound variable or an error
set -o nounset
set -o errexit

SERVER="http://icanhazip.com"
ADDR_HST_FILE="$HOME/.ipeecheck_address_history"
EMAIL=name@host.com

#checks if file exists
if [ -f "$ADDR_HST_FILE" ]
then
    echo "Address history file exists."
else
    echo "Address history file doesn't exist."
    echo "Creating file" $ADDR_HST_FILE
    touch $ADDR_HST_FILE
fi

echo "Checking current ip address..."
CURRENT_ADDR=$(curl $SERVER 2>/dev/null)
PREVIOUS_ADDR=$(tail -n 1 "$ADDR_HST_FILE")

#checks if address has changed since previous execution
if [ "$CURRENT_ADDR" == "$PREVIOUS_ADDR"  ]
then
    echo "Your ip address hasn't changed."
    exit 0
else
    echo "Your ip address has changed."
    echo "Storing new ip address in $ADDR_HST_FILE"
    echo $CURRENT_ADDR >> "$ADDR_HST_FILE"

    echo -e "Your ip address for host $HOSTNAME has changed.\n\
Your new ip address is:\n$CURRENT_ADDR"\
| mailx -v -s "[IPEECHECK] Your ip address has changed" $EMAIL
fi
