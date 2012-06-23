ENV["RAILS_ENV"] ||= 'test'
require 'rspec/core'
require File.expand_path "../support/rails", __FILE__

RSpec.configure do |config|
  config.mock_with :rspec
end
