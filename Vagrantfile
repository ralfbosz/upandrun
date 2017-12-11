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

  config.vm.define "windows.vm" do |windows|
    windows.vm.box = "ferventcoder/win2012r2-x64-nocm"
    windows.vm.communicator = "winrm"
    windows.vm.hostname = "windows"
    windows.vm.provision "shell", path: "scripts/windows_agent.ps1"
    windows.vm.network "private_network", ip: "192.168.50.5"
    windows.vm.provider "virtualbox" do |v|
      v.memory = 2048
    end
  end

  config.vm.define "centos.vm" do |centos|
    centos.vm.box = "centos/7"
    centos.vm.hostname = "centos.vm"
    centos.vm.network "private_network", ip: "192.168.50.6"
    centos.vm.provision "shell", path: "scripts/centos_agent.sh"
    centos.vm.provider "virtualbox" do |v|
      v.memory = 2048
    end
  end
  
  config.vm.define "oraclelinux.vm" do |oraclelinux|
    oraclelinux.vm.box = "elastic/oraclelinux-7-x86_64"
    oraclelinux.vm.hostname = "oraclelinux.vm"
    oraclelinux.vm.network "private_network", ip: "192.168.50.7"
    oraclelinux.vm.provision "shell", path: "scripts/oraclelinux_agent.sh"
    oraclelinux.vm.provider "virtualbox" do |v|
      v.memory = 2048
    end
  end

  config.vm.define "ubuntu.vm" do |ubuntu|
    ubuntu.vm.box = "elastic/ubuntu-16.04-x86_64"
    ubuntu.vm.hostname = "ubuntu.vm"
    ubuntu.vbguest.auto_update = false
    ubuntu.vm.network "private_network", ip: "192.168.50.8"
    ubuntu.vm.provision "shell", path: "scripts/ubuntu_agent.sh"
    ubuntu.vm.provider "virtualbox" do |v|
      v.memory = 2048
    end
  end
end
