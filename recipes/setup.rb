#
# Cookbook:: docker_configuration
# Recipe:: setup
#
# Copyright:: 2017, Darren Khan, All Rights Reserved.

if node['platform'] == 'debian'
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