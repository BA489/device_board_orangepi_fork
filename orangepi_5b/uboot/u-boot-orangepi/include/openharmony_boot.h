/*
 * Copyright (C) 2022 HiHope Open Source Organization .
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef __OPENHARMONY_BOOT_H_
#define __OPENHARMONY_BOOT_H_
#include <stdbool.h>

#define ENABLE_OPENHARMONY_RAMDISK_PART 1

/* Macros and struct from OpenHarmony.
 * Refer to 
 * https://gitee.com/openharmony/update_updater/blob/master/interfaces/kits/include/misc_info/misc_info.h
 */
#define MAX_COMMAND_SIZE (20)
#define MAX_UPDATE_SIZE (100)

#define MISC_BASE_OFFSET 0UL
#define MISC_UPDATE_MESSAGE_OFFSET (MISC_BASE_OFFSET)

struct UpdateMessage {
    char command[MAX_COMMAND_SIZE];
    char update[MAX_UPDATE_SIZE];
};

#define OHOS_PART_UPDATER "updater"
#define OHOS_PART_MISC "misc"
#define OHOS_PART_RAMDISK "ramdisk"

typedef enum OHOS_BOOT_MODE {
    BOOT_NORMAL = 0,
    BOOT_UPDATER,
    BOOT_FLASHD
} OHOS_BOOT_MODE;

#ifdef ENABLE_OPENHARMONY_RAMDISK_PART
/*
 * Check if need to enter ohos updater mode
 */
bool switch_ohos_boot_mode(void);
int load_openharmony_rd_to_ram(const char *rd_part);
#endif

#endif /* __OPENHARMONY_BOOT_H_ */