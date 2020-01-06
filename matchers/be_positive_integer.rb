# frozen_string_literal: true

RSpec::Matchers.define :be_positive_integer do
  see_url = URI.parse 'https://www.wikipedia.org/wiki/Integer'

  match do |actual|
    (actual.class == Integer) && actual.positive?
  end

  failure_message do |actual|
    <<~TEXT
      expected #{actual} is positive integer
      see: #{see_url}
    TEXT
  end

  failure_message_when_negated do |actual|
    <<~TEXT
      expected #{actual} is not positive integer
      see: #{see_url}
    TEXT
  end

  description do
    <<~TEXT
      validate Integer as positive integer
      see: #{see_url}
    TEXT
  end
end
