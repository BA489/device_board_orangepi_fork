hdc shell mount -o remount,rw /
hdc file send ohos.para /system/etc/param/
hdc shell rm -rf /data/*
hdc shell sync
hdc shell reboot

