# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.3'

gem 'bcrypt', '~> 3.1.17'
gem 'bootsnap', '~> 1.11.1', require: false
gem 'interactor-rails', '~> 2.2.1'
gem 'jsonapi-serializer', '~> 2.2.0'
gem 'jwt', '~> 2.3.0'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rack-cors', '~> 1.1'
gem 'rails', '~> 7.0.2', '>= 7.0.2.3'
gem 'rswag', '~> 2.5.1'

group :development, :test do
  gem 'pry-rails', '~> 0.3.9'
  gem 'rspec-rails', '~> 5.1.2'
end

group :development do
  gem 'lefthook', '~> 0.7.7'
  gem 'rubocop', '~> 1.24.1'
  gem 'rubocop-performance', '~> 1.12.0'
  gem 'rubocop-rails', '~> 2.12.4'
  gem 'rubocop-rspec', '~> 2.6.0'
end

group :test do
  gem 'factory_bot_rails', '~> 6.2.0'
  gem 'ffaker', '~> 2.20.0'
end
