#
# Cookbook:: duounix
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

include_recipe 'duounix::install'
include_recipe 'duounix::config'
include_recipe 'duounix::sshd' if node['duounix']['config_sshd']
