default['duounix_wrapper']['test_user'] = nil
default['duounix_wrapper']['test_user_ssh_pub_key'] = nil

default['duounix_wrapper']['data_bag']['enable'] = false
default['duounix_wrapper']['data_bag']['name'] = 'duounix'
default['duounix_wrapper']['data_bag']['item'] = 'duounix'
default['duounix_wrapper']['data_bag']['ikey_attr'] = 'ikey'
default['duounix_wrapper']['data_bag']['skey_attr'] = 'skey'
default['duounix_wrapper']['data_bag']['host_attr'] = 'host'

default['duounix_wrapper']['config'].tap do |c|
  c['ikey'] = nil
  c['skey'] = nil
  c['host'] = nil
  c['groups'] = nil
  c['failmode'] = 'secure'
  c['pushinfo'] = 'no'
  c['http_proxy'] = nil
  c['autopush'] = 'yes'
  c['motd'] = 'yes'
  c['prompts'] = nil
  c['accept_env_factor'] = nil
  c['fallback_local_ip'] = nil
  c['https_timeout'] = nil
end
