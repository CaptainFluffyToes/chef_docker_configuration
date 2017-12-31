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
  package 'docker_install' do
    package_name 'docker-ce'
    timeout 60
    ignore_failure true
    action :install
  end
  if node['machinename'] !~ /([-]docker.solsys.com)/
    bash 'set_hostname' do
      code <<-EOH
      hostname_string=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 5 | head -n 1)
      hostname_suffix=solsys.com
      hostname=$hostname_string-docker.$hostname_suffix
      hostnamectl set-hostname $hostname
      sed -i "/127.0.1.1 / s/.*/127.0.1.1 $hostname/" /etc/hosts
      /etc/init.d/hostname.sh start
      EOH
      ignore_failure true
      user 'root'
      group 'root'
      timeout 60
      action :run
    end
  end
end
