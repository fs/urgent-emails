ENV['APP_ENV'] = 'test'

require 'minitest/autorun'
require_relative '../config.rb'

# TODO: Investigate segmentation fault:
#Dir[File.expand_path('spec/support/**/*.rb')].each(&method(:require))
Dir[File.expand_path('support/**/*.rb', __dir__)].each { |path| require path }
