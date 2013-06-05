# PostcodeAnywhere::EmailValidation

[![Build Status][build-status-badge]] [build-status]
[![Code Climate][code-climate-badge]] [code-climate-feed]
[![Coverage Status][coverage-status-badge]] [coverage-status]

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

Or use the provided ActiveModel validator:

```ruby
class ValidatedClass
  include ActiveModel::Validations

  attr_accessor :email

  validates_with PostcodeAnywhere::EmailValidation::Validator, attributes: %w{ email }
end
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

[build-status]: https://travis-ci.org/moneyadviceservice/postcode_anywhere-email_validation
  "Build Status"

[build-status-badge]: https://travis-ci.org/moneyadviceservice/postcode_anywhere-email_validation.png
  "Build Status"

[code-climate-feed]: https://codeclimate.com/github/moneyadviceservice/postcode_anywhere-email_validation
  "Code Climate"

[code-climate-badge]: https://codeclimate.com/github/moneyadviceservice/postcode_anywhere-email_validation.png
  "Code Climate"

[coverage-status]: https://coveralls.io/r/moneyadviceservice/postcode_anywhere-email_validation
  "Coverage Status"

[coverage-status-badge]: https://coveralls.io/repos/moneyadviceservice/postcode_anywhere-email_validation/badge.png
  "Coverage Status"
