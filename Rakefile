require_relative './lib/tasks/fetch_data' 
require_relative './lib/db'

DB.new()

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
    
  task default: :spec

  desc 'Attempt to fetch data from URL and normalize response into DB'
  task :fetch_data do
    fetch_data = FetchData.new()
    fetch_data.run('https://staging.credentialengineregistry.org/envelopes')
  end
rescue LoadError
  # rspec not available
end