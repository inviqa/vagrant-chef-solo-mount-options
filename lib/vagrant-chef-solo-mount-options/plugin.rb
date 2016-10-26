# require 'vagrant/plugins/provisioners/chef/plugin'

# # A lambda that knows how to load plugins from a single directory.
# plugin_load_proc = lambda do |directory|
#   # We only care about directories
#   next false if !directory.directory?

#   # If there is a plugin file in the top-level directory, then load
#   # that up.
#   plugin_file = directory.join("plugin.rb")
#   if plugin_file.file?
#     load(plugin_file)
#     next true
#   end
# end
# Vagrant.source_root.join("plugins").children(true).each do |directory|
#   # Ignore non-directories
#   next if !directory.directory?

#   # Load from this directory, and exit if we successfully loaded a plugin
#   next if plugin_load_proc.call(directory)

#   # Otherwise, attempt to load from sub-directories
#   directory.children(true).each(&plugin_load_proc)
# end

require Vagrant.source_root.join('plugins', 'provisioners', 'chef', 'plugin')

module VagrantPlugins
  module ChefMountOptions
    class Plugin < Vagrant.plugin('2')
      # extend VagrantPlugins::Chef::Plugin
      extend VagrantPlugins::Chef
      name 'vagrant-chef-solo-mount-options'
      description <<-DESC
        Provides support for provisioning your virtual machines with
        Chef via `chef-solo`, `chef-client`, `chef-zero` or `chef-apply`.
      DESC

      config :chef_solo_mount_options, :provisioner do
        require_relative 'config/chef_solo_mount_options'
        Config::ChefSoloMountOptions
      end

      provisioner :chef_solo_mount_options do
        require_relative 'provisioner/chef_solo_mount_options'
        Provisioner::ChefSoloMountOptions
      end
    end
  end
end
