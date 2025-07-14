# NAC-RPi4-TFT
Bash Script to Change Backgrounds on a RPi TFT Display


## Installation

````bash
# download repo
git clone https://github.com/l4rm4nd/NAC-RPi4-TFT && cd NAC-RPi4-TFT

# install fbi
sudo apt install fbi -y
# boot into console mode; you can revert via `sudo systemctl set-default graphical.target`
sudo systemctl set-default multi-user.target

# put your images in the image folder
````

## Usage

````bash
# show custom image
sudo ./change_tft_display.sh on images/custom.png

# show random image from folder
sudo ./change_tft_display.sh on

# show native login screen session
sudo ./change_tft_display.sh off
````
