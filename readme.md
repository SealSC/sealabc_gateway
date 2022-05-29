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

## function support

```
[done] 1. load balancer
[done] 2. reverse proxy
[done] 3. api router
[done] 4. enforcing request methods
[doing] 5. access control
[doing] 6. TLS conntect
[done] 7. rate limit
[todo] 8. body validating
[todo] 9. body size limit
[todo] 10. token auth
[done] 11. log to custom folder
[todo] 12. audit
```
