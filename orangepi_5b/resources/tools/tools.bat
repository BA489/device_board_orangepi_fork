hdc shell mount -o remount,rw /
hdc file send .\bin\modetest /system/bin
hdc shell chmod 777 /system/bin/modetest
hdc file send .\bin\busybox /system/bin
hdc shell chmod 777 /system/bin/busybox
hdc file send .\bin\v4l2-ctl /system/bin
hdc shell chmod 777 /system/bin/v4l2-ctl
hdc file send .\bin\media-ctl /system/bin
hdc shell chmod 777 /system/bin/media-ctl
