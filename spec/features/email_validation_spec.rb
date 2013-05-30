require 'spec_helper'

feature 'Validating an email address', :vcr do

  background do
    PostcodeAnywhere::EmailValidation.key = ENV['POSTCODE_ANYWHERE_KEY']
  end

  scenario 'With valid format and valid DNS record' do
    expect(PostcodeAnywhere::EmailValidation.valid?('info@google.com')).to be_true
  end

  scenario 'With invalid format' do
    expect(PostcodeAnywhere::EmailValidation.valid?('@google.com')).to be_false
  end

  scenario 'With invalid DNS record' do
    expect(PostcodeAnywhere::EmailValidation.valid?('info@google.google')).to be_false
  end

  scenario 'Without API key' do
    PostcodeAnywhere::EmailValidation.key = 'AA11-AA11-AA11-AA11'

    expect { PostcodeAnywhere::EmailValidation.valid?('info@google.com') }.to raise_error(PostcodeAnywhere::EmailValidation::ValidationError)
  end

end
