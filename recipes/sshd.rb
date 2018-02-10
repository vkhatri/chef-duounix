#
# Cookbook:: duounix
# Recipe:: sshd
#
# Copyright:: 2018, The Authors, All Rights Reserved.

node.default['openssh']['server']['force_command'] = '/usr/sbin/login_duo'
node.default['openssh']['server']['password_authentication'] = 'yes'

include_recipe 'openssh::default'
