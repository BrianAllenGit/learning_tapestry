require 'net/http'
require 'httparty'
require 'jwt'

class FetchData
    def run(url = "https://staging.credentialengineregistry.org/envelopes")
        response = HTTParty.get(url, {format: :json})
        response.parsed_response.map { |envelope| 
            decoded_resource = JWT.decode envelope["resource"], OpenSSL::PKey::RSA.new(envelope["resource_public_key"]), false, { algorithm: 'RS256' }
            puts decoded_resource
        }

    end
end

