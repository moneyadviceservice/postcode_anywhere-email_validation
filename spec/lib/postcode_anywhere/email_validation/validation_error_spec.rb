# frozen_string_literal: true

require 'spec_helper'

module PostcodeAnywhere::EmailValidation
  describe ValidationError do
    subject { described_class.new('An error') }

    it { should be_kind_of(StandardError) }

    it { should respond_to :message }
    it { should respond_to :code }
    it { should respond_to :cause }
    it { should respond_to :resolution }

    it { expect(subject.to_s).to eql('An error') }

    context 'with metadata' do
      subject do
        described_class.new('An error',
                            code: '0',
                            cause: 'A cause',
                            resolution: 'A resolution')
      end

      it { expect(subject.code).to eql('0') }
      it { expect(subject.cause).to eql('A cause') }
      it { expect(subject.resolution).to eql('A resolution') }
    end
  end
end
