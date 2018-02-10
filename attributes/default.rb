
# repository
case node['platform']
when 'centos', 'amazon', 'fedora' # ~FC024
  yum_repo_baseurl = value_for_platform(
    'centos' => { 'default' => 'http://pkg.duosecurity.com/CentOS/$releasever/$basearch' },
    'fedora' => { 'default' => 'http://pkg.duosecurity.com/CentOS/7/$basearch' },
    'amazon' => {
      '2.0' => 'http://pkg.duosecurity.com/CentOS/7/$basearch',
      'default' => 'http://pkg.duosecurity.com/CentOS/6/$basearch'
    }
  )
  default['duounix']['package_name'] = 'duo_unix'
  default['duounix']['ssl_package_name'] = 'openssl-devel'
when 'debian', 'ubuntu'
  default['duounix']['package_name'] = 'duo-unix'
  default['duounix']['ssl_package_name'] = 'libssl-dev'
end

default['duounix']['config_sshd'] = false
default['duounix']['setup_repo'] = true
default['duounix']['version'] = '1.10.1'
default['duounix']['yum']['description'] = 'DuoSecurity'
default['duounix']['yum']['gpgkey'] = 'https://www.duosecurity.com/RPM-GPG-KEY-DUO'
default['duounix']['yum']['gpgcheck'] = true
default['duounix']['yum']['enabled'] = true
default['duounix']['yum']['baseurl'] = yum_repo_baseurl
default['duounix']['yum']['action'] = :create

default['duounix']['apt']['repo'] = 'DuoSecurity'
default['duounix']['apt']['keyserver'] = 'keyserver.ubuntu.com'
default['duounix']['apt']['key'] = 'https://www.duosecurity.com/RPM-GPG-KEY-DUO'
default['duounix']['apt']['components'] = %w[main]
default['duounix']['apt']['deb_src'] = false
default['duounix']['apt']['uri'] = "http://pkg.duosecurity.com/#{node['platform'].capitalize}"
default['duounix']['apt']['action'] = :add
default['duounix']['apt']['distribution'] = node['lsb']['codename'].to_s

# https://duo.com/docs/duounix
default['duounix']['config']['ikey'] = nil
default['duounix']['config']['skey'] = nil
default['duounix']['config']['host'] = nil
default['duounix']['config']['groups'] = nil
default['duounix']['config']['failmode'] = nil
default['duounix']['config']['pushinfo'] = 'yes'
default['duounix']['config']['http_proxy'] = nil
default['duounix']['config']['autopush'] = 'yes'
default['duounix']['config']['motd'] = 'yes'
default['duounix']['config']['prompts'] = nil
default['duounix']['config']['accept_env_factor'] = nil
default['duounix']['config']['fallback_local_ip'] = nil
default['duounix']['config']['https_timeout'] = nil
