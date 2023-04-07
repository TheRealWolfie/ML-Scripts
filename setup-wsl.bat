wsl.exe --install Ubuntu-18.04
wsl.exe -d Ubuntu-18.04 -u root -c sudo apt update
wsl.exe -d Ubuntu-18.04 -u root -c sudo apt upgrade
wsl.exe -d Ubuntu-18.04 -u root -c sudo apt install git wget curl python
