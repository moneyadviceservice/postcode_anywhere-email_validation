require 'spec_helper'

module PostcodeAnywhere
  describe EmailValidation do
    it { should respond_to(:key) }
    it { should respond_to(:valid?).with(1).argument }

    describe ".valid?" do
      subject { described_class.valid?('john.doe@example.com') }

      before(:all) do
        described_class.key = :the_key
      end

      before(:each) do
        stub_const('PostcodeAnywhere::EmailValidation::HOST', :host)

        RestClient.
            should_receive(:get).
            with(:host, params: { Key: :the_key, Email: 'john.doe@example.com' }).
            and_return(json)
      end

      context 'with a valid email and a DNS record is found' do
        let(:json) { build_json }

        it { should be_truthy }
      end

      context 'with invalid email' do
        let(:json) { build_json(ValidFormat: false) }

        it { should be_falsey }
      end

      context 'when a DNS entry is not found' do
        let(:json) { build_json(FoundDnsRecord: false) }

        it { should be_falsey }
      end

      context 'with an error' do
        let(:json) do
          %[
            {"Items":
              [
                {
                  "Error":"999",
                  "Description":"An error",
                  "Cause":"A cause",
                  "Resolution":"A resolution"
                }
              ]
            }
          ]
        end

        it 'raises an exception when error' do
          expect { subject }.to raise_error(EmailValidation::ValidationError)
        end
      end
    end

    def build_json(options = {})
      default_options = { Email:          'john.doe@example.com',
                          MailServer:     'mail.example.com',
                          ValidFormat:    true,
                          FoundDnsRecord: true }

      { Items: [default_options.merge(options)] }.to_json
    end
  end
end
