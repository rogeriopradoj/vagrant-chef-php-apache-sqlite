# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.network :hostonly, "33.33.33.10"

  config.vm.forward_port 80, 8080
  config.vm.forward_port 9000, 9000

  # Faz o NFS funcionar adequadamente tanto em hosts Windows quanto nos outros hosts
  # http://happykoalas.com/blog/2012/04/vagrant-and-using-nfs-only-on-non-windows-host/
  def Kernel.is_windows?
    # Detect if we are running on Windows
    processor, platform, *rest = RUBY_PLATFORM.split("-")
    platform == 'mingw32'
  end
  nfs = !Kernel.is_windows?
  config.vm.share_folder "v-root", "/vagrant", "."
  config.vm.share_folder "v-web", "/vagrant/web", "./web"

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["chef/cookbooks","chef/site-cookbooks"]
    chef.add_recipe "build-essential"
    chef.add_recipe "apt"
    chef.add_recipe "openssl"
    chef.add_recipe "apache2"
    chef.add_recipe "sqlite"
    chef.add_recipe "php"
    chef.add_recipe "chef-xdebug"
    chef.add_recipe "chef-curl"
    chef.add_recipe "php::module_apc"
    chef.add_recipe "php::module_curl"
    chef.add_recipe "php::module_gd"
    chef.add_recipe "php::module_sqlite3"
    chef.add_recipe "apache2::mod_php5"
    chef.add_recipe "apache2::mod_rewrite"
    chef.add_recipe "Site"
  end
end
