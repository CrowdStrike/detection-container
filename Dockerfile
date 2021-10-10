FROM centos:7

MAINTAINER CrowdStrike

COPY entrypoint.sh /
COPY bin/ /home/eval/bin/
COPY menu/* /home/menu/
COPY www /var/www/html/

RUN yum -y update && \
    yum -y install wget file zip vim-common bind-utils ruby php httpd php-fpm && \
    yum -y clean all && \
    rm -rf /var/cache/yum && \
    mkdir -p /home/eval/bin/mimipenguin && \
    mkdir /home/menu && \
    chmod +x /entrypoint.sh

EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]
