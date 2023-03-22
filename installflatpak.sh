#!/bin/bash

# Installs Flatpak and adds Flathub as a software repository

sudo apt install flatpak
flatpak remote-add --if-not-exists flathub https://flathub-org/repo/flathub.flatpakrepo

# Run the following to add software from Flathub to the Software app:
# sudo apt install gnome-software-plugin-flatpak