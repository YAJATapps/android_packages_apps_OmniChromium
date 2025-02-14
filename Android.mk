#
# Copyright (C) 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Install the prebuilt webview apk.

LOCAL_PATH:= $(call my-dir)

#include $(CLEAR_VARS)
#LOCAL_MODULE := TrichromeLibrary
#LOCAL_MODULE_TAGS := optional
#LOCAL_MODULE_CLASS := APPS
#LOCAL_PRODUCT_MODULE := true
#LOCAL_MULTILIB := both
#LOCAL_CERTIFICATE := $(DEFAULT_SYSTEM_DEV_CERTIFICATE)

#LOCAL_MODULE_TARGET_ARCH := arm64
#my_src_arch := $(call get-prebuilt-src-arch,$(LOCAL_MODULE_TARGET_ARCH))
#LOCAL_SRC_FILES := prebuilt/$(my_src_arch)/TrichromeLibrary.apk

#LOCAL_PREBUILT_JNI_LIBS_arm := @lib/armeabi-v7a/libmonochrome.so
#include $(BUILD_PREBUILT)

#include $(CLEAR_VARS)
#LOCAL_MODULE       := TrichromeWebView
#LOCAL_MODULE_TAGS  := optional
#LOCAL_PRODUCT_MODULE := true
#LOCAL_MULTILIB := both
#LOCAL_CERTIFICATE := $(DEFAULT_SYSTEM_DEV_CERTIFICATE)
#LOCAL_REQUIRED_MODULES := \
        libwebviewchromium_loader \
        libwebviewchromium_plat_support

#LOCAL_REQUIRED_MODULES += TrichromeLibrary

#LOCAL_MODULE_TARGET_ARCH := arm arm64
#my_src_arch := $(call get-prebuilt-src-arch,$(LOCAL_MODULE_TARGET_ARCH))
#LOCAL_SRC_FILES := prebuilt/$(my_src_arch)/TrichromeWebView.apk

#LOCAL_PREBUILT_JNI_LIBS_arm64 := @lib/arm64-v8a/libmonochrome.so
#include $(BUILD_PREBUILT)

# Use the classic webview version and copy to the product dir
include $(CLEAR_VARS)
LOCAL_MODULE       := SystemWebView
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := APPS
LOCAL_PRODUCT_MODULE := true
LOCAL_MULTILIB := both
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_REQUIRED_MODULES := \
        libwebviewchromium_loader \
        libwebviewchromium_plat_support

ifeq ($(TARGET_ARCH),arm64)
    LOCAL_SRC_FILES := prebuilt/arm64/SystemWebView.apk
else
    LOCAL_SRC_FILES := prebuilt/arm/SystemWebView.apk
    LOCAL_OPTIONAL_USES_LIBRARIES := androidx.window.extensions
endif

LOCAL_PREBUILT_JNI_LIBS_arm := @lib/armeabi-v7a/libwebviewchromium.so
LOCAL_PREBUILT_JNI_LIBS_arm64 := @lib/arm64-v8a/libwebviewchromium.so
include $(BUILD_PREBUILT)

