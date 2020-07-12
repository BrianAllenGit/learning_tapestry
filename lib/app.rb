# Load the bundled environment
require "rubygems"
require "bundler/setup"
require 'sequel'
DB = Sequel.connect(adapter: :postgres, user: 'learning_tapestry_admin', password: 'sKHnWjJcupRX0S8D', host: 'localhost', port: 5432, database: 'learning_tapestry_dev')

require_relative "./main"
require "rack"

Rack::Handler::Thin.run Main.new
