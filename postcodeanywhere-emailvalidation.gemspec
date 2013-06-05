# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'postcode_anywhere/email_validation/version'

Gem::Specification.new do |spec|
  spec.name                  = 'postcode_anywhere-email_validation'
  spec.version               = PostcodeAnywhere::EmailValidation::VERSION
  spec.authors               = ['Andrew Garner', 'Pablo Manrubia']
  spec.email                 = ['andrew@surefirething.co.uk', 'pablo@advera.co.uk']
  spec.description           = %q{Verify the existence of an email address.}
  spec.summary               = %q{Verifies the existence of an email address using the Email Validation web services from PostcodeAnywhere.}
  spec.homepage              = 'https://github.com/moneyadviceservice/postcode_anywhere-email_validation'
  spec.date                  = "2013-06-04"
  spec.files                 = `git ls-files`.split($/)
  spec.executables           = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files            = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths         = ['lib']
  spec.required_ruby_version = '>= 1.9.2'

  spec.add_dependency 'rest-client', '~> 1.6'
  spec.add_dependency 'activemodel', '~> 3.2'

  spec.add_development_dependency 'bundler', '~> 1.2'
  spec.add_development_dependency 'capybara', '~> 2.1'
  spec.add_development_dependency 'coveralls'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 2.0'
  spec.add_development_dependency 'vcr', '~> 2.4'
  spec.add_development_dependency 'webmock', '~> 1.0'
end
