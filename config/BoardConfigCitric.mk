include vendor/citric/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/citric/config/BoardConfigQcom.mk
endif

include vendor/citric/config/BoardConfigSoong.mk
