#!/bin/bash

# Installs btop

git clone --depth 1 https://github.com/aristocratos/btop

cd btop
make
make install
cd ..