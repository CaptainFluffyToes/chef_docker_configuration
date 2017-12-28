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

if node['platform_family'] == 'debian'
  apt_package 'Docker' do
    package_name 'docker-ce'
    action :install
  end
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
    action :run
  end
end
