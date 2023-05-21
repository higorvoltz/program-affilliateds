# frozen_string_literal: true

require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_mailbox/engine'
require 'action_text/engine'
require 'action_view/railtie'
require 'action_cable/engine'
# require "sprockets/railtie"
require 'rails/test_unit/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ProgramAffiliatedApi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # TimeZone
    config.time_zone = 'Brasilia'
    config.active_record.default_timezone = :local

    # Load locales
    config.i18n.enforce_available_locales = true
    config.i18n.available_locales = ['en', 'pt-BR']
    config.i18n.default_locale = 'pt-BR'
    config.active_model.i18n_customize_full_message = true
    config.encoding = 'utf-8'
    config.i18n.load_path += Dir[
      Rails.root.join('config/locales/**/*.{rb,yml}').to_s
    ]

    config.api_only = true
    config.generators do |g|
      g.orm :active_record, primary_key_type: :uuid
      g.test_framework :rspec
    end
  end
end
