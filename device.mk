#
# Copyright (C) 2026 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/realme/rmx3612

# Installs gsi keys into ramdisk, to boot a developer GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/developer_gsi_keys.mk)

# Inherit Vendor Blobs
$(call inherit-product, vendor/realme/rmx3612/rmx3612-vendor.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Virtual A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# Boot Animation
TARGET_SCREEN_HEIGHT := 2408
TARGET_SCREEN_WIDTH := 1080

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_BUILD_SUPER_PARTITION := false

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 31

# Extra VNDK Versions
PRODUCT_EXTRA_VNDK_VERSIONS := 31

# fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# Init
PRODUCT_PACKAGES += \
    init.mt6833.rc \
    fstab.mt6833

# Ramdisk
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/rootdir/etc/fstab.mt6833:$(TARGET_COPY_OUT_RAMDISK)/fstab.mt6833 \
    $(DEVICE_PATH)/rootdir/etc/fstab.mt6833:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.mt6833

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay

# RRO Overlays
PRODUCT_PACKAGES += \
    TetheringConfigOverlay \
    WifiOverlay

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)

# HIDL
PRODUCT_PACKAGES += \
    libhardware \
    libhidltransport \
    libhwbinder

# Fingerprint — using ODM HAL
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.fingerprint.xml

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.rmx3612

# Bluetooth Audio (System-side HAL, sysbta)
PRODUCT_PACKAGES += \
    audio.sysbta.default \
    android.hardware.bluetooth.audio-service-system

# These configs don't exist yet in DT
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/bluetooth/audio/config/sysbta_audio_policy_configuration.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysbta_audio_policy_configuration.xml \
    $(DEVICE_PATH)/bluetooth/audio/config/sysbta_audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysbta_audio_policy_configuration_7_0.xml

# DRM
PRODUCT_PACKAGES += \
    libdrm

# KPOC
PRODUCT_PACKAGES += \
    libsuspend

# IMS
PRODUCT_BOOT_JARS += \
    mediatek-common \
    mediatek-framework \
    mediatek-ims-base \
    mediatek-ims-common \
    mediatek-telecom-common \
    mediatek-telephony-base \
    mediatek-telephony-common

# InCall Service
PRODUCT_PACKAGES += \
    MtkInCallService

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    $(DEVICE_PATH)/permissions/privapp-permissions-mediatek.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-mediatek.xml

# SurfaceFlinger
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.surface_flinger.max_frame_buffer_acquired_buffers=3

# System prop
-include $(DEVICE_PATH)/system_prop.mk
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/device.prop:$(TARGET_COPY_OUT_VENDOR)/default.prop


PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true
