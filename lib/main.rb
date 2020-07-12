require "rack"
require "thin"

class Main
    def call(env)
        request = Rack::Request.new(env)

        handle_request(request)
    end
  
    private
  
    def handle_request(request)
        return method_not_allowed unless request.request_method == "GET"
        return not_found unless request.path == "/resources" ||  request.path == "/resources_by_field"
            
        get(request)
    end

    def get(request)
        [200, { "Content-Type" => "text/html" }, ["Hello!"]]
    end

    def method_not_allowed()
        [405, {}, ["Method not allowed"]]
    end

    def not_found()
        [404, { "Content-Type" => "text/plain" }, ["Not found"]]
    end
end

