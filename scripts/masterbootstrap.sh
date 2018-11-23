#!/bin/bash
set -ex
hostname master.vm
echo '192.168.50.4 master.vm master puppet.vm puppet' >> /etc/hosts
mkdir -p /etc/puppetlabs/puppet
echo '*' > /etc/puppetlabs/puppet/autosign.conf
curl -Lo pe.archive 'https://pm.puppetlabs.com/puppet-enterprise/2019.0.1/puppet-enterprise-2019.0.1-el-7-x86_64.tar.gz'
tar -xf pe.archive
cat > pe.conf <<-EOF
{
  "console_admin_password": "puppetlabs"
  "puppet_enterprise::puppet_master_host": "%{::trusted.certname}"
  "puppet_enterprise::use_application_services": true
  "puppet_enterprise::profile::master::check_for_updates": false
  "puppet_enterprise::profile::master::r10k_remote": "git@github.com:ralfbosz/control-repo.git"
  "puppet_enterprise::profile::master::r10k_private_key": "/vagrant/keys/id-control_repo.rsa"
}
EOF
./puppet-enterprise-*-el-7-x86_64/puppet-enterprise-installer -c pe.conf
/opt/puppetlabs/bin/r10k deploy environment production --puppetfile
systemctl stop firewalld
systemctl disable firewalld
