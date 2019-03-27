# frozen_string_literal: true

module PostcodeAnywhere
  module EmailValidation
    class ValidationError < StandardError
      attr_reader :code, :cause, :resolution

      def initialize(message, metadata = {})
        super(message)

        @code       = metadata[:code]
        @cause      = metadata[:cause]
        @resolution = metadata[:resolution]
      end
    end
  end
end
