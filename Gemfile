source 'https://rubygems.org'
ruby '2.0.0'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.1'


# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'
gem 'carrierwave'
gem 'fog'
gem 'figaro'

gem 'mini_magick'

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

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
