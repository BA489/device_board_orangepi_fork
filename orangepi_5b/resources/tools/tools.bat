hdc shell mount -o remount,rw /
hdc file send bin/modetest /system/bin
hdc shell chmod 777 /system/bin/modetest
hdc file send bin/busybox /system/bin
hdc shell chmod 777 /system/bin/busybox
