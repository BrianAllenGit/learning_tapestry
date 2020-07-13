require 'rspec'
require 'rack/test'
require_relative './../lib/main'

RSpec.configure do |config|
  config.include Rack::Test::Methods
end

describe Main do
  let(:app) { Main.new }
  
  context 'get to /resources' do
    let(:response) { get '/resources' }
    it { expect(response.status).to eq 200 }
  end
  
  context 'post to /resources' do
    let(:response) { post '/resources' }
    it { expect(response.status).to eq 405 }
  end

  context 'put to /resources' do  
    let(:response) { put '/resources' }
    it { expect(response.status).to eq 405 }
  end

  context 'delete to /resources' do
    let(:response) { delete '/resources' }
    it { expect(response.status).to eq 405 }
  end

  context 'get to /resources_by_field' do
    let(:response) { get '/resources_by_field' }
    it { expect(response.status).to eq 200 }
  end
    
  context 'post to /resources_by_field' do
    let(:response) { post '/resources_by_field' }
    it { expect(response.status).to eq 405 }
  end
  
  context 'put to /resources_by_field' do
    let(:response) { put '/resources_by_field' }
    it { expect(response.status).to eq 405 }
  end

  context 'delete to /resources_by_field' do
    let(:response) { delete '/resources_by_field' }
    it { expect(response.status).to eq 405 }
  end 

  context 'get to /random_url' do
    let(:response) { get '/random_url' }
    it { expect(response.status).to eq 404 }
  end 
end