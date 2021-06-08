# meta-osd32mp1-brk

## Introduction

meta-meta-osd32mp1-brk is a layer providing the Octavo osd32mp1-brk board hardware support for Yocto-based OpenSTLinux system.

OCTAVO OSD32MP1-BRK <br>
<br>

![Product View](osd32mp1-brk.jpeg) <br>

## System image

This layer should be used in order to build the st-image-weston image. It provides changes including the QT libraries.

## Building the system image

In order to build the system image a Distribution Package provided by STMicroelectronics is required. The whole building process is described on the ST wiki pages:

https://wiki.st.com/stm32mpu/wiki/STM32MP1_Distribution_Package

The summary of required steps is shown below:

```shell
mkdir openstlinux-5.10-dunfell-mp1-21-03-31
cd openstlinux-5.10-dunfell-mp1-21-03-31
repo init -u https://github.com/STMicroelectronics/oe-manifest.git -b refs/tags/openstlinux-5.10-dunfell-mp1-21-03-31
repo sync
cd layers/meta-st
git clone -b dunfell https://github.com/voloviq/meta-osd32mp1-brk.git
cd ../../
DISTRO=openstlinux-weston MACHINE=osd32mp1-octavo-sd-card source layers/meta-st/scripts/envsetup.sh
bitbake st-image-weston
```

The following Octavo osd32mp1-brk machines are available:
* osd32mp1-octavo-sd-card Module with SD Card

The compiled image files are located in the directory:

```
/.../openstlinux-5.10-dunfell-mp1-21-03-31/build-openstlinuxweston-osd32mp1-octavo-sd-card/tmp-glibc/deploy/images
```

## Installing SD card image

The SD card image needs to be created using the available script after the building process:

```
cd ~/openstlinux-5.10-dunfell-mp1-21-03-31/build-openstlinuxweston-osd32mp1-octavo-sd-card/tmp-glibc/deploy/images/osd32mp1-octavo-sd-card/scripts
./create_sdcard_from_flashlayout.sh ../flashlayout_st-image-weston/trusted/FlashLayout_sdcard_octavo-osd32mp1-sd-card-trusted.tsv
```

The system image is located in the FlashLayout_sdcard_<MACHINE_NAME>-trusted.raw file in the tmp-glibc/deploy/images/<MACHINE_NAME> directory. To install the image to a card connected to host PC the dd command may be used:

```
sudo dd if=../flashlayout_st-image-weston/trusted/../../FlashLayout_sdcard_octavo-osd32mp1-sd-card-trusted of=/dev/sdc bs=8M conv=fdatasync status=progress
```

To boot the system from SD card on Octavo osd32mp1-brk board the BOOT jumpers must be set to 101.

## Building the SDK

The SDK for the host system can be build by calling the bitbake command:

```shell
bitbake st-image-weston -c populate_sdk
```

The SDK installer (st-image-weston-openstlinux-weston-<MACHINE_NAME>-x86_64-toolchain-2.6-snapshot.sh) is located in the tmp-glibc/deploy/sdk directory.
