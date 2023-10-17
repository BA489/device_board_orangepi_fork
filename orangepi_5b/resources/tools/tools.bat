hdc shell mount -o remount,rw /
hdc file send modetest /system/bin
hdc shell chmod 777 /system/bin/modetest
hdc file send busybox /system/bin
hdc shell chmod 777 /system/bin/busybox
