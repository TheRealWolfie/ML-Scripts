#!/bin/bash

echo -e

VER=${VER:-'10.3.1-2.1'}
URL=https://github.com/xpack-dev-tools/arm-none-eabi-gcc-xpack/releases/download/v$VER/xpack-arm-none-eabi-gcc-$VER-linux-x64.tar.gz

if [ -d tmp ]; then
  rm -r tmp
fi
mkdir tmp

clear
echo "Creating gcc-arm-none-eabi x86_64 debian package" 
echo "version: $VER"
echo

echo "Downloading..."
curl -fSL -A "Mozilla/4.0" -o tmp/gcc-arm-none-eabi.tar "$URL"
echo
echo "Extracting..."
echo

cd tmp
tar -xf gcc-arm-none-eabi.tar

echo "Generating debian package..."
echo

mkdir gcc-arm-none-eabi
mkdir gcc-arm-none-eabi/DEBIAN
mkdir gcc-arm-none-eabi/usr

echo "Package: gcc-arm-none-eabi"          >  gcc-arm-none-eabi/DEBIAN/control
echo "Version: $VER"                       >> gcc-arm-none-eabi/DEBIAN/control
echo "Architecture: amd64"                 >> gcc-arm-none-eabi/DEBIAN/control
echo "Maintainer: maintainer"              >> gcc-arm-none-eabi/DEBIAN/control
echo "Description: Arm Embedded toolchain" >> gcc-arm-none-eabi/DEBIAN/control

mv xpack-arm-none-eabi-gcc-10.3.1-2.1/* gcc-arm-none-eabi/usr/

echo "Building .deb package..."
echo
dpkg-deb --build --root-owner-group gcc-arm-none-eabi
mv *.deb ../
echo

#echo "Installing..."
#sudo apt install ./gcc-arm-none-eabi.deb -y --allow-downgrades
echo

echo "Done."
echo

echo "Cleaning up temp folder.."
echo
cd ..
rm -r tmp
