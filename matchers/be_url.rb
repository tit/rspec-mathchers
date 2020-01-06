# frozen_string_literal: true

RSpec::Matchers.define :be_url do
  see_url = URI.parse 'https://en.wikipedia.org/wiki/Uniform_Resource_Identifier'

  match do |actual|
    URI.parse actual
    true
  rescue URI::InvalidURIError
    false
  end

  failure_message do |actual|
    <<~TEXT
      expected #{actual} is URI
      see: #{see_url}
    TEXT
  end

  failure_message_when_negated do |actual|
    <<~TEXT
      expected #{actual} is not URI
      see: #{see_url}
    TEXT
  end

  description do
    <<~TEXT
      validate String as URI
      see: #{see_url}
    TEXT
  end
end
