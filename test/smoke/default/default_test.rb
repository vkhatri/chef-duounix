# # encoding: utf-8

# Inspec test for recipe duounix::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

if %w[redhat fedora amazon].include?(os[:family])
  describe file('/etc/yum.repos.d/duosecurity.repo') do
    it { should exist }
  end

  describe package('duo_unix') do
    it { should be_installed }
    its('version') { should match '1.10.1' }
  end

  describe package('openssl-devel') do
    it { should be_installed }
  end

  describe package('pam-devel') do
    it { should be_installed }
  end

  describe package('openssh-server') do
    it { should be_installed }
  end

  describe package('openssh-clients') do
    it { should be_installed }
  end
else
  describe file('/etc/apt/sources.list.d/duosecurity.list') do
    it { should exist }
  end

  describe package('duo-unix') do
    it { should be_installed }
    its('version') { should match '1.10.1' }
  end

  describe package('libssl-dev') do
    it { should be_installed }
  end

  describe package('libpam0g-dev') do
    it { should be_installed }
  end

  describe package('openssh-server') do
    it { should be_installed }
  end

  describe package('openssh-client') do
    it { should be_installed }
  end
end

describe file('/etc/duo/login_duo.conf') do
  it { should exist }
end

describe port(22) do
  it { should be_listening }
end
