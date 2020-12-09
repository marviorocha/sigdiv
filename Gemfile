# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

 
gem 'rails', '~> 6.0.3.4'
 
gem 'pg'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'bootsnap', '>= 1.1.0', :require => false

gem 'simple_form'
gem 'cocoon'
gem 'zeitwerk'
gem 'dentaku'
gem 'banco_central'
gem 'jbuilder', :github => 'rails/jbuilder', :branch => 'master'
gem 'bootstrap', '>= 4.3.1'
gem 'font-awesome-rails'
gem 'jquery'
gem 'jquery-ui-rails'
gem 'jquery-validation-rails'
gem 'jquery-mask-plugin'
gem 'jquery-datatables'

gem 'prawn'
gem 'prawn-table'

gem "webpacker"
gem 'bootsnap', '>= 1.1.0', :require => false

group :development, :test do
  gem 'byebug', :platforms => [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails'
  gem 'pry'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'rspec_junit_formatter'
  gem 'rspec-rails'
  # gem 'rubocop-rspec', '~> 1.44.1', require: false
end

group :development do
 
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'spring-commands-rspec'
  gem 'rubocop-rails', :require => false
  gem 'rubocop-performance', :require => false
   
end

group :test do
 
  gem 'capybara'
  gem 'selenium-webdriver'
 
  # gem 'chromedriver-helper' is deprecated
  gem 'rspec-rails'
  gem 'rspec-collection_matchers'
  gem 'faker'  
  gem 'shoulda-matchers', '4.0.0.rc1'
  gem 'rails-controller-testing'
  gem 'httparty'
  gem 'webmock'
  gem 'vcr'
  gem 'rspec-json_expectations'
  gem 'json_matchers'
  gem 'rubocop-rails', :require => false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', :platforms => [:mingw, :mswin, :x64_mingw, :jruby]

gem 'fast_jsonapi', '~> 1.5'
gem 'prawn'
gem 'prawn-table'
gem 'webpacker'
gem "redis"
gem "pagy", "~> 3.9"

gem "active_record_query_trace", "~> 1.8"

gem "rest-client", "~> 2.1"
