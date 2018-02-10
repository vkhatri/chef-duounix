#
# Cookbook:: duounix
# Recipe:: repo
#
# Copyright:: 2018, The Authors, All Rights Reserved.

if node['duounix']['setup_repo']
  case node['platform_family']
  when 'fedora', 'rhel', 'amazon'
    yum_repository 'duosecurity' do
      description node['duounix']['yum']['description']
      baseurl node['duounix']['yum']['baseurl']
      mirrorlist node['duounix']['yum']['mirrorlist'] if node['duounix']['yum']['mirrorlist']
      gpgcheck node['duounix']['yum']['gpgcheck']
      gpgkey node['duounix']['yum']['gpgkey']
      enabled node['duounix']['yum']['enabled']
      action node['duounix']['yum']['action']
    end
  when 'debian'
    apt_repository 'duosecurity' do
      uri node['duounix']['apt']['uri']
      distribution node['duounix']['apt']['distribution']
      components node['duounix']['apt']['components']
      keyserver node['duounix']['apt']['keyserver'] unless node['duounix']['apt']['keyserver'].nil?
      key node['duounix']['apt']['key']
      deb_src node['duounix']['apt']['deb_src']
      action node['duounix']['apt']['action']
    end
  end
end

package node['duounix']['ssl_package_name']

package node['duounix']['package_name'] do
  node['duounix']['version']
end
