#!/system/bin/sh

/system/bin/chmod 666 /sys/class/backlight/backlight/brightness
/system/bin/chmod 666 /sys/class/backlight/backlight_1/brightness
/system/bin/echo 200 > /sys/class/backlight/backlight/brightness
/system/bin/echo 200 > /sys/class/backlight/backlight_1/brightness

/system/bin/insmod /vendor/etc/modules/dhd_static_buf.ko
/system/bin/insmod /vendor/etc/modules/bcmdhd.ko
