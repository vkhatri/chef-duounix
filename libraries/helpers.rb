module Duounix
  # duounix helpers
  module Helpers
    def parse_init_atts(config)
      config.reject! { |k, v| k.nil? || v.nil? }
      raise('config parameters ikey, skey, and host should not be nil') unless config.key?('ikey') && config.key?('skey') && config.key?('host')
      config
    end
  end
end

Chef::Resource.send(:include, ::Duounix::Helpers)
Chef::Recipe.send(:include, ::Duounix::Helpers)
