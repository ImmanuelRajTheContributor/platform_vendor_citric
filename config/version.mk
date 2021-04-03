# Copyright (C) 2021 The CitricOS Project
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

ANDROID_VERSION := 11.0
CITRICVERSION := V1.0

CITRIC_BUILD_TYPE ?= Unofficial
CITRIC_BUILD_DATE := $(shell date +%Y%m%d)
TARGET_PRODUCT_SHORT := $(subst citric_,,$(CITRIC_BUILD))

# ZIP TYPE
ifeq ($(WITH_GAPPS), true)
CITRIC_BUILD_ZIP_TYPE := Gapps
else
CITRIC_BUILD_ZIP_TYPE := Vanilla
endif

# OFFICIAL_DEVICES
ifeq ($(CITRIC_BUILD_TYPE), OFFICIAL)
   LIST = $(shell cat vendor/citric/citric.devices)
   ifeq ($(filter $(CITRIC_BUILD), $(LIST)), $(CITRIC_BUILD))
    IS_OFFICIAL=true
      CITRIC_BUILD_TYPE := OFFICIAL

endif

ifneq ($(IS_OFFICIAL), true)
CITRIC_BUILD_TYPE := Unofficial
$(error Device is not official "$(CITRIC_BUILD)")
endif
endif

# MAIN
CITRIC_VERSION := CitricOS-$(CITRICVERSION)-$(CITRIC_BUILD)-$(CITRIC_BUILD_DATE)-$(CITRIC_BUILD_TYPE)-$(CITRIC_BUILD_ZIP_TYPE)

CITRIC_MOD_VERSION :=$(ANDROID_VERSION)-$(CITRICVERSION)

CITRIC_DISPLAY_VERSION := CitricOS-$(CITRICVERSION)-$(CITRIC_BUILD_TYPE)

CITRIC_FINGERPRINT := CitricOS/$(CITRIC_MOD_VERSION)/$(TARGET_PRODUCT_SHORT)/$(shell date -u +%H%M)
