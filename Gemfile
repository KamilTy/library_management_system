# frozen_string_literal: true

source 'https://rubygems.org'

gem 'bootsnap', require: false
gem 'devise', '~> 4.9'
gem 'devise-jwt', '~> 0.11.0'
gem 'dotenv', '~> 3.1'
gem 'jsonapi-serializer', '~> 2.2'
gem 'pg', '~> 1.1'
gem 'puma', '>= 5.0'
gem 'rack-cors', '~> 2.0'
gem 'rails', '~> 7.1.3', '>= 7.1.3.3'
gem 'tzinfo-data', platforms: %i[windows jruby]
ruby '3.3.2'

group :development, :test do
  gem 'debug', platforms: %i[mri windows]
  gem 'factory_bot_rails', '~> 6.4'
  gem 'pry', '~> 0.14.2'
  gem 'rspec-rails', '~> 6.1'
end

group :test do
  gem 'database_cleaner-active_record', '~> 2.1'
  gem 'faker', '~> 3.4'
  gem 'shoulda-matchers', '~> 6.2'
end
