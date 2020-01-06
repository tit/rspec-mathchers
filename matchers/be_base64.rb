# frozen_string_literal: true

RSpec::Matchers.define :be_base64 do
  see_url = URI.parse 'https://www.wikipedia.org/wiki/Base64'

  match do |actual|
    base64_regexp = %r(^(?:[A-Za-z0-9+\/]{4})*(?:[A-Za-z0-9+\/]{2}==|[A-Za-z0-9+\/]{3}=)?$)
    actual.match? base64_regexp
  end

  failure_message do |actual|
    <<~TEXT
      expected #{actual} is base64
      see: #{see_url}
    TEXT
  end

  failure_message_when_negated do |actual|
    <<~TEXT
      expected #{actual} is not base64
      see: #{see_url}
    TEXT
  end

  description do
    <<~TEXT
      validate String as base64
      see: #{see_url}
    TEXT
  end
end
