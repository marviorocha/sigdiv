# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

 
gem 'rails', '~> 6.0.3.4'
 
gem 'pg'
 
gem 'puma', '~> 3.11'
 
gem 'sass-rails', '~> 5.0'
 
gem 'uglifier', '>= 1.3.0'
 
gem 'simple_form'
gem 'cocoon'
gem 'carrierwave', '~> 1.0'
gem 'carrierwave-ftp', :require => 'carrierwave/storage/ftp'

gem 'zeitwerk'

gem 'dentaku'
gem 'banco_central'

gem 'jbuilder', github: 'rails/jbuilder', branch: 'master'
gem 'bootstrap', '>= 4.3.1'
gem 'font-awesome-rails'

gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'jquery-validation-rails'
gem 'jquery-mask-plugin'
gem 'jquery-datatables'

gem 'prawn'
gem 'prawn-table'

gem "webpacker", ">= 5.0"
gem 'bootsnap', '>= 1.1.0', :require => false

group :development, :test do
  
  gem 'byebug', :platforms => [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails', '~> 4.0'
  gem 'pry'
  
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'spring-commands-rspec'
  gem 'robocop', :require => false
  gem 'rubocop-performance', :require => false
  gem 'rubocop-rspec', :require => false
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  # gem 'chromedriver-helper' is deprecated
  gem 'rspec-rails', '~> 3.6' 
  gem 'rspec-collection_matchers'
  gem 'faker'  
  gem 'shoulda-matchers', '4.0.0.rc1'
  gem 'rails-controller-testing'
  gem 'httparty'
  gem 'webmock'
  gem 'vcr'
  gem 'rspec-json_expectations'
  gem 'json_matchers'
  gem 'robocop', :require => false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', :platforms => [:mingw, :mswin, :x64_mingw, :jruby]

gem "fast_jsonapi", "~> 1.5"
