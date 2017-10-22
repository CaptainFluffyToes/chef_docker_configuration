#
# Cookbook:: docker_configuration
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe 'chef-apt-docker::default'
include_recipe 'docker_configuration::setup'