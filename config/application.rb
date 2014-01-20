require 'rubygems'
require 'bundler'

Bundler.require(:default)

module Urgents
  extend self

  attr_accessor :root
  @root = File.expand_path ''

  attr_accessor :no_reply
  @no_reply = 'no-reply@example.com'
end

Dir[File.expand_path('{app,config}/**/*.rb')].each(&method(:require))
