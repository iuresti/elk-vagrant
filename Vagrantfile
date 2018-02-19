Vagrant::DEFAULT_SERVER_URL.replace('https://vagrantcloud.com')

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 6144
    vb.cpus = 4
  end

  #Directory to download installers
  config.vm.synced_folder "installers", "/opt/installers"

  #required stuff
  config.vm.provision :shell, :path => "pre-setup.sh"

  #install java
  config.vm.provision :shell, :path => "java-setup.sh"

  #Required ports for ELK
  #config.vm.network :forwarded_port, host: 9200, guest: 9200
  config.vm.network :forwarded_port, host: 5601, guest: 5601
  config.vm.network :forwarded_port, host: 5050, guest: 5050
  

  #install elastic-search
  config.vm.provision :shell, :path => "elastic-setup.sh"

  #install kibana
  config.vm.provision :shell, :path => "kibana-setup.sh"

  #install logstash
  config.vm.provision :shell, :path => "logstash-setup.sh"


end