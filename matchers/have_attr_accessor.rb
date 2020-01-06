# frozen_string_literal: true

RSpec::Matchers.define :have_attr_accessor do |expected|
  match do |actual|
    actual.respond_to?(expected) && actual.respond_to?("#{expected}=")
  end

  failure_message do |actual|
    "expected attr_accessor for #{expected} on #{actual}"
  end

  failure_message_when_negated do |actual|
    "expected attr_accessor for #{expected} not to be defined on #{actual}"
  end

  description do
    'checks to see if there is an attr accessor on the instance.'
  end
end
