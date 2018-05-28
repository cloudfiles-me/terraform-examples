#!/bin/bash
aws s3 cp --recursive s3://test.cloudfiles.me/ /var/www/html/.
systemctl start httpd
chkconfig httpd on