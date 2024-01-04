# frozen_string_literal: true

if Rails.env.test?
  require 'simplecov'
  require 'simplecov-json'

  SimpleCov.formatters = SimpleCov::Formatter::MultiFormatter.new(
    [
      SimpleCov::Formatter::HTMLFormatter,
      SimpleCov::Formatter::JSONFormatter
    ]
  )

  SimpleCov.start 'rails' do
    minimum_coverage 95
  end
end
