FROM centos:7

#MAINTAINER CrowdStrike
RUN yum -y update && yum -y install zip vim-common bind-utils-9.11.4-9.P2.el7.x86_64 ruby
RUN mkdir -p /home/eval/bin/mimipenguin
RUN mkdir /home/menu
COPY bin/ /home/eval/bin/
COPY menu/* /home/menu/

# Expose and entrypoint
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT /entrypoint.sh
