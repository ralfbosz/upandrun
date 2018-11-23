#!/bin/bash
set -ex
hostname database.vm
echo '192.168.50.4 master.vm master puppet.vm puppet' >> /etc/hosts
echo '192.168.50.30 database.vm database' >> /etc/hosts
curl -k https://master.vm:8140/packages/current/install.bash | bash
