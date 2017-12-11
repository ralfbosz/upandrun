#!/bin/bash
set -ex
hostname centos.vm
echo '192.168.50.4 master.vm master puppet.vm puppet' >> /etc/hosts
echo '192.168.50.6 centos.vm centos' >> /etc/hosts
curl -k https://master.vm:8140/packages/current/install.bash | bash
