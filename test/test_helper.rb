ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require "simplecov"

class ActiveSupport::TestCase
  parallelize(workers: :number_of_processors, with: :threads)

  fixtures :all

  SimpleCov.start
  if ENV['RAILS_ENV'] == 'test'
    require 'simplecov'
    SimpleCov.start 'rails'
    puts "required simplecov"
  end
end
