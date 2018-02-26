# I M P O R T A N T
# Install the Vagrant NFS Support Plugin in order to sync the share with NFS
# run: vagrant plugin install vagrant-winnfsd
# see: https://github.com/winnfsd/vagrant-winnfsd

Vagrant.configure(2) do |config|
  config.vm.provider "virtualbox" do |v|
      v.memory = 512
  end
  config.vm.hostname = 'docker-nginx' ### <<--- SET THIS HOSTNAME IN RELATION TO YOUR PROJECT ###
  config.vm.define "barge"
  config.vm.box = "ailispaw/barge"
  #see: http://blog.theodo.fr/2017/07/speed-vagrant-synced-folders/
  config.vm.synced_folder ".", "/vagrant"
  config.vm.network "private_network", ip: "192.168.33.19"
end
