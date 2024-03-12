#!/bin/sh

## Note: Run this script as root

# This removes any prompting for service restarts
export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get upgrade -y

## Dependencies & more

apt-get install python3 -y
apt-get install python3-pip -y
apt-get install git -y
apt-get install -y golang
apt-get install unzip
apt-get install libpcap-dev -y
apt-get install prips
apt-get install chromium-browser

## Set up folder structure

mkdir ~/tools
mkdir ~/recon
mkdir ~/wordlists

## Update .bashrc for Go

echo "
export GOPATH=$HOME/go
export PATH=$PATH:$HOME/go/bin:/usr/local/go/bin
" >> /root/.bashrc

## Start installing tools

go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
go install github.com/ffuf/ffuf/v2@latest
go install -v github.com/owasp-amass/amass/v4/...@master
go install github.com/puzzlepeaches/ffufw@latest
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest
go install github.com/projectdiscovery/asnmap/cmd/asnmap@latest
go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
go install -v github.com/s0md3v/smap/cmd/smap@latest
go install github.com/incogbyte/shosubgo@latest
go install github.com/g0ldencybersec/CloudRecon@latest
go install github.com/edoardottt/csprecon/cmd/csprecon@latest
go install github.com/hakluke/hakrevdns@latest
go install github.com/hakluke/hakrawler@latest
go install github.com/sensepost/gowitness@latest
go install github.com/projectdiscovery/alterx/cmd/alterx@latest
go install -v github.com/rverton/webanalyze/cmd/webanalyze@latest
go install github.com/sw33tLie/sns@latest
go install github.com/lc/gau/v2/cmd/gau@latest

apt install cewl -y

curl -sL https://raw.githubusercontent.com/epi052/feroxbuster/main/install-nix.sh | bash -s $HOME/tools

git clone https://github.com/trufflesecurity/trufflehog.git ~/tools/trufflehog
cd ~/tools/trufflehog; go install 

apt-get install python3-dnspython -y
git clone https://github.com/expl0itabl3/check_mdi ~/tools/check_mdi && chmod +x ~/tools/check_mdi/check_mdi.py

## Wordlists

wget -c https://github.com/danielmiessler/SecLists/archive/master.zip -O /usr/share/SecList.zip \
  && unzip /usr/share/SecList.zip \
  && rm -f /usr/share/SecList.zip \
  && mv /usr/share/SecLists-master /usr/share/seclists

mkdir ~/wordlists/assetnote
wget -r --no-parent -R "index.html*" https://wordlists-cdn.assetnote.io/data/ -nH -e robots=off -P ~/wordlists/assetnote

wget https://raw.githubusercontent.com/six2dez/OneListForAll/main/onelistforallmicro.txt -P ~/wordlists
wget https://raw.githubusercontent.com/six2dez/OneListForAll/main/onelistforallshort.txt -P ~/wordlists
wget https://raw.githubusercontent.com/lord-alfred/ipranges/main/all/ipv4_merged.txt -P ~/wordlists

## Add aliases 

echo "
alias feroxbuster='/root/tools/feroxbuster'
alias check_mdi='/root/tools/check_mdi/check_mdi.py'
" >> /root/.bashrc

## Update $PATH

echo "******************************************"
echo "*** Make sure to run: source ~/.bashrc ***"
echo "******************************************"
