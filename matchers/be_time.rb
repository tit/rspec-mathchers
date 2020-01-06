# frozen_string_literal: true

RSpec::Matchers.define :be_time do
  see_url = URI.parse 'https://ruby-doc.org/stdlib-2.5.1/libdoc/time/rdoc/Time.html#method-c-parse'

  match do |actual|
    Time.parse actual
    true
  rescue ArgumentError, TypeError
    false
  end

  failure_message do |actual|
    <<~TEXT
      expected #{actual} is time
      see: #{see_url}
    TEXT
  end

  failure_message_when_negated do |actual|
    <<~TEXT
      expected #{actual} is not time
      see: #{see_url}
    TEXT
  end

  description do
    <<~TEXT
      validate String as time
      see: #{see_url}
    TEXT
  end
end
