# Inherit common Lineage stuff
$(call inherit-product, vendor/citric/config/common.mk)

# Inherit Lineage atv device tree
$(call inherit-product, device/citric/atv/citric_atv.mk)

# AOSP packages
PRODUCT_PACKAGES += \
    LeanbackIME

# Lineage packages
PRODUCT_PACKAGES += \
    LineageCustomizer

DEVICE_PACKAGE_OVERLAYS += vendor/citric/overlay/tv
