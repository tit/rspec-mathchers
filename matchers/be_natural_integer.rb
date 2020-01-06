# frozen_string_literal: true

RSpec::Matchers.define :be_natural_integer do
  see_url = URI.parse 'https://www.wikipedia.org/wiki/Natural_number'

  match do |actual|
    (actual.class == Integer) && (actual >= 0)
  end

  failure_message do |actual|
    <<~TEXT
      expected #{actual} is natural integer
      see: #{see_url}
    TEXT
  end

  failure_message_when_negated do |actual|
    <<~TEXT
      expected #{actual} is not natural integer
      see: #{see_url}
    TEXT
  end

  description do
    <<~TEXT
      validate Integer as natural integer
      see: #{see_url}
    TEXT
  end
end
