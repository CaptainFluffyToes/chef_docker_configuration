#
# Cookbook:: docker_configuration
# Recipe:: default
#
# Copyright:: 2017, Darren Khan, All Rights Reserved.

# This will install the right docker engine on the machine
case node['platform_family']
when 'debian'
  include_recipe 'chef-apt-docker::default'
when 'rhel'
  include_recipe 'chef-yum-docker::default'
end

include_recipe 'docker_configuration::setup'
