# OpenHarmony for Orange Pi 5B

**1、源码下载**

1）注册码云gitee账号并配置用户信息
```
git config --global user.name "yourname"
git config --global user.email "your-email-address"
```

2）安装码云repo工具，可以执行如下命令

```
curl https://gitee.com/oschina/repo/raw/fork_flow/repo-py3 | sudo tee /usr/local/bin/repo > /dev/null
sudo chmod a+x /usr/local/bin/repo
sudo ln -sf bash /bin/sh
```

**获取源码操作步骤**

通过repo + https 下载

```
repo init -u https://gitee.com/nixingfeng/ohos-orangepi.git -b OpenHarmony-4.1-Release --no-repo-verify --depth=1
repo sync -c
repo forall -c 'git lfs pull'
```

**执行prebuilts**

在源码根目录下执行脚本，安装编译器及二进制工具

```
./build/prebuilts_download.sh
```
**2、编译**

1）进入根目录，执行如下命令导入patch
```
./device/board/orangepi/orangepi_5b/patches/auto_patch.sh
```

2）进入根目录，执行如下命令进行编译
```
./build.sh --product-name orangepi_5b --ccache --no-prebuilt-sdk
```

**3、烧录**

镜像输出在out/orangepi_5b/packages/phone/images目录下，使用RKDevTool工具烧录。
