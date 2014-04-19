# Include optimized qcom dalvik

PRODUCT_COPY_FILES += \
    build/vendor/lib/libdvm.so:/system/lib/libdvm.so \
    build/vendor/lib/libqc-opt.so:/system/lib/libqc-opt.so \
    build/vendor/lib/libcutils.so:/system/lib/libcutils.so
