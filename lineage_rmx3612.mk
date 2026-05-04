#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from the custom device configuration.
$(call inherit-product, device/realme/rmx3612/device.mk)

# Inherit from the LineageOS configuration.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_BRAND := Realme
PRODUCT_DEVICE := rmx3612
PRODUCT_MANUFACTURER := Realme
PRODUCT_MODEL := rmx3612
PRODUCT_NAME := lineage_rmx3612

PRODUCT_GMS_CLIENTID_BASE := android-oppo
