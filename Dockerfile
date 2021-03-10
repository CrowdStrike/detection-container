FROM centos:7

MAINTAINER The CrowdStrike Community
RUN mkdir -p /home/eval/bin/mimipenguin && \
    mkdir /home/menu && \
    yum -y update && yum -y install zip vim-common bind-utils-9.11.4-9.P2.el7.x86_64 ruby && \
    yum -y clean all && rm -rf /var/cache/yum

COPY bin/ /home/eval/bin/
COPY menu/* /home/menu/

# Expose and entrypoint
COPY entrypoint.sh /

ENTRYPOINT /entrypoint.sh
