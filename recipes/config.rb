#
# Cookbook:: duounix
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

config_atts = parse_init_atts(node['duounix']['config'].dup)

template 'login_duo_conf' do
  path '/etc/duo/login_duo.conf'
  mode '0400'
  sensitive true
  source 'login_duo.conf.erb'
  variables(:config => config_atts)
end

# TODO
template 'pam_duo_conf' do
  path '/etc/duo/pam_duo.conf'
  mode '0400'
  sensitive true
  source 'login_duo.conf.erb'
  variables(:config => config_atts)
  action :nothing
end
