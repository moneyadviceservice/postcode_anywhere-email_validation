# frozen_string_literal: true

source 'http://gems.dev.mas.local'
source 'https://rubygems.org'

gemspec

gem 'pry-byebug'

group :development do
  gem 'activemodel', '~> 4.2'
  gem 'rest-client', '~> 2.0'
end

group :test do
  gem 'capybara', '~> 2.1'
  gem 'coveralls'
  gem 'danger', require: false
  gem 'danger-rubocop', require: false
  gem 'rake'
  gem 'rspec', '~> 2.0'
  gem 'vcr', '~> 4.0'
  gem 'webmock', '~> 3.0'
end

gem 'mas-build' if ENV['MAS_BUILD']
