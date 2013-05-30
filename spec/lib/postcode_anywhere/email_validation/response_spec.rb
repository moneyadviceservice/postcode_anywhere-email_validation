require 'spec_helper'

module PostcodeAnywhere::EmailValidation
  describe Response do
    describe '.valid?' do
      context 'when a DNS record is found and the format is valid' do
        subject { described_class.new(true, true, nil) }

        it { should be_valid }
      end

      context 'when a DNS record is not found' do
        subject { described_class.new(true, false, nil) }

        it { should_not be_valid }
      end

      context 'with invalid format' do
        subject { described_class.new(false, true, nil) }

        it { should_not be_valid }
      end

      describe 'with an error' do
        let(:error) { ValidationError.new('An error',
                                          code:       '999',
                                          cause:      'A cause',
                                          resolution: 'A resolution') }

        subject { described_class.new(nil, nil, error) }

        it 'raises a validation error' do
          assertions = -> error {
            expect(error).to be_instance_of(ValidationError)
            expect(error.to_s).to eql('An error')
            expect(error.code).to eql('999')
            expect(error.cause).to eql('A cause')
            expect(error.resolution).to eql('A resolution')
          }

          expect { subject.valid? }.to raise_error(&assertions)
        end
      end
    end

    describe '#parse' do
      subject { described_class.parse(json) }

      context 'with a successful response' do
        let(:json) do
          '
            {
              "Items": [
                {
                  "Email":"john.doe@example.com",
                  "MailServer":"mail.example.com",
                  "ValidFormat":true,
                  "FoundDnsRecord":true
                }
              ]
            }
          '
        end

        it 'returns a response' do
          described_class.should_receive(:new).with(true, true, nil).and_return :response

          expect(subject).to eql(:response)
        end
      end

      context 'with an error response' do
        let(:json) do
          '
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
          '
        end

        it 'parses the error details' do
          ValidationError.should_receive(:new).with('An error',
                                                    code:       '999',
                                                    cause:      'A cause',
                                                    resolution: 'A resolution')

          subject
        end

        it 'returns a response' do
          described_class.should_receive(:new).with(nil, nil, an_instance_of(ValidationError)).and_return(:response)

          expect(subject).to eql(:response)
        end
      end
    end
  end
end
