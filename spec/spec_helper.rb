require 'simplecov'
SimpleCov.start

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'e_invoice'
require 'coveralls'

RSpec.configure do |config|
  # some (optional) config here
end
