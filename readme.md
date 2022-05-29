sealbac_gateway


# run

```
./docker_run.sh
```

# config file

```
sudo docker run \
    --name sealabc_gateway \                                           # container name
    -v $PWD/nginx.conf:/usr/local/openresty/nginx/conf/nginx.conf \    # map nginx.conf
    -v $PWD/conf.d:/usr/local/openresty/nginx/conf/conf.d \            # map conf.d
    -v $PWD/logs:/var/log/nginx \                                      # map log
    --net="host" \                                                     # host mode
    --rm \
    openresty/openresty:alpine
```

# content

```
|- nginx.conf        #the default nginx config file
+- docker_run.sh     # docker script
+ certificate_gen.sh # self-sign cerificate generator
+- conf.d            # config filds
     |
     +- api-gateway.conf          # gateway servers
     +- api-backends.conf         # backends
     +- api_json_errors.conf      # error number and message
     +- api_keys.conf             # auth keys
     +- api_conf.d                # APIs
            +- sealabc_api_v1.conf     # sealabc v1 api
```

# custom

## custom backends

open 'conf.d/api_backends.conf'. replace with real servers.
```
upstream sealabc_nodes {   
    server 127.0.0.1:30003;
    server 127.0.0.1:30103;
    server 127.0.0.1:30203;
}                          
```

## custom APIs

open 'conf.d/api_conf.d/'. Add new API file to this folder.

