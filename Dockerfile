FROM centos:7

MAINTAINER The CrowdStrike Community

RUN mkdir -p /home/eval/bin && \
    mkdir /home/menu && \ 
    yum -y update && yum -y install zip vim-common bind-utils ruby httpd php php-fpm && \
    yum -y clean all && rm -rf /var/cache/yum

COPY bin/ /home/eval/bin/
COPY menu/* /home/menu/
COPY www /var/www/html/
COPY entrypoint.sh /

EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]
