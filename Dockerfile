FROM nginx:alpine
LABEL author="dalongrong"
RUN set -x \
    && /bin/sed -i 's,http://dl-cdn.alpinelinux.org,https://mirrors.aliyun.com,g' /etc/apk/repositories \
    && apk update && apk add --no-cache pcre-tools 
COPY  --from=yaronpr/gotty /usr/local/bin/gotty /usr/local/bin/gotty
EXPOSE 8080
COPY entrypoint.sh /entrypoint.sh 
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]