#
# Cookbook:: duounix
# Spec:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'duounix::default' do
  context 'When all attributes are default, on Ubuntu 16.04' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'centos', version: '6.8') do |node|
        node.automatic['platform_family'] = 'rhel'
        node.override['duounix']['config']['ikey'] = 'ikey-zzzzz'
        node.override['duounix']['config']['skey'] = 'skey-zzzzz'
        node.override['duounix']['config']['host'] = 'api-zzzzz.duosecurity.com'
      end.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end

  context 'When all attributes are default, on CentOS 7.4.1708' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'centos', version: '6.8') do |node|
        node.automatic['platform_family'] = 'rhel'
        node.override['duounix']['config']['ikey'] = 'ikey-zzzzz'
        node.override['duounix']['config']['skey'] = 'skey-zzzzz'
        node.override['duounix']['config']['host'] = 'api-zzzzz.duosecurity.com'
      end.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
