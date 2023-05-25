# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.7'
# Use sqlite3 as the database for Active Record
gem 'sqlite3', '~> 1.4'
# https://github.com/ged/ruby-pg#how-to-install
gem 'pg', '~> 1.4', '>= 1.4.5'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# https://github.com/serradura/u-case
gem 'u-case', '~> 4.5', '>= 4.5.1'
# https://github.com/lucascaton/enumerate_it
gem 'enumerate_it', '~> 3.2', '>= 3.2.3'
# https://github.com/rails-api/active_model_serializers/tree/0-10-stable
gem 'active_model_serializers', '~> 0.10.13'
# https://logger.rocketjob.io/rails.html
gem 'bcrypt', '~> 3.1.7'
gem 'rails_semantic_logger', '~> 4.11'
# https://rubygems.org/gems/rswag
gem 'rswag', '~> 2.9'
# https://signoz.io/blog/opentelemetry-ruby/
gem 'opentelemetry-sdk'
gem 'opentelemetry-exporter-otlp'
gem 'opentelemetry-instrumentation-all'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

group :development do
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # https://github.com/rweng/pry-rails#usage
  gem 'pry-rails', '~> 0.3.9'
  # https://github.com/thoughtbot/factory_bot_rails
  gem 'factory_bot_rails', '~> 6.2'
  # https://github.com/faker-ruby/faker
  gem 'faker', '~> 2.23'
  # https://rubygems.org/gems/rubocop-rails
  gem 'rubocop-rails', '~> 2.16', '>= 2.16.1'
  # https://rubygems.org/gems/rubocop-performance
  gem 'rubocop-performance', '~> 1.15'
  # https://rubygems.org/gems/rubocop-rspec
  gem 'rubocop-rspec', '~> 2.13', '>= 2.13.2'
  # https://github.com/thoughtbot/json_matchers
  gem 'json_matchers', '~> 0.11.1'
end

group :test do
  # https://github.com/rspec/rspec-rails#installation
  gem 'rspec-rails', '~> 6.0'
  # https://github.com/thoughtbot/shoulda-matchers
  gem 'shoulda-matchers', '~> 5.2'
  # https://github.com/DatabaseCleaner/database_cleaner
  gem 'database_cleaner', '~> 2.0', '>= 2.0.1'
  # https://github.com/rails/rails-controller-testing
  gem 'rails-controller-testing', '~> 1.0', '>= 1.0.5'
  # https://github.com/bblimke/webmock#examples
  gem 'webmock', '~> 3.18', '>= 3.18.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
