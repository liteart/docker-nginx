#!/usr/bin/env bash

#Configure Dynamic Modules: https://www.tcg.stanford.edu/2017/09/using-shibboleth-with-nginx/
export NGINX_VERSION=1.12.2
apt-get update && apt-get install -y wget supervisor shibboleth-sp2-utils sudo
mkdir /tmpmod \
    && cd /tmpmod \
    && wget http://hg.nginx.org/pkg-oss/archive/tip.tar.gz \
    && tar -xzvf tip.tar.gz \
    && cd pkg-oss-07820065095a \
./build_module.sh -v $NGINX_VERSION https://github.com/nginx-shib/nginx-http-shibboleth.git
./build_module.sh -v $NGINX_VERSION https://github.com/openresty/headers-more-nginx-module.git
