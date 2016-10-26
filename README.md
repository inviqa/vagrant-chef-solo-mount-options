# Vagrant Chef Solo Provisioner, with mount options

Allows specifying `chef.synced_folder_options = {}` to forward to the synced folders declaration, for instance:

```ruby
config.vm.provision :chef_solo_mount_options do |chef|
  # ...

  # Use NFS for speed and avoiding vboxfs issues
  nfs_version = 3
  nfs_version = 4 if FFI::Platform::IS_LINUX
  chef.synced_folder_type = :nfs unless FFI::Platform::IS_WINDOWS
  chef.synced_folder_options = {
    mount_options: ['rw', "vers=#{nfs_version}", 'tcp', 'nolock', 'noatime', 'actimeo=1']
  } unless FFI::Platform::IS_WINDOWS

  # ...
end
```

## Development

After checking out the repo, run `bundle install` to install dependencies.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/inviqa/vagrant-chef-solo-mount-options. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

