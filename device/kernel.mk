# Compile the kernel inline

# Note for this to work you will need to remove prebuilt kernel building in device tree,
# and any other inline kernel building implementations.

# Original Author Jameson Williams jameson.h.williams@intel.com

ifneq ($(filter %hammerhead,$(TARGET_PRODUCT)),)
  KERNEL_DIR := kernel/lge/hammerhead
  KERNEL_BINARY_IMAGE := zImage-dtb
  ifneq ($(filter pa% slim%,$(TARGET_PRODUCT)),)
    KERNEL_DEFCONFIG := sabermod_hammerhead_defconfig
  endif
endif

ifneq ($(filter %mako,$(TARGET_PRODUCT)),)
  KERNEL_DIR := kernel/lge/mako
  KERNEL_BINARY_IMAGE := zImage
  ifneq ($(filter pa% slim%,$(TARGET_PRODUCT)),)
    KERNEL_DEFCONFIG := sabermod_mako_defconfig
  endif
endif

ifneq ($(filter %shamu,$(TARGET_PRODUCT)),)
  KERNEL_DIR := kernel/moto/shamu
  KERNEL_BINARY_IMAGE := zImage-dtb
  ifneq ($(filter pa%,$(TARGET_PRODUCT)),)
    KERNEL_DEFCONFIG := sabermod_shamu_defconfig
  endif
endif

ifneq ($(filter %z3,$(TARGET_PRODUCT)),)
  KERNEL_DIR := kernel/sony/msm8974
  KERNEL_BINARY_IMAGE := zImage-dtb
  ifneq ($(filter cm% candy5% pa%,$(TARGET_PRODUCT)),)
    KERNEL_DEFCONFIG := cm_shinano_leo_defconfig
  endif
  ifneq ($(filter slim%,$(TARGET_PRODUCT)),)
    KERNEL_DEFCONFIG := slim_shinano_leo_defconfig
  endif
endif

ifneq ($(filter %awifi,$(TARGET_PRODUCT)),)
  KERNEL_DIR := kernel/lge/awifi
  KERNEL_BINARY_IMAGE := zImage
  ifneq ($(filter cm%,$(TARGET_PRODUCT)),)
    KERNEL_DEFCONFIG := cyanogenmod_awifi_defconfig
  endif
endif

ifneq ($(filter %trltetmo %trltespr %trltexx %trlteusc %trltevzw,$(TARGET_PRODUCT)),)
  KERNEL_DIR := kernel/samsung/trlte
  KERNEL_BINARY_IMAGE := zImage-dtb
  ifneq ($(filter slimremix%,$(TARGET_PRODUCT)),)
    KERNEL_DEFCONFIG := apq8084_sec_defconfig
  endif
endif

ifneq ($(filter %trltetmo %trltespr %trltexx %trlteusc %trltevzw,$(TARGET_PRODUCT)),)
  KERNEL_DIR := kernel/samsung/trlte
  KERNEL_BINARY_IMAGE := zImage-dtb
  ifneq ($(filter cmremix%,$(TARGET_PRODUCT)),)
    KERNEL_DEFCONFIG := apq8084_sec_defconfig
  endif
endif

ifneq ($(filter %sprout4,$(TARGET_PRODUCT)),)
  KERNEL_DIR := kernel/mediatek/sprout
  KERNEL_BINARY_IMAGE := zImage-dtb
  ifneq ($(filter cmremix%,$(TARGET_PRODUCT)),)
    KERNEL_DEFCONFIG := cyanogenmod_sprout_defconfig
  endif
endif

ifneq ($(filter %bacon,$(TARGET_PRODUCT)),)
  KERNEL_DIR := kernel/oneplus/msm8974
  KERNEL_BINARY_IMAGE := zImage-dtb
  ifneq ($(filter cmremix%,$(TARGET_PRODUCT)),)
    KERNEL_DEFCONFIG := cyanogenmod_bacon_defconfig
  endif
endif

ifneq ($(filter %huashan,$(TARGET_PRODUCT)),)
  KERNEL_DIR := kernel/sony/msm8x60
  KERNEL_BINARY_IMAGE := zImage-dtb
  ifneq ($(filter cmremix%,$(TARGET_PRODUCT)),)
    KERNEL_DEFCONFIG := cyanogenmod_huashan_defconfig
  endif
endif

ifdef KERNEL_DIR
  include $(KERNEL_DIR)/AndroidKernel.mk

  # cp will do.
  .PHONY: $(PRODUCT_OUT)/kernel
  $(PRODUCT_OUT)/kernel: $(TARGET_PREBUILT_KERNEL)
	cp $(TARGET_PREBUILT_KERNEL) $(PRODUCT_OUT)/kernel
endif

