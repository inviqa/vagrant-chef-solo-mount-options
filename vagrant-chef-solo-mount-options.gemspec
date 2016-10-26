# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'vagrant-chef-solo-mount-options'
  spec.version       = '1.0.0'.freeze
  spec.authors       = ['Kieren Evans']
  spec.email         = ['kevans+vagrant_tasks@inviqa.com']

  spec.summary       = 'Vagrant Chef Solo Provisioner, with mount options'
  spec.description   = 'Vagrant Chef Solo Provisioner, with mount options'
  spec.homepage      = ''
  spec.licenses = ['MIT']

  spec.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features|\.rubocop\.yml|Rakefile)/}) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rubocop', '~> 0.43.0'
end
