require 'rubygems'
require 'bundler'

ENV['APP_ENV'] ||= 'development'

module Urgents
  extend self

  attr_accessor :root
  @root = File.expand_path ''

  attr_accessor :no_reply
  @no_reply = 'no-reply@example.com'
end

Bundler.require(:default, ENV['APP_ENV'])
Dir[File.expand_path('{config,app}/**/*.rb')].each(&method(:require))
