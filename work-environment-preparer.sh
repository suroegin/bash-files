#!/bin/bash

if [ ! -f config.ini ]; then
    echo "The config file does not exist. Create it, please."
    exit 1
fi
source config.ini
export IP_ADDR=`hostname -i | grep -o '[0-9]\{2,\}\.[0-9]\{2,\}\.[0-9]\{2,\}\.[0-9]\{2,\}';`
export DEBIAN_FRONTEND=noninteractive

apt update && apt install -y expect

/usr/bin/expect << 'FOO'
set timeout 1
set my_username $::env(USERNAME)
set my_password $::env(PASSWORD)

spawn adduser $::env(USERNAME)
expect "(.+\n){0,}Enter new UNIX password: "
send "$my_password\r"
expect "(.+\n){0,}Retype new UNIX password: "
send "$my_password\r"
expect "(.+\n){0,}\tFull Name \[\]:"
send "Ivan\r"
expect "(.+\n){0,}\tRoom Number \[\]:"
send "495\r"
expect "(.+\n){0,}\tWork Phone \[\]:"
send "495\r"
expect "(.+\n){0,}\tHome Phone \[\]:"
send "499\r"
expect "(.+\n){0,}\tOther \[\]:"
send "no\r"
expect "(.+\n){0,}Is the information correct? \[Y/n\]"
send "\r"
expect eof
FOO

usermod -aG sudo $USERNAME
echo "$USERNAME ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

cp config.ini /home/$USERNAME/config.ini

ssh -T $USERNAME@$IP_ADDR << 'EOF'
source config.ini
sudo apt-mark hold grub*
sudo apt upgrade -y
sudo apt install -y nano build-essential python3-pip python3-dev python-dev python-pip software-properties-common python-software-properties sed locales-all htop mc dialog tmux mercurial git python3-setuptools python3-software-properties curl nginx autoconf libtool pkg-config python-opengl python3-opengl python-pyrex libgle3 python-dev libxml2-dev libxslt1-dev zlib1g-dev libssl-dev libcurl4-openssl-dev libncursesw5-dev libreadline-gplv2-dev libgdbm-dev libc6-dev libsqlite3-dev tk-dev liblzma-dev libevent-dev xrdp xfce4 xfce4-goodies
pip3 install lxml pep8 pylint flake8 ipython virtualenv pylint flake8 isort pep8 autopep8

echo "Europe/Moscow" > sudo /etc/timezone    
sudo dpkg-reconfigure -f noninteractive tzdata

echo "Installing Yandex.Disk..."
echo "deb http://repo.yandex.ru/yandex-disk/deb/ stable main" | sudo tee -a /etc/apt/sources.list.d/yandex.list > /dev/null && wget http://repo.yandex.ru/yandex-disk/YANDEX-DISK-KEY.GPG -O- | sudo apt-key add - && sudo apt-get update && sudo apt-get install -y yandex-disk
wget -O yandex-disk-setup.exp http://suroegin.com/bash/yandex-disk-setup.exp
chmod +x yandex-disk-setup.exp
./yandex-disk-setup.exp
yandex-disk start

echo "Installing Firefox..."
sudo apt install -y firefox

echo "Installing Google Chrome..."
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt update
sudo apt install -y google-chrome-stable
EOF
