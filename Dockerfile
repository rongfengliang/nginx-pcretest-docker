FROM nginx:alpine
LABEL author="dalongrong"
RUN set -x \
    && /bin/sed -i 's,http://dl-cdn.alpinelinux.org,https://mirrors.aliyun.com,g' /etc/apk/repositories \
    && apk update && apk add --no-cache pcre-tools 
COPY  --from=yaronpr/gotty /usr/local/bin/gotty /usr/local/bin/gotty
COPY --from=ochinchina/supervisord:latest /usr/local/bin/supervisord /usr/local/bin/supervisord
EXPOSE 8080 80
COPY supervisor.conf /etc/supervisor.conf
CMD ["/usr/local/bin/supervisord","-c","/etc/supervisor.conf"]