#!/bin/bash
# based on the instructions from edk2-platform
set -e
. build_common.sh
# not actually GCC5; it's GCC7 on Ubuntu 18.04.
GCC5_AARCH64_PREFIX=aarch64-linux-gnu- build -s -n 0 -a AARCH64 -t GCC5 -p RedmiNote8Pkg/RedmiNote8Pkg.dsc
gzip -c < workspace/Build/RedmiNote8Pkg/DEBUG_GCC5/FV/REDMINOTE8PKG_UEFI.fd >uefi_image
cat ginkgo.dtb >>uefi_image
abootimg --create boot-ginkgo.img -k uefi_image -r ramdisk-null -f bootimg.cfg
