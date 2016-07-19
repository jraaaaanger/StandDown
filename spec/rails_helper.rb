ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'

Capybara.javascript_driver = :webkit

Capybara::Webkit.configure do |config|
  config.allow_url('fonts.googleapis.com')
end

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.include Warden::Test::Helpers
  config.before :suite do
    Warden.test_mode!
  end
  config.after :each do
    Warden.test_reset!
  end

  config.use_transactional_fixtures = false

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
end

require 'capybara/rails'
require 'valid_attribute'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end
