#!/bin/bash

# Copyright (c) 2021-2023 AlgoIdeas <yu19881234@163.com>
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -e



pushd ${1}
ROOT_DIR=${5}
export PRODUCT_PATH=${4}
export DEVICE_COMPANY=${6}
export DEVICE_NAME=orangepi_5b
export PRODUCT_COMPANY=${8}

KERNEL_SRC_TMP_PATH=${ROOT_DIR}/out/kernel/src_tmp/linux-5.10
KERNEL_OBJ_TMP_PATH=${ROOT_DIR}/out/kernel/OBJ/linux-5.10
KERNEL_SOURCE=${ROOT_DIR}/kernel/linux/linux-orangepi
KERNEL_PATCH_PATH=${ROOT_DIR}/device/board/orangepi/orangepi_5b/kernel/kernel_patch/linux-5.10
KERNEL_PATCH=${ROOT_DIR}/device/board/orangepi/orangepi_5b/kernel/kernel_patch/linux-5.10/orangepi_5b_patch/kernel.patch
HDF_PATCH=${ROOT_DIR}/device/board/orangepi/orangepi_5b/kernel/kernel_patch/linux-5.10/orangepi_5b_patch/hdf.patch
KERNEL_CONFIG_FILE=${ROOT_DIR}/device/board/orangepi/orangepi_5b/kernel/config/rk3588s_standard_defconfig

export KBUILD_OUTPUT=${KERNEL_OBJ_TMP_PATH}


cd ${KERNEL_SRC_TMP_PATH}

chmod +x ${KERNEL_SRC_TMP_PATH}/scripts/mk*

find ${KERNEL_OBJ_TMP_PATH} -type f -name logo.bmp | xargs rm -rf
find ${KERNEL_OBJ_TMP_PATH} -type f -name logo_kernel.bmp | xargs rm -rf
find ${KERNEL_SRC_TMP_PATH} -type f -name logo.bmp | xargs rm -rf
find ${KERNEL_SRC_TMP_PATH} -type f -name logo_kernel.bmp | xargs rm -rf

cp -rf ${3}/kernel/logo* ${KERNEL_SRC_TMP_PATH}/
cp -rf ${3}/kernel/make*.sh ${KERNEL_SRC_TMP_PATH}/
cp -rf ${3}/kernel/remake*.sh ${KERNEL_SRC_TMP_PATH}/
cp -rf ${3}/kernel/drivers/dts/* ${KERNEL_SRC_TMP_PATH}/arch/arm64/boot/dts/rockchip
find ${KERNEL_OBJ_TMP_PATH} -type f -name *.dtb | xargs rm -rf

#config
cp -rf ${KERNEL_CONFIG_FILE} ${KERNEL_SRC_TMP_PATH}/arch/arm64/configs/rockchip_linux_defconfig

if [ "enable_ramdisk" == "${9}" ]; then
    ./remake-ohos.sh ORANGEPI-5B enable_ramdisk
else
    ./remake-ohos.sh ORANGEPI-5B disable_ramdisk
fi

mkdir -p ${2}

cp ${KERNEL_OBJ_TMP_PATH}/resource.img ${2}/resource.img
cp ${3}/loader/parameter.txt ${2}/parameter.txt
cp ${3}/loader/MiniLoaderAll.bin ${2}/MiniLoaderAll.bin
cp ${3}/loader/misc.img ${2}/misc.img
cp ${3}/loader/config.cfg ${2}/config.cfg
popd

../kernel/src_tmp/linux-5.10/make-boot.sh ..
