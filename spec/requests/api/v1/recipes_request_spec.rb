require 'rails_helper'

RSpec.describe "Recipes Requests", type: :request do
  describe "GET /index" do
    context 'happy path' do
      context 'when a country is given as a param' do
        it 'returns a response', :vcr do
          get '/api/v1/recipes?country=France' 

          expect(response).to be_successful
        end

        it 'returns a list of recipes for the inputted country', :vcr do
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
        it 'returns a response', :vcr do
          get '/api/v1/recipes' 

          expect(response).to be_successful
        end
        it 'returns a list of recipes from a random country', :vcr do
          get '/api/v1/recipes' 

          recipes = JSON.parse(response.body, symbolize_names: true)

          expect(recipes).to be_a(Hash)
          expect(recipes[:data]).to be_an(Array)
          expect(recipes[:data].first[:attributes][:country]).to be_a(String)
          expect(recipes[:data].first[:attributes][:country].empty?).to eq(false)
        end
      end

      it 'only returns necessary data', :vcr do
        get '/api/v1/recipes?country=France' 

        recipes = JSON.parse(response.body, symbolize_names: true)

        expect(recipes.keys).to eq([:data])
        expect(recipes[:data].first.keys).to eq([:id, :type, :attributes])
        expect(recipes[:data].first[:attributes].keys).to eq([:title, :url, :country, :image])
      end
    end
    context 'sad path' do
      it 'returns an empty array if the country string is empty', :vcr do
        get '/api/v1/recipes?country='

        recipes = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_successful
        expect(recipes[:data]).to be_an(Array)
        expect(recipes[:data].empty?).to eq(true)
      end
      it 'returns an empty array if the country string is empty', :vcr do
        get '/api/v1/recipes?country=invalid_country_query'

        recipes = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_successful
        expect(recipes[:data]).to be_an(Array)
        expect(recipes[:data].empty?).to eq(true)
      end
    end
  end
end
