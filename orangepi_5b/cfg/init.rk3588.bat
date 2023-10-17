hdc shell mount -o remount,rw /vendor
hdc file send init.rk3588.sh /vendor/bin
hdc shell chmod 777 /vendor/bin/init.rk3588.sh
hdc shell sync
hdc shell reboot