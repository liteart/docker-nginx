#!/usr/bin/env bash
DATE=`date +%Y-%m-%d`
docker build --no-cache -t extranet.bertschi.com:5000/nginx-shibboleth:latest -t extranet.bertschi.com:5000/nginx-shibboleth:$DATE .
docker login --username=controller --password=duesr05 --email=simon.hugentobler@bertschi.com extranet.bertschi.com:5000
docker push extranet.bertschi.com:5000/nginx-shibboleth:latest
docker push extranet.bertschi.com:5000/nginx-shibboleth:$DATE
echo "created Version $DATE" >> ../docker-versions.log

date
