require 'rack'
require 'thin'
require_relative './db'

class Main
  def call(env)
    request = Rack::Request.new(env)

    handle_request(request)
  end
    
  private
  
  def handle_request(request)
    return method_not_allowed unless request.request_method == 'GET'
    return not_found unless request.path == '/resources' ||  request.path == '/resources_by_field'
            
    if request.path == '/resources'
      getAll(request)
    else  
      get(request)
    end
  end

  def get(request)
    resources = DB.connect[:resources]
    everything = resources.all
    [200, { 'Content-Type' => 'application/json' }, [everything]]
  end

  def getAll(request)
    resources = DB.connect[:resources]
    everything = resources.all
    [200, { 'Content-Type' => 'application/json' }, [everything]]
  end

  def method_not_allowed()
    [405, { 'Content-Type' => 'text/plain' }, ['Method not allowed']]
  end
  
  def not_found()
    [404, { 'Content-Type' => 'text/plain' }, ['Not found']]
  end
end

