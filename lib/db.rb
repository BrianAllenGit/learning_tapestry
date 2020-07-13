require "sequel"
require_relative "./models/resource"

class DB    
    def initialize()
        Resource.new()
    end

    def DB.connect
        Sequel.connect(adapter: :postgres, user: 'learning_tapestry_admin', password: 'sKHnWjJcupRX0S8D', host: 'localhost', port: 5432, database: 'learning_tapestry_dev')
    end
end