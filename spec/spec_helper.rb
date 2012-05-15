require 'sinatra/contrib'
require 'sinatra/jsend'

RSpec.configure do |config|
  config.expect_with :rspec, :stdlib
  config.include Sinatra::TestHelpers
end
