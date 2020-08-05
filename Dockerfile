FROM centos:7

#MAINTAINER CrowdStrike
RUN yum -y update && yum -y install zip vim-common bind-utils-9.11.4-9.P2.el7.x86_64 ruby
RUN mkdir -p /home/eval/bin
RUN mkdir /home/menu
COPY bin/* /home/eval/bin/
COPY menu/* /home/menu/

ENTRYPOINT cd /home/eval/ && ../menu/run
