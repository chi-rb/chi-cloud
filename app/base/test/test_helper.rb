Rails.env = ENV['RAILS_ENV'] = ENV['RACK_ENV'] = 'test'
$VERBOSE = nil

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/mock'
