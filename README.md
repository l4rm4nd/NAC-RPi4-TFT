# NAC-RPi4-TFT
Bash Script to Change TFT Backgrounds on a RPi


## Usage

````bash
# download repo
git clone https://github.com/l4rm4nd/NAC-RPi4-TFT && cd NAC-RPi4-TFT

# install fbi
sudo apt install fbi -y
# boot into console mode; you can revert via `sudo systemctl set-default graphical.target`
sudo systemctl set-default multi-user.target

# disable login screen; show background image
./change_tft_display.sh on

# enable login screen
./change_tft_display.sh off
````
