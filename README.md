ipeecheck
=========

A bash script that sends you an e-mail containing your public IP when it changes.

This script requires:
- mailx
- libnotify [for desktop notifications]

Optional dependencies:
- ssh w/key login enabled [for desktop notifications from remote machine]

usage
---------

The intended usage of this script is scheduling it with cron to run every few minutes. 
Before running, you need to *edit three variables*:

* **SERVER** = The webpage you will be using to tell you your ip address. This should be a webpage that returns a string which is your ip address. Two services that do this are icanhazip.com and ifconfig.me, but unless you don't run this frequently, I recomend implementing this on a server you own.

* **ADDR_HST_FILE**= the file that will be used to store ip addresses for future reference. The default is a hidden file in your home directory.

* **EMAIL** = The e-mail address at which you want to receive the notifications.

Finally, you will need to configure mailx which is used to send the notifications. This is beyond the scope of this README. You're on your own here (you and a search engine).

* **ENABLE_DESKTOP_NOTIFICATION** = While true: enable receipt of desktop notifications when IP changes. While false: desktop notification is disabled

* **REMOTE_DESKTOP_NOTIFICATION** = Requires desktop notification to be anabled. When true: sends desktop notification to remote machine. When false: sends desktop notification to local machine. Feature requires SSH daemon to be enabled on target machine, with target machine setup to accept key-based login from host machine.

* **REMOTE_NOTIFICATION_IP** = IP address of remote target machine

* **DESKTOP_NOTIFICATION_DISPLAY** = X11 display to send desktop notification to. Unless you have a specific reason to change this setting, best to leave it be.
