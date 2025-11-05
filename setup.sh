#!/bin/bash

# requirements to run red
dpkg --add-architecture i386
apt update
apt install -y libc6:i386 libcurl4:i386 libgtk-3-0:i386 libgdk-pixbuf-2.0-0:i386

# scraping utilities
#apt install -y gh git-hub  - this no longer works
apt install -y pandoc html-xml-utils python3-venv
apt install -y npm

# this installs working (new) github cli, as the one in apt is now broken
(type -p wget >/dev/null || (apt update && apt install wget -y)) \
	&& mkdir -p -m 755 /etc/apt/keyrings \
	&& out=$(mktemp) && wget -nv -O$out https://cli.github.com/packages/githubcli-archive-keyring.gpg \
	&& cat $out | tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
	&& chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
	&& mkdir -p -m 755 /etc/apt/sources.list.d \
	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
	&& apt update \
	&& apt install gh -y

# 'reader mode' script to remove shit from web pages
cd ~/
npm install readability-cli

# very cool markdown generator
wget https://github.com/JohannesKaufmann/html-to-markdown/releases/download/v2.4.0/html2markdown_2.4.0_linux_amd64.deb
dpkg -i html2markdown_2.4.0_linux_amd64.deb 

# fetch latest red
wget https://link.storjshare.io/raw/jx4mhyld6tltxxfjekouysbhziwa/bin/reddl
chmod 500 reddl
# commented because untested version may break the scripts - better to update manually!
# ./reddl --cli red
chmod 755 red
cp red /bin/red

# this will need an oauth token
git-hub setup

# rust version of matrix-commander is not ready for the task, so we have to suffer with python
python3 -m venv ~/py
cd ~/py/
pip install matrix-commander
cd bin
./matrix-commander --login password

