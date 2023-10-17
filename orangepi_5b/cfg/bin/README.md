# lcd_reset使用说明

## lcd_reset

1. 开发板在使用MIPI屏时需要使用该命令；

2. 使用参考：

在init.rk3588.sh中添加以下处理:

```
/vendor/bin/lcd_reset -M rockchip -s 205@134:1024x600
```

注意：

1. 以上命令默认仅配置MIPI显示，且采用的是OrangePi 5B的lcd2接口，实际需要调整参数配置

2. lcd_reset基于modetest修改;

