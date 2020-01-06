# frozen_string_literal: true

RSpec::Matchers.define :have_attr_writer do |expected|
  match do |actual|
    actual.respond_to? "#{expected}="
  end

  failure_message do |actual|
    "expected attr_writer for #{expected} on #{actual}"
  end

  failure_message_when_negated do |actual|
    "expected attr_writer for #{expected} not to be defined on #{actual}"
  end

  description do
    'checks to see if there is an attr writer on the instance.'
  end
end
