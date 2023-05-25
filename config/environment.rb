# frozen_string_literal: true

# Load the Rails application.
require_relative 'application'
require 'opentelemetry/sdk'

OpenTelemetry::SDK.configure do |c|
  c.use_all
end

# Initialize the Rails application.
Rails.application.initialize!
