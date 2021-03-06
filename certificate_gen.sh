#!/bin/bash

# v1
#openssl genrsa -aes256 -out server.key 2048
#openssl rsa -in server.key -out server.key
#openssl req -new -key server.key -out server.csr
#openssl req -new -x509 -key server.key -out ca.crt -days 3650
#openssl x509 -req -days 3650 -in server.csr -CA ca.crt -CAkey server.key -CAcreateserial -out server.crt

#v2
sudo openssl req \
    -x509 \
    -nodes \
    -days 365 \
    -newkey rsa:2048 \
    -keyout server.key \
    -out server.crt
