# frozen_string_literal: true

RSpec::Matchers.define :be_currency do
  # is not full list
  currencies = %w[RUB USD EUR].freeze

  see_url = URI.parse 'https://www.wikipedia.org/wiki/ISO_4217'

  match do |actual|
    currencies.include? actual
  end

  failure_message do |actual|
    <<~TEXT
      expected #{actual} is currency
      see: #{see_url}
    TEXT
  end

  failure_message_when_negated do |actual|
    <<~TEXT
      expected #{actual} is not currency
      see: #{see_url}
    TEXT
  end

  description do
    <<~TEXT
      validate String as currency
      see: #{see_url}
    TEXT
  end
end
