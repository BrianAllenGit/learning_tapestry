require_relative "./../../lib/tasks/fetch_data"

describe FetchData do
  subject(:api) { described_class.new() }
  
    describe '#run' do
        let(:staging_url) { "https://staging.credentialengineregistry.org/envelopes" }
        let(:staging_response) { instance_double(HTTParty::Response, body: staging_response_body) }
        let(:staging_response_body) { 'res' }

        before do
            allow(HTTParty).to receive(:get).and_return(staging_response)
            allow(staging_response).to receive(:parsed_response).and_return(Array([]))
        end

        it 'fetches the data from the URL' do
            api.run(:staging_url)
            expect(HTTParty).to have_received(:get).with(:staging_url, {:format=>:json})
        end
    end
end
