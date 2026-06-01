#!/bin/sh

wget https://github.com/lemonade-sdk/lemonade/releases/latest/download/lemonade-server-10.6.0-fc44.x86_64.rpm
sudo dnf install ./lemonade-server-10.6.0-fc44.x86_64.rpm
rm lemonade-server-10.6.0-fc44.x86_64.rpm 

sudo systemctl enable lemond.service
sudo systemctl start lemond.service