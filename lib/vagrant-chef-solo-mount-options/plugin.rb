require Vagrant.source_root.join('plugins', 'provisioners', 'chef', 'plugin')

module VagrantPlugins
  module ChefMountOptions
    # Declare the plugin for vagrant
    class Plugin < Vagrant.plugin('2')
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
