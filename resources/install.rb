
resource_name :duounix_install

property :version, String, default: '1.10.1'
property :release, String, default: '0'
property :setup_repo, [TrueClass, FalseClass], default: true
property :install_openssh, [TrueClass, FalseClass], default: true
property :ignore_package_version, [TrueClass, FalseClass], default: false

default_action :create

package_name = %w[rhel amazon fedora].include?(node['platform_family']) ? 'duo_unix' : 'duo-unix'
deps_packages = %w[rhel amazon fedora].include?(node['platform_family']) ? %w[openssl-devel pam-devel] : %w[libssl-dev libpam-dev]
# need openssh package installed in favor of duounix configuration ownership
openssh_packages = %w[rhel amazon fedora].include?(node['platform_family']) ? %w[openssh-clients openssh-server] : %w[openssh-client openssh-server]

action :create do
  # setup yum/apt repository
  case node['platform']
  when 'centos', 'amazon', 'fedora' # ~FC024
    yum_baseurl = value_for_platform(
      'centos' => { 'default' => 'http://pkg.duosecurity.com/CentOS/$releasever/$basearch' },
      'fedora' => { 'default' => 'http://pkg.duosecurity.com/CentOS/7/$basearch' },
      'amazon' => {
        '2.0' => 'http://pkg.duosecurity.com/CentOS/7/$basearch',
        'default' => 'http://pkg.duosecurity.com/CentOS/6/$basearch'
      }
    )

    yum_repository 'duosecurity' do
      description 'DuoSecurity'
      baseurl yum_baseurl
      gpgcheck true
      gpgkey 'https://www.duosecurity.com/RPM-GPG-KEY-DUO'
      enabled true
      only_if { new_resource.setup_repo }
    end

  when 'debian', 'ubuntu'
    apt_repository 'duosecurity' do
      uri "http://pkg.duosecurity.com/#{node['platform'].capitalize}"
      distribution node['lsb']['codename'].to_s
      components %w[main]
      keyserver 'keyserver.ubuntu.com'
      key 'https://www.duosecurity.com/RPM-GPG-KEY-DUO'
      deb_src false
      only_if { new_resource.setup_repo }
    end
  end

  package deps_packages

  package openssh_packages if new_resource.install_openssh

  package package_name do
    version duounix_version(new_resource.version, new_resource.release) unless new_resource.ignore_package_version
  end

  directory '/etc/duo' do
    mode '0755'
  end
end

action :delete do
  package package_name do
    action :remove
  end

  directory '/etc/duo' do
    action :delete
  end
end

action_class do
  include ::Duounix::Helpers
end
