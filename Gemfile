source 'https://rubygems.org'
ruby '2.0.0'
gem 'rails', '4.0.1'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'httparty'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'
gem 'carrierwave'
gem 'fog'
gem 'figaro'
gem 'mini_magick'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'guard-rspec', require: false
  gem 'factory_girl_rails'
  gem 'selenium-webdriver', '2.35.1'
  gem 'capybara', '2.1.0' # Capybara is an integration testing tool for rack based web applications. It simulates how a user would interact with a website
  gem 'sqlite3'
  gem 'simplecov' # Code coverage for Ruby 1.9+ with a powerful configuration library and automatic merging of coverage across test suites
  gem 'rubocop' # Automatic Ruby code style checking tool. Aims to enforce the community-driven Ruby Style Guide
  gem 'brakeman' # Brakeman detects security vulnerabilities in Ruby on Rails applications via static analysis
end

group :test do
  gem "nyan-cat-formatter"
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :doc do
  gem 'sdoc', require: false
end

gem 'bcrypt-ruby', '~> 3.1.2'
