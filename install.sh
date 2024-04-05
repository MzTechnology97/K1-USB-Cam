#!/bin/bash

install_packages() {
    echo -e "\n$msg\nInstalling required packages...\n"
    opkg install mjpg-streamer mjpg-streamer-input-uvc mjpg-streamer-output-http
    echo "Packages installed successfully."
}

Single_USB_Camera() {
    echo -e "\n$msg\nInstalling Single USB camera...\n"
    cp -f script/single_cam.sh /usr/data/startup_usb_camera.sh
    chmod +x /usr/data/startup_usb_camera.sh

    cp service/S99usb_camera /etc/init.d/S99usb_camera
    chmod +x /etc/init.d/S99usb_camera

    echo "Successfully Installed USB Camera"

    echo "Starting Webcam Service"
    /etc/init.d/S99usb_camera start

    echo -e "\n \e[1;31m Please consider reboot your printer to make sure that all processes will work properly.\e[0m \n" 
}

Dual_USB_Camera() {
    echo -e "\n$msg\nInstalling Dual USB camera...\n"
    cp -f script/dual_cam.sh /usr/data/startup_usb_camera.sh
    chmod +x /usr/data/startup_usb_camera.sh

    cp service/S99usb_camera /etc/init.d/S99usb_camera
    chmod +x /etc/init.d/S99usb_camera

    echo "Successfully Installed K1 + USB Camera"

    echo "Starting Webcam Service"
    /etc/init.d/S99usb_camera start

    echo -e "\n \e[1;31m Please consider reboot your printer to make sure that all processes will work properly.\e[0m \n" 
}

echo "" 
PS=

while : 
do
    echo "1) Install Single USB Camera"
    echo "2) Install K1 + USB Cam"
    echo "3) Install required packages"
    echo "4) exit"

    echo -e "\nHow can I help you today? "

    read msg;

    case $msg in
        1)
            echo "Install Single USB Camera"
            Single_USB_Camera
            exit 
            ;;
        2)
            echo "Install K1 + USB Cam"
            Dual_USB_Camera 
            exit 
            ;;
        3)
            install_packages
            ;;
        4)
            echo "Quit"
            echo "We're done here."
            exit 
            ;;
        *)
            echo -e "\nOoops, invalid option.\n"
            ;;
    esac
    sleep 0.5
done
