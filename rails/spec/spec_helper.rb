ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)
require "rspec/autorun"
require "rspec/rails"
require "capybara/rails"
require "vcr"
require "pry"

Dir[Rails.root.join("spec/support/**/*.rb")].each { |file| require file }

ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

VCR.configure do |cassette|
  cassette.cassette_library_dir = "spec/cassettes"
  cassette.hook_into :webmock
  cassette.configure_rspec_metadata!
end

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.filter_run focus: true
  config.order = "random"
  config.infer_base_class_for_anonymous_controllers = false

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
