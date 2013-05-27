#!/bin/bash

#exits if there is an unset variable or an error
set -o nounset
set -o errexit

# Configure me!
########################################
SERVER="http://api.exip.org/?call=ip"
ADDR_HST_FILE="$HOME/.ipeecheck_address_history"
EMAIL=name@host.com
LOCAL_DESKTOP_NOTIFICATION=false
REMOTE_DESKTOP_NOTIFICATION=false
REMOTE_NOTIFICATON_IP=192.168.1.X
DESKTOP_NOTIFICATION_DISPLAY=:0
########################################

#checks if address history file exists.
#if not, it creates it.
if [ ! -f "$ADDR_HST_FILE" ]
then
    echo "Address history file doesn't exist."
    echo "Creating file "$ADDR_HST_FILE""
    touch "$ADDR_HST_FILE"
fi

#gets the current addr from the specified server and
#gets the latest addr from the address history file.
#stores both addresses in variables
CURRENT_ADDR=$(wget "$SERVER" -O - -q)
PREVIOUS_ADDR=$(tail -n 1 "$ADDR_HST_FILE")

#checks if address has changed since previous execution
#if it hasn't changed, it does nothing.
#else, it appends it to the history file and sends an e-mail
if [ "$CURRENT_ADDR" = "$PREVIOUS_ADDR"  ]
then
    exit 0
else
    echo "Your ip address has changed to: $CURRENT_ADDR"
    echo "$CURRENT_ADDR" >> "$ADDR_HST_FILE"

    echo -e "Your ip address for host $HOSTNAME has changed.\n\
Your new ip address is:\n$CURRENT_ADDR"\
| mailx -s "[IPEECHECK] Your ip address has changed" "$EMAIL"

#Sends desktop notifications if enabled
    if $LOCAL_DESKTOP_NOTIFICATION
    then
        DISPLAY=$DESKTOP_NOTIFICATION_DISPLAY \
        notify-send "ipeecheck" "Your new public IP is:\n$CURRENT_ADDR"
    fi

    if $REMOTE_DESKTOP_NOTIFICATION
    then
        ssh $REMOTE_NOTIFICATON_IP "DISPLAY=$DESKTOP_NOTIFICATION_DISPLAY \
        notify-send \"ipeecheck\" \"Your new public IP is:\n$CURRENT_ADDR\""
    fi
fi
