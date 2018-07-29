name 'duounix'
maintainer 'Virender Khatri'
maintainer_email 'vir.khatri@gmail.com'
license 'Apache-2.0'
description 'Installs/Configures duounix'
long_description 'Installs/Configures duounix'
version '2.0.0'
chef_version '>= 12.1' if respond_to?(:chef_version)

source_url 'https://github.com/vkhatri/chef-duounix' if respond_to?(:source_url)
issues_url 'https://github.com/vkhatri/chef-duounix/issues' if respond_to?(:issues_url)

%w[ubuntu centos amazon redhat fedora].each do |os|
  supports os
end
