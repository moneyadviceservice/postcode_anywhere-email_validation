require 'json'

module PostcodeAnywhere
  module EmailValidation
    class Response

      def self.parse(json)
        response = JSON.parse(json)['Items'].first
        error    = if response['Error']
                     ValidationError.new(response['Description'],
                                         code:       response['Error'],
                                         cause:      response['Cause'],
                                         resolution: response['Resolution'])
                   end

        new(response['ValidFormat'], response['FoundDnsRecord'], error)
      end

      def valid?
        raise error if error?

        valid_format? && valid_dns_record?
      end

      private

      attr_accessor :valid_format
      attr_accessor :found_dns_record
      attr_accessor :error

      def initialize(valid_format, found_dns_record, error)
        self.valid_format     = valid_format
        self.found_dns_record = found_dns_record
        self.error            = error
      end

      def valid_format?
        !!valid_format
      end

      def valid_dns_record?
        !!found_dns_record
      end

      def error?
        !!error
      end

    end
  end
end
