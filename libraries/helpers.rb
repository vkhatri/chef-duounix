module Duounix
  # duounix helpers
  module Helpers
    def duounix_version(version, release)
      case node['platform']
      when 'centos', 'redhat', 'fedora', 'amazon'
        version_suffix = value_for_platform(
          %w[centos redhat] => { 'default' => "el#{node['platform_version'].split('.')[0]}" },
          'amazon' => { 'default' => 'el6', '2' => 'el7' },
          'fedora' => { 'default' => 'el7' }
        )
        version = version + '-' + release + '.' + version_suffix
      when 'ubuntu', 'debian', 'raspbian'
        # version_suffix = '.' + node['lsb']['codename'].to_s
        version = version + '-' + release
      end

      version
    end

    def duounix_config_hash(resource)
      config = resource.config.dup

      if resource.data_bag_enable
        data_bag_item_info = data_bag_item(resource.data_bag_name, resource.data_bag_item_name)
        config['ikey'] = data_bag_item_info[resource.data_bag_item_ikey_attr] || raise("data bag #{resource.data_bag_name} item #{resource.data_bag_item_name} is missing key #{resource.data_bag_item_ikey_attr}")
        config['skey'] = data_bag_item_info[resource.data_bag_item_skey_attr] || raise("data bag #{resource.data_bag_name} item #{resource.data_bag_item_name} is missing key #{resource.data_bag_item_skey_attr}")
        config['host'] = data_bag_item_info[resource.data_bag_item_host_attr] || raise("data bag #{resource.data_bag_name} item #{resource.data_bag_item_name} is missing key #{resource.data_bag_item_host_attr}")
      end

      config.reject! { |k, v| k.nil? || v.nil? }
      raise('config parameters ikey, skey, and host should not be nil') unless config.key?('ikey') && config.key?('skey') && config.key?('host')
      config
    end
  end
end

Chef::Resource.send(:include, ::Duounix::Helpers)
Chef::Recipe.send(:include, ::Duounix::Helpers)
