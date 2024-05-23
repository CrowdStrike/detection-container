FROM registry.access.redhat.com/ubi9/ubi

LABEL name="CrowdStrike Detection Container" \
    version="latest" \
    maintainer="CrowdStrike" \
    summary="This container will create detections and preventions which are protected by a CrowdStrike sensor." \
    description="This container will create detections and preventions only on Linux hosts, container platforms (e.g. OpenShift), and containers themselves, which are protected by a CrowdStrike sensor." \
    io.k8s.display-name="CrowdStrike Detection Container" \
    io.openshift.tags="crowdstrike,security,detection"

COPY entrypoint.sh /
COPY bin/ /home/eval/bin/
COPY menu/* /home/menu/
COPY www /var/www/html/

RUN dnf -y install wget file zip vim-common bind-utils ruby php httpd php-fpm hostname ncurses binutils python-unversioned-command procps-ng iputils && \
    dnf -y update && \
    dnf -y clean all && \
    rm -rf /var/cache/yum && \
    mkdir -p /home/eval/bin/mimipenguin && \
    chmod +x /entrypoint.sh

EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]
