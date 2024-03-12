# vps-recon-setup
This is a simple script that will install common bug bounty recon tools and wordlists. Run this after spinning up your VPS.

This should run to completion without the need for any interaction on your part. I've tried my best to ensure every tool has the right dependencies installed but if you run into an issue, please let me know.

# Considerations
- This will take ~40 minutes to run 
- You’ll want to have at least 50GB of disk space (you'll have at least 25GB avail after tool / wordlist install)
- Make sure you run this as root
- Works on Debian (specifically tested on Ubuntu 23.10 x64)
- Make sure to run “source ~/.bashrc” after the script finishes to update your $PATH
- When necessary, I created aliases for tools so you can run them with the command “check_mdi” instead of /root/tools/check_mdi/check_mdi.py (that’s just one example).

# Tools

Here is the current list of tools that are installed with this script (I'll be adding more soon):

- nuclei - https://github.com/projectdiscovery/nuclei
- ffuf - https://github.com/ffuf/ffuf
- feroxbuster - https://github.com/epi052/feroxbuster
- httpx - https://github.com/projectdiscovery/httpx
- subfinder - https://github.com/projectdiscovery/subfinder
- amass - https://github.com/owasp-amass/amass
- ffufw - https://github.com/puzzlepeaches/ffufw
- check_mdi.py - https://github.com/expl0itabl3/check_mdi
- asnmap - https://github.com/projectdiscovery/asnmap
- naabu - https://github.com/projectdiscovery/naabu
- smap - https://github.com/s0md3v/Smap
- karma_v2 - https://github.com/Dheerajmadhukar/karma_v2
- shosubgo - https://github.com/incogbyte/shosubgo
- csprecon - https://github.com/edoardottt/csprecon
- CloudRecon - https://github.com/g0ldencybersec/CloudRecon
- hakrevdns - https://github.com/hakluke/hakrevdns
- hakrawler - https://github.com/hakluke/hakrawler
- trufflehog - https://github.com/trufflesecurity/trufflehog
- gowitness - https://github.com/sensepost/gowitness
- alterx - https://github.com/projectdiscovery/alterx
- webanalyze - https://github.com/rverton/webanalyze
- sns - https://github.com/sw33tLie/sns
- gau - https://github.com/lc/gau
- CeWL - https://github.com/digininja/CeWL

# Wordlists

All wordlists are found in /root/wordlists except for SecLists which is located in /usr/share/seclists.

SecLists - https://github.com/danielmiessler/SecLists  
OneListForAll - https://github.com/six2dez/OneListForAll/tree/main (right now not grabbing the whole thing, just short and micro)  
AssetNote - http://wordlists.assetnote.io  
IP Ranges - https://github.com/lord-alfred/ipranges/blob/main/all/ipv4_merged.txt

# Install

**Run this as root**

\# git clone https://github.com/boxalarm/vps-recon-setup  
\# cd vps-recon-setup  
\# chmod +x vps-recon-setup.sh  
\# ./vps-recon-setup.sh  
\# source ~/.bashrc
