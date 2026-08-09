#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from the custom device configuration.
$(call inherit-product, device/realme/Blade/device.mk)

# Inherit from the LineageOS configuration.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_BRAND := Realme
PRODUCT_DEVICE := Blade
PRODUCT_MANUFACTURER := Realme
PRODUCT_MODEL := RMX3612
PRODUCT_NAME := lineage_Blade

PRODUCT_GMS_CLIENTID_BASE := android-oppo
