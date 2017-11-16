#!/bin/bash
export MYIP=$(ifconfig | awk ' $0 ~ "192.168" {split($2,a,":");print a[2]}')
export MYIP2=$(ifconfig | awk ' $0 ~ "192.168" {split($2,a,":");gsub("\\.","-",a[2]);print a[2]}')
echo "${MYIP} openstack-${MYIP2}.genouest.org" >> /etc/hosts

cd `dirname $0`/virtuoso
docker-compose pull
docker-compose up -d

echo "Askomics is reachable at http://openstack-${MYIP2}.genouest.org/askomics"
