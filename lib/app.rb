# Load the bundled environment
require "rubygems"
require "bundler/setup"
require "rack"
require_relative "./main"
require_relative "./db"

DB.new()

Rack::Handler::Thin.run Main.new
