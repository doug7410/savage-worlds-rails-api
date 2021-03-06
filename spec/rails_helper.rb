# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'capybara/rails'
require 'rspec/rails'

Capybara.app_host = 'http://0.0.0.0:9000'
Capybara.run_server = false


ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.infer_spec_type_from_file_location!

  # the configs below are for database cleaner
  config.use_transactional_fixtures = false
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end
   
  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end
   
  config.before(:each, :js => true) do
    DatabaseCleaner.strategy = :truncation
  end
   
  config.before(:each) do
    DatabaseCleaner.start
  end
   
  config.after(:each) do
    DatabaseCleaner.clean
  end
end
