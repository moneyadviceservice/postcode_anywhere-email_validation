require 'spec_helper'

feature 'ActiveModel validator', :vcr do
  background do
    PostcodeAnywhere::EmailValidation.key = ENV['POSTCODE_ANYWHERE_KEY']
  end

  subject { ValidatedClass.new }

  context 'with invalid values' do
    %w(@example.com john.doe@).each do |value|
      scenario "is not valid on value:  #{value.inspect}" do
        subject.email = value
        expect(subject).to_not be_valid
      end
    end

  end

  context 'with valid values' do
    %w(pablo@google.com fake@jsf.io).each do |value|
      scenario "is not valid on value:  #{value.inspect}" do
        subject.email = value
        expect(subject).to be_valid
      end
    end
  end

end