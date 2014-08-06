source 'https://rubygems.org'

gem 'rake'
gem 'rails', '3.2.19'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'blacklight'
gem 'blacklight-sitemap'
gem 'devise'
gem 'rest-client'
gem 'simple-daemon'
gem "will_paginate",  '~> 3.0.2'
gem 'json'
gem 'active-fedora'
gem 'rubydora'
gem 'rails_config'

group :production do
   gem "mysql2", '~> 0.3'
end

group :development, :test do
  gem 'sqlite3'
  gem 'jettywrapper', "~> 1.3"
end

group :development do
  
end

group :test do
  gem 'rspec', '~> 2.14.0'
  gem 'rspec-rails'
  gem 'email_spec'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'factory_girl'
end

group :deployment do
  gem 'capistrano', '~> 3.0'
  gem 'lyberteam-capistrano-devel', '~> 3.0'
  gem 'capistrano-rails'
end
