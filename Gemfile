source 'https://rubygems.org'
ruby '2.3.1'

gem 'rails', '4.2.6'
gem 'mysql2', '>= 0.3.13', '< 0.5'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'

gem 'puma'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
#gem 'turbolinks'

gem 'devise'

gem 'font-awesome-rails'

gem 'carrierwave'
gem 'mini_magick'
gem 'fog'

gem 'binding_of_caller'

gem 'kaminari'

gem 'cancancan'

gem 'devise-i18n'
gem 'rails-i18n', '~> 4.0.0'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin]

gem "bower-rails", "~> 0.9.2"

group :test do
  gem 'shoulda-matchers'
end

group :development, :test do
  gem 'guard-rspec', require: false
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'rspec-rails', '~> 3.0'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'byebug'
  gem 'dotenv-rails'
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
