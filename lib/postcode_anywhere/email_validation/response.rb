# frozen_string_literal: true

require 'json'

module PostcodeAnywhere
  module EmailValidation
    class Response
      def initialize(valid_format, found_dns_record, error)
        @valid_format     = valid_format
        @found_dns_record = found_dns_record
        @error            = error
      end

      def self.parse(json)
        response = JSON.parse(json)['Items'].first
        error    = if response['Error']
                     ValidationError.new(response['Description'],
                                         code: response['Error'],
                                         cause: response['Cause'],
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

      def valid_format?
        valid_format
      end

      def valid_dns_record?
        found_dns_record
      end

      def error?
        error
      end
    end
  end
end
