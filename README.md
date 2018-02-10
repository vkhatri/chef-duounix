duounix Cookbook
================

[![Cookbook](https://img.shields.io/github/tag/vkhatri/chef-duounix.svg)](https://github.com/vkhatri/chef-duounix) [![Build Status](https://travis-ci.org/vkhatri/chef-duounix.svg?branch=master)](https://travis-ci.org/vkhatri/chef-duounix)

This is a [Chef] cookbook to manage [Duounix].


>> For Production environment, always prefer the [most recent release](https://supermarket.chef.io/cookbooks/duounix).


## Most Recent Release

```ruby
cookbook 'duounix', '~> 1.0.0'
```


## From Git

```ruby
cookbook 'duounix', github: 'vkhatri/chef-duounix',  tag: 'v1.0.0'
```


## Repository

```
https://github.com/vkhatri/chef-duounix
```


## Supported OS

- Amazon Linux
- CentOS
- Fedora
- Ubuntu
- Debian


## Supported Chef

- Chef 12
- Chef 13


## Cookbook Dependency

- openssh


## Recipes

- `duounix::sshd` - configure openssh

- `duounix::config` - configure duo unix

- `duounix::default` - default recipe (run_list)

- `duounix::install` - install duo unix


## Attributes

* `default['duounix']['config_sshd']` (default: `false`): configure openssh if set to `true`

* `default['duounix']['version']` (default: `1.10.1`): duo unix package version

* `default['duounix']['ssl_package_name']` (default: `false`): openssl package name

* `default['duounix']['package_name']` (default: `calculated`): duo unix package name

* `default['duounix']['setup_repo']` (default: `true`): setup `apt` or `yum` repository if set to `true`

* `default['duounix']['config']['ikey']` (default: `nil`): `login_duo.conf` parameter

* `default['duounix']['config']['skey']` (default: `nil`): `login_duo.conf` parameter

* `default['duounix']['config']['host']` (default: `nil`): `login_duo.conf` parameter

* `default['duounix']['config']['groups']` (default: `nil`): `login_duo.conf` parameter

* `default['duounix']['config']['failmode']` (default: `nil`): `login_duo.conf` parameter

* `default['duounix']['config']['pushinfo']` (default: `yes`): `login_duo.conf` parameter

* `default['duounix']['config']['http_proxy']` (default: `nil`): `login_duo.conf` parameter

* `default['duounix']['config']['autopush']` (default: `yes`): `login_duo.conf` parameter

* `default['duounix']['config']['motd']` (default: `yes`): `login_duo.conf` parameter

* `default['duounix']['config']['prompts']` (default: `nil`): `login_duo.conf` parameter

* `default['duounix']['config']['accept_env_factor']` (default: `nil`): `login_duo.conf` parameter

* `default['duounix']['config']['fallback_local_ip']` (default: `nil`): `login_duo.conf` parameter

* `default['duounix']['config']['https_timeout']` (default: `nil`): `login_duo.conf` parameter

* `default['duounix']['yum']['description']` (default: `DuoSecurity`): yum repository attribute

* `default['duounix']['yum']['gpgcheck']` (default: `true`): yum repository attribute

* `default['duounix']['yum']['enabled']` (default: `true`): yum repository attribute

* `default['duounix']['yum']['baseurl']` (default: `calculated`): yum repository attribute

* `default['duounix']['yum']['gpgkey']` (default: `https://www.duosecurity.com/RPM-GPG-KEY-DUO`): yum repository attribute

* `default['duounix']['yum']['action']` (default: `:create`): yum repository attribute

* `default['duounix']['apt']['description']` (default: `DuoSecurity`): apt repository attribute

* `default['duounix']['apt']['components']` (default: `['main']`): apt repository attribute

* `default['duounix']['apt']['uri']` (default: `calculated`): apt repository attribute

* `default['duounix']['apt']['key']` (default: `https://www.duosecurity.com/RPM-GPG-KEY-DUO`): apt repository attribute

* `default['duounix']['apt']['distribution']` (default: `node['lsb']['codename']`): apt repository attribute

* `default['duounix']['apt']['action']` (default: `:add`): apt repository attribute


## Contributing

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests (`rake & rake knife`), ensuring they all pass
6. Write new resource/attribute description to `README.md`
7. Write description about changes to PR
8. Submit a Pull Request using Github


## Copyright & License

Authors:: Virender Khatri and [Contributors]

<pre>
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
</pre>


[Chef]: https://www.chef.io/
[Duounix]: https://duo.com/docs/duounix
[Contributors]: https://github.com/vkhatri/chef-duounix/graphs/contributors
