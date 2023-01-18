require 'rails_helper'

RSpec.describe "Learning Resources Requests", type: :request do
  describe "GET /index" do
    context 'happy path' do
 
      xit 'returns a response', :vcr do
        get '/api/v1/learning_resources?country=France' 

        expect(response).to be_successful
      end

      xit 'returns learning resources for the inputted country', :vcr do
        get '/api/v1/learning_resources?country=France'

        learning_resources = JSON.parse(response.body, symbolize_names: true)

        expect(learning_resources).to be_a(Hash)
        expect(learning_resources[:data]).to be_a(Hash)
        expect(learning_resources[:data]).to be_a(Hash)
        expect(learning_resources[:data][:id]).to be(nil)
        expect(learning_resources[:data][:type]).to eq("learning_resource")
        expect(learning_resources[:data][:attributes]).to be_a(Hash)
        expect(learning_resources[:data][:attributes][:country]).to eq("france")
        expect(learning_resources[:data][:attributes][:video]).to be_a(Hash)
        expect(learning_resources[:data][:attributes][:video][:title]).to be_a(String)
        expect(learning_resources[:data][:attributes][:video][:youtube_video_id]).to be_a(String)
        expect(learning_resources[:data][:attributes][:images]).to be_an(Array)
        expect(learning_resources[:data][:attributes][:images].first).to be_a(Hash)
        expect(learning_resources[:data][:attributes][:images].first[:alt_tag]).to be_a(String)
        expect(learning_resources[:data][:attributes][:images].first[:url]).to be_a(String)
      end

      xit 'only returns necessary data', :vcr do
        get '/api/v1/learning_resources?country=France'

        learning_resources = JSON.parse(response.body, symbolize_names: true)

        expect(learning_resources.keys).to eq([:data])
        expect(learning_resources[:data].keys).to eq([:id, :type, :attributes])
        expect(learning_resources[:data][:attributes].keys).to eq([:country, :video, :images])
        expect(learning_resources[:data][:attributes][:video].keys).to eq([:title, :youtube_video_id])
        expect(learning_resources[:data][:attributes][:images].first.keys).to eq([:alt_tag, :url])
      end
    end
  end
end
