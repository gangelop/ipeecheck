ipeecheck
=========

A bash script that sends you an e-mail containing your public IP when it changes,
with optional support for desktop notifications.

This script requires:
- mailx

Optional dependencies:
- libnotify [for desktop notifications]
- ssh w/key login enabled [for desktop notifications from remote machine]

usage
---------

The intended usage of this script is scheduling it with cron to run every few minutes. 
Before running, you need to *edit three variables*:

* **SERVER** = The webpage you will be using to tell you your ip address. This should be a webpage that returns a string which is your ip address. Two services that do this are icanhazip.com and ifconfig.me, but unless you don't run this frequently, I recomend implementing this on a server you own.

* **ADDR_HST_FILE**= the file that will be used to store ip addresses for future reference. The default is a hidden file in your home directory.

* **EMAIL** = The e-mail address at which you want to receive the notifications.

Finally, you will need to configure mailx which is used to send the notifications. This is beyond the scope of this README. You're on your own here (you and a search engine).

The following variables need to be set to enable desktop notifications.

* **LOCAL_DESKTOP_NOTIFICATION** = Default is `false`. Set to `true` to enable notifications on the local machine.

* **REMOTE_DESKTOP_NOTIFICATION** = Default is `false`. Set to `true` to send notifications to a remote machine. Feature requires SSH daemon to be enabled on target machine, with target machine setup to accept key-based login from host machine. KNOWN ISSUE: Haven't gotten this to work with cron.

* **REMOTE_NOTIFICATION_IP** = IP address of remote target machine

* **DESKTOP_NOTIFICATION_DISPLAY** = X11 display to send desktop notification to. Unless you have a specific reason to change this setting, best to leave it be.
