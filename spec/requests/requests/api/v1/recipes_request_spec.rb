require 'rails_helper'

RSpec.describe "Requests::Api::V1::RecipesRequests", type: :request do
  describe "GET /index" do
    context 'happy path' do
      context 'when a country is given as a param' do
        it 'returns a response' do
          get '/api/v1/recipes?country=France' 

          expect(response).to be(successful)
        end

        it 'returns a list of recipes for the inputted country' do
          get '/api/v1/recipes?country=France' 

          recipes = JSON.parse(response.body, symbolize_names: true)

          expect(recipes).to be_a(Hash)
          expect(recipes[:data]).to be_an(Array)
          expect(recipes[:data].count).to be > 0
          expect(recipes[:data].first).to be_a(Hash)
          expect(recipes[:data].first[:id]).to be(nil)
          expect(recipes[:data].first[:type]).to eq("recipe")
          expect(recipes[:data].first[:attributes]).to be_a(Hash)
          expect(recipes[:data].first[:attributes][:title]).to be_a(String)
          expect(recipes[:data].first[:attributes][:url]).to be_a(String)
          expect(recipes[:data].first[:attributes][:country]).to eq("france")
          expect(recipes[:data].first[:attributes][:image]).to be_a(String)
        end
      end

      context 'when a country is not given' do
        it 'returns a response' do
          get '/api/v1/recipes' 

          expect(response).to be(successful)
        end
        it 'returns a list of recipes from a random country' do
          get '/api/v1/recipes' 

          recipes = JSON.parse(response.body, symbolize_names: true)

          expect(recipes).to be_a(Hash)
          expect(recipes[:data]).to be_an(Array)
          expect(recipes[:data].count).to be > 0
          expect(recipes[:data].first[:attributes][:country]).to be_a(String)
        end
      end
    end
  end
end
