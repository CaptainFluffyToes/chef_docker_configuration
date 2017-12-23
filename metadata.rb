name 'docker_configuration'
maintainer 'Darren Khan'
maintainer_email 'djkhan85@gmail.com'
license 'All Rights Reserved'
description 'Installs/Configures docker_configuration'
long_description 'Installs/Configures docker_configuration'
version '0.1.8'
chef_version '>= 12.1' if respond_to?(:chef_version)

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/CaptainFluffyToes/docker_configuration/issues'

# The `source_url` points to the development repository for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/CaptainFluffyToes/docker_configuration'

# Changelog
# [10/13/2017] - 0.1.1 - Created setup.rb.  Added gitignore file for .chef.  Added docker cookbook from supermarket
# [10/14/2017] - 0.1.2 - Removed test images from the setup.rb
# [10/16/2017] - 0.1.3 - Added packages for docker installation
# [10/16/2017] - 0.1.4 - Updated berksfile source to include chef server
# [10/16/2017] - 0.1.5 - Made chef-apt-docker run first
# [10/18/2017] - 0.1.6 - Created loops and conditional checks for scripts
# [10/25/2017] - 0.1.7 - Added tests for debian and rhel distros
# [12/22/2017] - 0.1.8 - Added dynamic renaming of machines so that -docker.solsys.com is checked and then the machine is renamed if not.

depends 'docker'
depends 'chef-apt-docker'
depends 'chef-yum-docker'
