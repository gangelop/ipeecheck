IpSwitchee
=========

Project is a fork of the ipeecheck script. All credit for project base code goes to lathan. The readme instructions for setting up the original script are included below.


---------
ORIGINAL
---------
A bash script that sends you an e-mail containing your public IP when it changes.

This script requires:
curl
mailx

usage
---------

The intended usage of this script is scheduling it with cron to run every few minutes. 
Before running, you need to *edit three variables*: 

* **SERVER** = The webpage you will be using to tell you your ip address. This should be a webpage that returns a string which is your ip address. Two services that do this are icanhazip.com and ifconfig.me, but unless you don't run this frequently, I recomend implementing this on a server you own.

* **ADDR_HST_FILE**= the file that will be used to store ip addresses for future reference. The default is a hidden file in your home directory.

* **EMAIL** = The e-mail address at which you want to receive the notifications.

Finally, you will need to configure mailx which is used to send the notifications. This is beyond the scope of this README. You're on your own here (you and a search engine).
