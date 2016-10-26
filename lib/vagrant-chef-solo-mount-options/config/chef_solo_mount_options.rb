require 'vagrant/util/presence'
require Vagrant.source_root.join('plugins', 'provisioners', 'chef', 'config', 'chef_solo')

module VagrantPlugins
  module ChefMountOptions
    module Config
      # This class implements config for chef-solo, with additional options for mount points.
      class ChefSoloMountOptions < VagrantPlugins::Chef::Config::ChefSolo
        include Vagrant::Util::Presence

        # Options for the synced folders to use.
        # @return [Hash]
        attr_accessor :synced_folder_options

        def initialize
          super

          @synced_folder_options = UNSET_VALUE
        end

        def finalize!
          super

          @synced_folder_options = {} if @synced_folder_options == UNSET_VALUE
        end
      end
    end
  end
end
