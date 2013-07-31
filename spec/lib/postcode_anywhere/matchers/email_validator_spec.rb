require 'spec_helper'

module PostcodeAnywhere::EmailValidation

  describe 'Validator Matcher' do

    context 'when Validator is defined' do
      subject { ::ValidatedClass.new }

      it { should validate_email_with_postcode_anywhere }

      it { should validate_email_with_postcode_anywhere.on_attribute(:email) }

      it { should_not validate_email_with_postcode_anywhere.on_attribute(:email_address) }
    end

    context 'when Validator is not defined' do
      subject { ::NotValidatedClass.new }

      it { should_not validate_email_with_postcode_anywhere }
    end

  end
end