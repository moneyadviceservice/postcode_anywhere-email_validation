RSpec::Matchers.define :validate_email_with_postcode_anywhere do

  chain :on_attribute do |attribute|
    @attribute = attribute
  end

  match do |model|
    model_validators = model.class.validators_on(attribute)
    model_validators.any? { |validator| validator.instance_of?(PostcodeAnywhere::EmailValidation::Validator) }
  end

  def attribute
    @attribute || :email
  end

  failure_message_for_should do |model|
    failure_message(model)
  end

  failure_message_for_should_not do |model|
    failure_message(model, 'not')
  end

  def failure_message(model, option = '')
    "#{model.class} should #{option} have 'PostcodeAnywhere::EmailValidation::Validator' on attribute #{attribute}"
  end

end