duounix Cookbook
================

[![Cookbook](https://img.shields.io/github/tag/vkhatri/chef-duounix.svg)](https://github.com/vkhatri/chef-duounix) [![Build Status](https://travis-ci.org/vkhatri/chef-duounix.svg?branch=master)](https://travis-ci.org/vkhatri/chef-duounix)

This is a [Chef] cookbook to setup [Duounix].


>> For Production environment, always prefer the [most recent release](https://supermarket.chef.io/cookbooks/duounix).


## Most Recent Release

```ruby
cookbook 'duounix', '~> 2.0.0'
```


## From Git

```ruby
cookbook 'duounix', github: 'vkhatri/chef-duounix',  tag: 'v2.0.0'
```


## Repository

[https://github.com/vkhatri/chef-duounix](https://github.com/vkhatri/chef-duounix)


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

- `duounix_install` - install duounix and dependency packages

- `duounix_config_login_duo` - configure duounix


## Resource duounix_install

**Resource Property**

- *version* (optional, String) - default: '1.10.1', duounix package version
- *release* (optional, String) - default: '0', duouninx package version release
- *setup_repo* (optional, TrueClass, FalseClass) - default: true, setup duounix apt/yum repository
- *ignore_package_version* (optional, TrueClass, FalseClass) - default: false, install latest duounix package

## Resource duounix_config_login_duo

**Resource Property**

- *config* (optional, Hash) - default: '{..}', duounix login_duo.conf file configuration
- *data_bag_enable* (optional, TrueClass, FalseClass) - default: false, read `ikey`, `skey`, and `host` configuration attribute value from data bag
- *data_bag_name* (optional, String) - default: 'duounix', duouninx config attributes data bag name
- *data_bag_item_name* (optional, String) - default: 'duounix', duouninx config attributes data bag item name
- *data_bag_item_ikey_attr* (optional, String) - default: 'ikey', duounix data bag item attribute `ikey` key name
- *data_bag_item_skey_attr* (optional, String) - default: 'skey', duounix data bag item attribute `skey` key name
- *data_bag_item_host_attr* (optional, String) - default: 'host', duounix data bag item attribute `host` key name


## Usage

Check out test cookbook `duounix_test` for resources example.


## Contributing

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests (`chef exec rake and chef exec kitchen verify`), ensuring they all pass
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
