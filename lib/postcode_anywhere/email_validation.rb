require 'postcode_anywhere/email_validation/response'
require 'postcode_anywhere/email_validation/validation_error'
require 'postcode_anywhere/email_validation/validator'
require 'postcode_anywhere/email_validation/version'
require 'postcode_anywhere/matchers/email_validator' if defined?(RSpec)

require 'rest_client'

module PostcodeAnywhere
  module EmailValidation

    HOST = 'http://services.postcodeanywhere.co.uk/' +
        'EmailValidation/Interactive/Validate/v1.10/json3.ws'

    class << self
      attr_accessor :key

      def valid?(email)
        json     = RestClient.get(HOST, params: { Key: key, Email: email })
        response = Response.parse(json)

        response.valid?
      end
    end

  end
end
