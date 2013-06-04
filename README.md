# PostcodeAnywhere::EmailValidation

Verifies the existence of an email address using the
[Email Validation web services] [email-validation]
from [PostcodeAnywhere].

## Installation

Add this line to your application's Gemfile:

```sh
gem 'postcode_anywhere-email_validation'
```

And then execute:

```sh
$ bundle
```

Or install it yourself as:

```sh
$ gem install postcode_anywhere-email_validation
```

## Usage

```ruby
PostcodeAnywhere::EmailValidation.key = 'AA11-AA11-AA11-AA11'
PostcodeAnywhere::EmailValidation.valid?('info@google.com') #=> true
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[postcodeanywhere]: http://www.postcodeanywhere.co.uk/
  "PostcodeAnywhere"

[email-validation]: http://www.postcodeanywhere.co.uk/email-validation/
  "PostcodeAnywhere's Email Validation web services"