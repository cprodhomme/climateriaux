source 'https://rubygems.org'
ruby '2.3.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.3.13', '< 0.5'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

gem 'puma'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
#gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'devise'

gem 'font-awesome-rails'

gem 'carrierwave'

gem 'binding_of_caller'

gem 'kaminari'

gem 'cancancan'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin]

gem "bower-rails", "~> 0.9.2"

group :development, :test do
  gem 'guard-rspec', require: false
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'rspec-rails', '~> 3.0'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'better_errors'
  gem 'guard'
end

group :production do
  gem 'rails_12factor'
end

postinstall "rake bower:install"
