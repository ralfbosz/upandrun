Vagrant.configure("2") do |config|

  config.vm.define "master.vm" do |master|
    master.vm.box = "centos/7"
    master.vm.hostname = "master.vm"
  	master.vm.synced_folder ".", "/vagrant", disabled: false
    master.vm.provision "shell", path: "scripts/masterbootstrap.sh"
    master.vm.network "private_network", ip: "192.168.50.4"
    master.vm.provider "virtualbox" do |v|
      v.memory = 4096
      v.cpus = 2
    end
  end 

  config.vm.define "webserver.vm" do |centos|
    centos.vm.box = "centos/7"
    centos.vm.hostname = "webserver.vm"
    centos.vm.network "private_network", ip: "192.168.50.10"
    centos.vm.provision "shell", path: "scripts/webserver.sh"
    centos.vm.provider "virtualbox" do |v|
      v.memory = 1024
    end
  end
  
  config.vm.define "jira.vm" do |centos|
    centos.vm.box = "centos/7"
    centos.vm.hostname = "jira.vm"
    centos.vm.network "private_network", ip: "192.168.50.20"
    centos.vm.provision "shell", path: "scripts/jira.sh"
    centos.vm.provider "virtualbox" do |v|
      v.memory = 2048
    end
  end

  config.vm.define "splunk.vm" do |centos|
    centos.vm.box = "centos/7"
    centos.vm.hostname = "splunk.vm"
    centos.vm.network "private_network", ip: "192.168.50.21"
    centos.vm.provision "shell", path: "scripts/splunk.sh"
    centos.vm.provider "virtualbox" do |v|
      v.memory = 2048
    end
  end

  config.vm.define "database.vm" do |centos|
    centos.vm.box = "centos/7"
    centos.vm.hostname = "database.vm"
    centos.vm.network "private_network", ip: "192.168.50.30"
    centos.vm.provision "shell", path: "scripts/database.sh"
    centos.vm.provider "virtualbox" do |v|
      v.memory = 2048
    end
  end
end
