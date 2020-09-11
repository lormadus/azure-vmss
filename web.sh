#!/bin/bash

#Ubuntu 사용하시는 경우
apt-get update –y
apt-get install –y apache2

#CentOS, RHEL 사용하시는 경우
yum update –y
yum install –y apache2

echo "<html>" > /var/www/html/index.html
echo "<img src=\"https://user25cdndemo.azureedge.net/img/abc.jpg\">" >> /var/www/html/index.html
echo "</html>" >> /var/www/html/index.html
