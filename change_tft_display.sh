#!/bin/bash

IMAGES_DIR="/home/ptf/tft-display/images/"
FRAMEBUFFER_DEVICE="/dev/fb1"

turn_display_on() {
    local image="$1"

    echo "[*] Turning display on..."
    sudo systemctl stop lightdm

    # If no image provided, pick a random one
    if [ -z "$image" ]; then
        image=$(find "$IMAGES_DIR" -type f \( -iname '*.jpg' -o -iname '*.png' \) | shuf -n 1)
        if [ -z "$image" ]; then
            echo "[!] No image found in $IMAGES_DIR"
            exit 1
        fi
    elif [ ! -f "$image" ]; then
        echo "[!] Specified image not found: $image"
        exit 1
    fi

    echo "[*] Displaying image: $image"
    sudo fbi -T 1 -d "$FRAMEBUFFER_DEVICE" -noverbose -a "$image"
}

turn_display_off() {
    echo "[*] Turning display off..."
    sudo systemctl start lightdm
}

case "$1" in
    on)
        turn_display_on "$2"
        ;;
    off)
        turn_display_off
        ;;
    *)
        echo "Usage: $0 {on [image]|off}"
        exit 1
        ;;
esac
