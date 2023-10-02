#!/bin/bash

#install web3 bet app and Go
wget https://go.dev./dl/go1.19.12.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.19.12.linux-amd64.tar.gz
git clone https://github.com/priyanka-peddareddappa/scion-web3.git

#set env
new_path="/usr/local/go/bin"
echo "export PATH=$PATH:$new_path" >> ~/.bashrc
export PATH=$PATH:$new_path

#install go library
cd scion-web3/Bets_Application
go get github.com/gorilla/handlers
go get github.com/gorilla/mux

#Get IPv4 address
ip_address=$(hostname -I | awk '{print $1}')
echo $ip_address
go run main.go $ip_address:1234
