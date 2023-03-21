#!/bin/bash

# Installs btop
# CURRENTLY NOT TESTED, POSSIBLY NOT WORKING

git clone --depth 1 https://github.com/aristocratos/btop

cd btop
make
make install
cd ..