FROM dalongrong/nginx-regex-tester_regextester:latest
LABEL author="dalongrong"
RUN apt-get update  &&  apt-get install -y pcre2-utils procps
COPY  gotty /usr/local/bin/gotty
COPY --from=ochinchina/supervisord:latest /usr/local/bin/supervisord /usr/local/bin/supervisord
EXPOSE 8080 80  9000 9080
COPY supervisor.conf /etc/supervisor.conf
CMD ["/usr/local/bin/supervisord","-c","/etc/supervisor.conf"]