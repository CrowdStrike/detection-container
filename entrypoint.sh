#!/bin/sh

set -e

# Configure apache settings
hn=`hostname`
sed -E -i -e "s/#ServerName.*/ServerName $hn:80 /g" /etc/httpd/conf/httpd.conf
sed -E -i -e '/<Directory "\/var\/www\/html">/,/<\/Directory>/s/AllowOverride None/AllowOverride All/' /etc/httpd/conf/httpd.conf
sed -E -i -e 's/DirectoryIndex (.*)$/DirectoryIndex index.php \1/g' /etc/httpd/conf/httpd.conf
chmod 753 /var/www/html/uploads

# Create a fake mysqldump command to trigger a detection with
cp /bin/cat /bin/mysqldump

# Mark as CS testcontainer
sh -c echo CS_testcontainer starting

#  Start webservices
/usr/sbin/httpd -k start

cd /home/eval/

if [ -t 0 ] ; then
    # Enter menu mode
    echo "(starting interactive shell)"

    # Start menu
    ../menu/run
else
    echo "(starting non-interactive shell)"

    # Start automatic run
    ../menu/auto
fi
