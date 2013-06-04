require 'spec_helper'

module PostcodeAnywhere
  module EmailValidation

    describe Validator do

      subject { ::ValidatedClass.new }

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

    end
  end
end