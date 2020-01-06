# frozen_string_literal: true

RSpec::Matchers.define :be_email do
  see_url = URI.parse 'https://www.wikipedia.org/wiki/Email_address'

  match do |actual|
    Mail::Address.new actual
    true
  rescue Mail::Field::IncompleteParseError
    false
  end

  failure_message do |actual|
    <<~TEXT
      expected #{actual} is email address
      see: #{see_url}
    TEXT
  end

  failure_message_when_negated do |actual|
    <<~TEXT
      expected #{actual} is not email address
      see: #{see_url}
    TEXT
  end

  description do
    <<~TEXT
      validate String as email address
      see: #{see_url}
    TEXT
  end
end
