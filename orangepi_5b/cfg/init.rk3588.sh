#!/system/bin/sh

/system/bin/chmod 666 /sys/class/backlight/backlight/brightness
/system/bin/chmod 666 /sys/class/backlight/backlight_1/brightness
/system/bin/echo 0 > /sys/class/backlight/backlight/brightness
/system/bin/echo 0 > /sys/class/backlight/backlight_1/brightness
#lcd2
/vendor/bin/lcd_reset -M rockchip -s 205@134:1024x600
/system/bin/chmod 666 /dev/graphics/fb0
/system/bin/insmod /vendor/etc/modules/dhd_static_buf.ko
/system/bin/insmod /vendor/etc/modules/bcmdhd.ko
