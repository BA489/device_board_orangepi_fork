#!/system/bin/sh

/system/bin/chmod 666 /dev/graphics/fb0
/system/bin/chmod 666 /sys/class/backlight/backlight/brightness
/system/bin/chmod 666 /sys/class/backlight/backlight_1/brightness
/system/bin/insmod /vendor/etc/modules/dhd_static_buf.ko
/system/bin/insmod /vendor/etc/modules/bcmdhd.ko
/systen/bin/echo 255 > /sys/class/backlight/backlight_1/brightness
