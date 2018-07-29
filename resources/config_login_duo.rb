
resource_name :duounix_config_login_duo

property :config, Hash, default: {}
property :data_bag_enable, [TrueClass, FalseClass], default: false
property :data_bag_name, String, default: 'duounix'
property :data_bag_item_name, String, default: 'duounix'
property :data_bag_item_ikey_attr, String, default: 'ikey'
property :data_bag_item_skey_attr, String, default: 'skey'
property :data_bag_item_host_attr, String, default: 'host'

default_action :create

action :create do
  config = duounix_config_hash(new_resource)

  template 'login_duo_conf' do
    path '/etc/duo/login_duo.conf'
    mode '0600'
    owner 'sshd'
    group 'root'
    sensitive true
    source 'login_duo.conf.erb'
    cookbook 'duounix'
    variables(:config => config)
  end
end

action :delete do
  file '/etc/duo/login_duo.conf' do
    action :delete
  end
end

action_class do
  include ::Duounix::Helpers
end
