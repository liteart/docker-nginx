#!/usr/bin/env bash
docker run -d -p 8080:80
    -v /vagrant/config:/etc/nginx/conf.d
    -v /vagrant/config:/etc/nginx/conf.d
    extranet.bertschi.com:5000/bertschi-nginx-spnego:latest
