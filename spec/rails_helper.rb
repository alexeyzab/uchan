ENV["RAILS_ENV"] ||= 'test'
require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/rails'
require 'shoulda-matchers'
require 'paperclip/matchers'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }


ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.include Formulaic::Dsl, type: :feature

  config.include FactoryGirl::Syntax::Methods

  config.use_transactional_fixtures = false

  config.infer_spec_type_from_file_location!

  config.include Paperclip::Shoulda::Matchers
end
