ipeecheck
=========

A bash script that sends you an e-mail containing your public IP when it changes.

This script requires:
curl
tail
mailx

You will also need to configure mailx with an e-mail account and a SMTP server.

WARNING: If you don't use your own server for the checking and you use some service like icanhazip.com or ifconfig.me make sure you play nice and don't abuse it, especially if you are going to use this script in a cron job. Otherwise, host your own server and have a dynamic page that returns a line with the visitor's address (easy to do with php).
