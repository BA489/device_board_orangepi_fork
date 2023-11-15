hdc shell mount -o remount,rw /
hdc file send display_manager_config.xml /system/etc/window/resources/
hdc shell rm -rf /data/*
hdc shell sync
hdc shell reboot