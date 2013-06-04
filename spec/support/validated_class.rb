class ValidatedClass
  include ActiveModel::Validations
  attr_accessor :email
  validates_with PostcodeAnywhere::EmailValidation::Validator, :attributes => [:email]
end

