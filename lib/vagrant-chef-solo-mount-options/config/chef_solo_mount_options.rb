require 'vagrant/util/presence'
# require 'vagrant/plugins/provisioners/chef/config/chef_solo'

require Vagrant.source_root.join('plugins', 'provisioners', 'chef', 'config', 'chef_solo')

module VagrantPlugins
  module ChefMountOptions
    module Config
      class ChefSoloMountOptions < VagrantPlugins::Chef::Config::ChefSolo
        # Vagrant.plugin("2", :config)
        include Vagrant::Util::Presence

        # Options for the synced folders to use.
        # @return [Array]
        attr_accessor :synced_folder_options

        def initialize
          super

          @synced_folder_options  = UNSET_VALUE
        end

        def finalize!
          super

          @synced_folder_options = {} if @synced_folder_options == UNSET_VALUE
        end
      end
    end
  end
end
