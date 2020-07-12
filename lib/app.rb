# Load the bundled environment
require "rubygems"
require "bundler/setup"

require_relative "./main"
require "rack"

Rack::Handler::Thin.run Main.new
