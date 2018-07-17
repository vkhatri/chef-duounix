#
# Cookbook:: duounix_test
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

node.default['openssh']['server']['force_command'] = '/usr/sbin/login_duo'
node.default['openssh']['server']['password_authentication'] = 'no'
node.default['openssh']['server']['pubkey_authentication'] = 'yes'
test_user = node['duounix_wrapper']['test_user']

# install duounix
duounix_install 'default'

# configure duounix
duounix_config_login_duo 'default' do
  config node['duounix_wrapper']['config']
  data_bag_enable node['duounix_wrapper']['data_bag']['enable']
  data_bag_name node['duounix_wrapper']['data_bag']['name']
  data_bag_item_name node['duounix_wrapper']['data_bag']['item']
  data_bag_item_ikey_attr node['duounix_wrapper']['data_bag']['ikey_attr']
  data_bag_item_skey_attr node['duounix_wrapper']['data_bag']['skey_attr']
  data_bag_item_host_attr node['duounix_wrapper']['data_bag']['host_attr']
end

# setup openssh
directory '/var/run/sshd' if node['platform_family'] == 'debian'
include_recipe 'openssh::default'

# setup ssh test user
if test_user
  user test_user do
    manage_home true
  end

  directory "/home/#{test_user}/.ssh" do
    mode 0o750
    owner test_user
    group test_user
  end

  file "/home/#{test_user}/.ssh/authorized_keys" do
    content node['duounix_wrapper']['test_user_ssh_pub_key']
    mode 0o600
    owner test_user
    group test_user
    not_if { node['duounix_wrapper']['test_user_ssh_pub_key'].nil? }
  end
end

if node['platform_family'] == 'debian'
  execute 'ssh' do
    command 'service ssh restart'
  end
end
