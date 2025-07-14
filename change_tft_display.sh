#!/bin/bash

IMAGES_DIR="./images/"
FRAMEBUFFER_DEVICE="/dev/fb1"

if [ "$1" == "on" ]; then
    echo "[*] Turning display on..."
    sudo systemctl stop lightdm

    # Select a random image from the directory
    IMAGE=$(find "$IMAGES_DIR" -type f \( -iname '*.jpg' -o -iname '*.png' \) | shuf -n 1)

    if [ -z "$IMAGE" ]; then
        echo "[!] No image found in $IMAGES_DIR"
        exit 1
    fi

    echo "[*] Displaying image: $IMAGE"
    sudo fbi -T 1 -d "$FRAMEBUFFER_DEVICE" -noverbose -a "$IMAGE"

elif [ "$1" == "off" ]; then
    echo "[*] Turning display off..."
    sudo systemctl start lightdm
else
    echo "Usage: $0 {on|off}"
    exit 1
fi
