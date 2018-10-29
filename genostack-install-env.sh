#!/bin/bash
export MYIP=$(hostname --all-ip-addresses | awk '$1 ~ "192" {print $1;exit} $2 ~ "192" {print $2}')
export MYIP2=$(echo $MYIP | awk '{gsub("\\.","-",$0);print}')
echo "${MYIP} openstack-${MYIP2}.genouest.org" >> /etc/hosts

cd $(dirname $0)/virtuoso-federation

# Get total memory
S=$(cat /proc/meminfo | grep MemTotal | awk '{print $2/(1024*1024)}' OFMT="%0.0f")

NumberOfBuffers=$(((S*680000)/8))
MaxDirtyBuffers=$(((S*500000)/8))

# Sed the docker-compose file
sed -i 's/VIRT_Parameters_NumberOfBuffers:.*/VIRT_Parameters_NumberOfBuffers: '$NumberOfBuffers'/' docker-compose.yml
sed -i 's/VIRT_Parameters_MaxDirtyBuffers:.*/VIRT_Parameters_MaxDirtyBuffers: '$MaxDirtyBuffers'/' docker-compose.yml

docker-compose pull
docker-compose up -d

echo "========================================================================"
echo "Askomics is reachable at http://openstack-${MYIP2}.genouest.org/askomics"
echo "========================================================================"
