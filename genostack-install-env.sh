#!/bin/bash
export MYIP=$(ifconfig | awk ' $0 ~ "192.168" {split($2,a,":");print a[2]}')
export MYIP2=$(ifconfig | awk ' $0 ~ "192.168" {split($2,a,":");gsub("\\.","-",a[2]);print a[2]}')
echo "${MYIP} openstack-${MYIP2}.genouest.org" >> /etc/hosts

cd `dirname $0`/virtuoso

# Custumize vituoso according ressources
S=$(cat /proc/meminfo | grep MemTotal | awk '{print int($2/(1024*1024))}')

NumberOfBuffers=170000
MaxDirtyBuffers=130000

if [ "$(( S - 64 ))" -le "2" ] ; then NumberOfBuffers=5450000;MaxDirtyBuffers=4000000;fi
if [ "$(( S - 48 ))" -le "2" ]; then NumberOfBuffers=4000000;MaxDirtyBuffers=3000000;fi
if [ "$(( S - 32 ))" -le "2" ]; then NumberOfBuffers=2720000;MaxDirtyBuffers=2000000;fi
if [ "$(( S - 24 ))" -le "2" ]; then NumberOfBuffers=1360000;MaxDirtyBuffers=1000000;fi
if [ "$(( S - 16 ))" -le "2" ]; then NumberOfBuffers=1360000;MaxDirtyBuffers=1000000;fi
if [ "$(( S - 8 ))" -le "2" ]; then NumberOfBuffers=680000;MaxDirtyBuffers=500000;fi
if [ "$(( S - 6 ))" -le "2" ]; then NumberOfBuffers=510000;MaxDirtyBuffers=375000;fi
if [ "$(( S - 4 ))" -le "2" ]; then NumberOfBuffers=340000;MaxDirtyBuffers=250000;fi
if [ "$(( S - 2 ))" -le "2" ]; then NumberOfBuffers=170000;MaxDirtyBuffers=130000;fi

echo "____________________________________________________________"
echo "Memtotal => $S"
echo "Parameters_NumberOfBuffers=$NumberOfBuffers"
echo "Parameters_MaxDirtyBuffers=$MaxDirtyBuffers"

sed  's/VIRT_Parameters_NumberOfBuffers:.*/VIRT_Parameters_NumberOfBuffers: '$NumberOfBuffers'/' docker-compose.yml > docker-compose.1.yml
sed  's/VIRT_Parameters_MaxDirtyBuffers:.*/VIRT_Parameters_MaxDirtyBuffers: '$MaxDirtyBuffers'/' docker-compose.1.yml > docker-compose.yml

docker-compose pull
docker-compose up -d

echo "Askomics is reachable at http://openstack-${MYIP2}.genouest.org/askomics"
