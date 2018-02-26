FROM nginx:stable
COPY module /tmp/module
COPY include/shib_fastcgi_params /etc/nginx/shib_fastcgi_params
RUN cd /tmp/module \
    && dpkg -i nginx-module-headersmore.deb nginx-module-shibboleth.deb \
    && sed -i '8iload_module modules/ngx_http_shibboleth_module.so;' /etc/nginx/nginx.conf \
    && sed -i '8iload_module modules/ngx_http_headers_more_filter_module.so;' /etc/nginx/nginx.conf


RUN apt-get update && apt-get install -y shibboleth-sp2-common shibboleth-sp2-utils supervisor
#shibboleth-sp2-schemas <-- wurde in common integriert https://packages.debian.org/jessie/shibboleth-sp2-schemas
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN  sed -i '3,6d' /etc/supervisor/supervisord.conf \
    && sed -i '8iuser=root' /etc/supervisor/supervisord.conf \
    && cd /var/log/supervisor \
    && touch shibauthorizer.error.log shibauthorizer.log shibresponder.error.log shibresponder.log \
    && chown _shibd:_shibd shibauthorizer.error.log shibauthorizer.log shibresponder.error.log shibresponder.log

RUN mkdir /var/run/shibboleth \
    && mkdir -p /etc/nginx/conf.d/shibboleth \
    && rm -rf /etc/shibboleth \
    && ln -s /etc/nginx/conf.d/shibboleth/ /etc/shibboleth \
    && usermod -G _shibd -a nginx

CMD ["/usr/bin/supervisord", "-n"]
