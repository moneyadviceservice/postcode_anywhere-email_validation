ENV['POSTCODE_ANYWHERE_KEY'] ||= 'AA11-AA11-AA11-AA11'

require 'postcode_anywhere/email_validation'

require 'capybara/rspec'
require 'vcr'
require 'pry'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }


RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.around(:each, :vcr) do |example|
    name = example.metadata[:full_description].downcase.gsub(/[^\w\/]+/, '_')

    VCR.use_cassette(name) { example.call }
  end

  config.order = 'random'
end

VCR.configure do |config|
  config.cassette_library_dir = 'spec/support/fixtures/vcr_cassettes'
  config.hook_into :webmock
  config.filter_sensitive_data('{{Key}}') { ENV['POSTCODE_ANYWHERE_KEY'] }
end
