require 'spec_helper'

module PostcodeAnywhere::EmailValidation
  describe ValidationError do
    subject { described_class.new('An error') }

    it { should be_kind_of(StandardError) }

    it { should respond_to :message }
    it { should respond_to :code }
    it { should respond_to :cause }
    it { should respond_to :resolution }

    its(:to_s) { should eql('An error') }

    context 'with metadata' do
      subject do
        described_class.new('An error',
                            code:       '0',
                            cause:      'A cause',
                            resolution: 'A resolution')
      end

      its(:code) { should eql('0') }
      its(:cause) { should eql('A cause') }
      its(:resolution) { should eql('A resolution') }
    end
  end
end
