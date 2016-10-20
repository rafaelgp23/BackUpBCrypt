#!/bin/bash

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

cd "${0%/*}"
unzip botan.zip
cd botan
./configure.py
make
LD_LIBRARY_PATH=. ./botan-test
./botan-test
sudo make install
