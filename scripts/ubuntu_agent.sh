#!/bin/bash
set -ex
hostname ubuntu.vm
echo '192.168.50.4 master.vm master puppet.vm puppet' >> /etc/hosts
echo '192.168.50.7 ubuntu.vm ubuntu' >> /etc/hosts
curl -k https://master.vm:8140/packages/current/install.bash | bash
