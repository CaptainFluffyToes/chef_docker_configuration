#
# Cookbook:: docker_configuration
# Recipe:: setup
#
# Copyright:: 2017, Darren Khan, All Rights Reserved.

if node['platform_family'] == 'debian'
  installs = ['apt-transport-https']
  installs.each do |install|
    package install do
      action :install
    end
  end
  apt_update 'Update Apt' do
    action :update
  end
  installs = ['ca-certificates', 'software-properties-common', 'gnupg2']
  installs.each do |install|
    package install do
      action :install
    end
  end
end

docker_installation_package 'default' do
  action :create
end

if node['machinename'] !~ /([-]docker.solsys.com)/
  bash 'set_hostname' do
    code <<-EOH
    hostname_string=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 5 | head -n 1)
    hostname_suffix=solsys.com
    hostname=$hostname_string-docker.$hostname_suffix
    hostnamectl set-hostname $hostname
    sed -i -e "s/core/$hostname/g" /etc/hosts
    /etc/init.d/hostname.sh start
    EOH
    action :run
  end
end

ohai 'update_information' do
  action :reload
end
