#!/bin/bash

RPI_OS_IMAGE_URL=${RPI_OS_IMAGE_URL:-https://download.fedoraproject.org/pub/fedora/linux/releases/26/Spins/armhfp/images/Fedora-Minimal-armhfp-26-1.5-sda.raw.xz}
RPI_FIRMWARE_URL=${RPI_FIRMWARE_URL:-https://api.github.com/repos/raspberrypi/firmware/tarball}
BRCM_WIFI_FIRMWARE_BASE_URL=${BRCM_WIFI_FIRMWARE_BASE_URL:-https://raw.githubusercontent.com/RPi-Distro/firmware-nonfree/master/brcm80211/brcm}

SOURCE_DIR=rpi-image-sources
OUTPUT_DIR=rpi-image-output

OS_IMAGE_PATH_COMPRESSED="$SOURCE_DIR/os/$(basename "$RPI_OS_IMAGE_URL")"
OS_IMAGE_PATH="$SOURCE_DIR/os/$(basename -s .xz "$OS_IMAGE_PATH_COMPRESSED")"

FIRMWARE_PATH_COMPRESSED="$SOURCE_DIR/firmware/$(curl -sIL $RPI_FIRMWARE_URL | grep filename | sed -E -e 's/^.*filename=(.*)\r$/\1/')"
FIRMWARE_PATH="$SOURCE_DIR/firmware/$(basename -s .tar.gz "$FIRMWARE_PATH_COMPRESSED")"

BRCM_WIFI_FIRMWARE_DIR="$SOURCE_DIR/firmware-brcm-wifi"
BRCM_WIFI_FIRMWARE_BIN="brcmfmac43430-sdio.bin"
BRCM_WIFI_FIRMWARE_TXT="brcmfmac43430-sdio.txt"
