# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.2.2'

gem 'bootsnap', require: false
gem 'importmap-rails'
gem 'jbuilder'
gem 'pg', '~> 1.1'
gem 'puma', '>= 5.0'
gem 'rails', github: 'rails/rails', branch: 'main'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[windows jruby]

group :development, :test do
  gem 'brakeman'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails'
  gem 'rubocop', require: false
  gem 'rubocop-capybara', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
end

group :development do
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
end
