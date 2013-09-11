ipeecheck
=========

A bash script that sends you an e-mail containing your public IP when it changes,
with optional support for desktop notifications.

This script requires:
- mailx

Optional dependencies:
- libnotify (for desktop notifications)
- ssh w/key login enabled (for desktop notifications from remote machine)

This script is licensed under the MIT a.k.a. do-whatever-you-want-with-this-but-don't-sue-me license

usage
---------

The intended usage of this script is scheduling it with cron to run every few minutes. 
Before running, you need to *edit three variables*:

* **SERVER** = The server you will be using to tell you your ip address. This should return a string which is your ip address. An example is http://www.usermod.net/api/ip which is hosted by me and is the default
You can very easily do this in PHP with `echo $_SERVER["REMOTE_ADDR"];`.

* **ADDR_HST_FILE**= the file that will be used to store ip addresses for future reference. The default is a hidden file in your home directory.

* **EMAIL** = The e-mail address at which you want to receive the notifications.

Finally, you will need to configure mailx which is used to send the notifications. This is beyond the scope of this README. You're on your own here (you and a search engine).

The following variables need to be set to enable desktop notifications.

* **LOCAL_DESKTOP_NOTIFICATION** = Default is `false`. Set to `true` to enable notifications on the local machine.

* **REMOTE_DESKTOP_NOTIFICATION** = Default is `false`. Set to `true` to send notifications to a remote machine. Feature requires SSH daemon to be enabled on target machine, with target machine setup to accept key-based login from host machine. KNOWN ISSUE: Haven't gotten this to work with cron.

* **REMOTE_NOTIFICATION_IP** = IP address of remote target machine

* **DESKTOP_NOTIFICATION_DISPLAY** = X11 display to send desktop notification to. Unless you have a specific reason to change this setting, best to leave it be.
