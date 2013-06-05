require 'active_model'

module PostcodeAnywhere
  module EmailValidation
    class Validator < ActiveModel::EachValidator
      def validate_each(record, attribute, value)
        if value.blank?
          record.errors.add(attribute, :blank, value: value)
        elsif !PostcodeAnywhere::EmailValidation.valid?(value)
          record.errors.add(attribute, :invalid, value: value)
        end
      end
    end
  end
end