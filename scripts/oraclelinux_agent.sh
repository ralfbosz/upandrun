#!/bin/bash
set -ex
hostname oraclelinux.vm
echo '192.168.50.4 master.vm master puppet.vm puppet' >> /etc/hosts
echo '192.168.50.7 oraclelinux.vm oraclelinux' >> /etc/hosts
curl -k https://master.vm:8140/packages/current/install.bash | bash
