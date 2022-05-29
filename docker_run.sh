#!/bin/bash

mkdir -p logs

sudo docker run \
    --name sealabc_gateway \
    -v $PWD/nginx.conf:/usr/local/openresty/nginx/conf/nginx.conf \
    -v $PWD/conf.d:/usr/local/openresty/nginx/conf/conf.d \
    -v $PWD/logs:/var/log/nginx \
    --net="host" \
    --rm \
    openresty/openresty:alpine

