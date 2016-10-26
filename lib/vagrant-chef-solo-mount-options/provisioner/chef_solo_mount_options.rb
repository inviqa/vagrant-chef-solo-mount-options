require 'vagrant/util/counter'
# require 'vagrant/plugins/provisioners/chef/provisioner/chef_solo'

require Vagrant.source_root.join('plugins', 'provisioners', 'chef', 'provisioner', 'chef_solo')

module VagrantPlugins
  module ChefMountOptions
    module Provisioner
      # This class implements provisioning via chef-solo, with options for mount points.
      class ChefSoloMountOptions < VagrantPlugins::Chef::Provisioner::ChefSolo
        # Vagrant.plugin(2, :provisioner)
        extend Vagrant::Util::Counter
        include Vagrant::Util::Counter

        # Shares the given folders with the given prefix. The folders should
        # be of the structure resulting from the `expanded_folders` function.
        def share_folders(root_config, prefix, folders, existing=nil)
          existing_set = Set.new
          (existing || []).each do |_, fs|
            fs.each do |id, data|
              existing_set.add(data[:guestpath])
            end
          end

          folders.each do |type, local_path, remote_path|
            next if type != :host

            key = Digest::MD5.hexdigest(remote_path)
            key = key[0..8]

            opts = {}
            opts[:id] = "v-#{prefix}-#{key}"
            opts[:type] = @config.synced_folder_type if @config.synced_folder_type
            opts.merge!(@config.synced_folder_options) if @config.synced_folder_options

            root_config.vm.synced_folder(local_path, remote_path, opts)
          end
        end
      end
    end
  end
end
