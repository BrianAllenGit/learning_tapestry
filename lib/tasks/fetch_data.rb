require 'net/http'
require 'httparty'
require 'jwt'
require 'json'
require_relative './../db'

class FetchData
  def run(url = 'https://staging.credentialengineregistry.org/envelopes')
    resources = DB.connect[:resources]
    response = HTTParty.get(url, {format: :json})
    response.parsed_response.map { |envelope| 
    decoded_resource = JWT.decode envelope['resource'], OpenSSL::PKey::RSA.new(envelope['resource_public_key']), false, { algorithm: 'RS256' }

    decoded_resource.map { |resource| resources.insert(:external_id => resource['@id'], :graph => resource['@graph'].to_json, :context => resource['@resource'].to_json) }
    }
  end
end

