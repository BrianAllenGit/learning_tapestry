require_relative './../db'

class Resource   
  def initialize()
    unless DB.connect.table_exists?(:resources)
      DB.connect.create_table :resources do
        primary_key :id
        column :external_id, String
        column :graph, JSON
        column :context, JSON
      end
    end
  end 
end