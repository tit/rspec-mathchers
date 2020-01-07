# frozen_string_literal: true

RSpec::Matchers.define :be_hexadecimal do
  see_url = URI.parse 'https://www.wikipedia.org/wiki/Hexadecimal'

  match do |actual|
    hex_regexp = /^[0-9a-f]+$/
    actual.match? hex_regexp
  end

  failure_message do |actual|
    <<~TEXT
      expected #{actual} is hexadecimal
      see: #{see_url}
    TEXT
  end

  failure_message_when_negated do |actual|
    <<~TEXT
      expected #{actual} is not hexadecimal
      see: #{see_url}
    TEXT
  end

  description do
    <<~TEXT
      validate String as hexadecimal
      see: #{see_url}
    TEXT
  end
end
