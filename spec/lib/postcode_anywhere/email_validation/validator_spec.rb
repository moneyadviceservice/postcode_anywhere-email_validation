# frozen_string_literal: true

require 'spec_helper'

module PostcodeAnywhere
  module EmailValidation
    describe Validator do
      subject { ::ValidatedClass.new }

      context 'blank email' do
        it 'is not valid' do
          PostcodeAnywhere::EmailValidation.should_not_receive(:valid?)
          expect(subject).to_not be_valid
        end
      end

      context 'Using Postcode Anywhere' do
        before { subject.email = 'an_email' }

        it 'is valid if service returns true' do
          PostcodeAnywhere::EmailValidation.should_receive(:valid?).with('an_email').and_return false
          expect(subject).to_not be_valid
        end

        it 'is invalid if service returns false' do
          PostcodeAnywhere::EmailValidation.should_receive(:valid?).with('an_email').and_return true
          expect(subject).to be_valid
        end
      end

      describe 'RSpec Matcher' do
        context 'with default attribute' do
          it { should validate_email_with_postcode_anywhere }
        end
        context 'with custom attribute' do
          it { should validate_email_with_postcode_anywhere.on_attribute(:email) }
        end
      end
    end
  end
end
