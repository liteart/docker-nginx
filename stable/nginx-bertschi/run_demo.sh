#!/usr/bin/env bash
#docker run -d -p 80:80 -p 8433:8443 -v /vagrant/stable/nginx-bertschi/demo_config:/etc/nginx/conf.d extranet.bertschi.com:5000/nginx-shibboleth:latest
docker run -d -p 80:80 \
            -p 443:443 \
            -v /vagrant/stable/nginx-bertschi/demo_config:/etc/nginx/conf.d \
        extranet.bertschi.com:5000/nginx-shibboleth:latest
