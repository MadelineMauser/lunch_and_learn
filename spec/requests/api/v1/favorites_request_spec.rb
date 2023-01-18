require 'rails_helper'

RSpec.describe "Favorites Requests", type: :request do
  describe "Add Favorites" do
    context 'happy path' do
      before :each do
        @john_user = User.create!(name: "John Doe", email: "jdoe@generic.com", api_key: "qwertyuiop")
      end
      it 'returns a response' do
        post '/api/v1/favorites', headers: headers = {"CONTENT_TYPE" => "application/json", "ACCEPT" => "application/json"}, params: {"api_key": "qwertyuiop", "country": "thailand", "recipe_link": "recipe.com/recipe", "recipe_title": "Pad Thai"}.to_json
        
        expect(response).to be_successful
        expect(response).to have_http_status(201)
      end
      it 'creates a favorite in the database' do
        expect(Favorite.count).to eq(0)

        post '/api/v1/favorites', headers: headers = {"CONTENT_TYPE" => "application/json", "ACCEPT" => "application/json"}, params: {"api_key": "qwertyuiop", "country": "thailand", "recipe_link": "recipe.com/recipe", "recipe_title": "Pad Thai"}.to_json

        expect(Favorite.count).to eq(1)

        created_favorite = Favorite.last

        expect(created_favorite.user_id).to eq(@john_user.id)
        expect(created_favorite.country).to eq("thailand")
        expect(created_favorite.recipe_link).to eq("recipe.com/recipe")
        expect(created_favorite.recipe_title).to eq("Pad Thai")
      end
      it 'only returns a sucess message' do
        post '/api/v1/favorites', headers: headers = {"CONTENT_TYPE" => "application/json", "ACCEPT" => "application/json"}, params: {"api_key": "qwertyuiop", "country": "thailand", "recipe_link": "recipe.com/recipe", "recipe_title": "Pad Thai"}.to_json

        response_body = JSON.parse(response.body, symbolize_names: true)

        expect(response_body[:success]).to eq("Favorite added successfully")
        expect(response_body.keys).to eq([:success])
      end
    end

    context 'sad path' do
      it 'returns an error if api_key does not exist' do
        post '/api/v1/favorites', headers: headers = {"CONTENT_TYPE" => "application/json", "ACCEPT" => "application/json"}, params: {"api_key": "notavalidkey", "country": "thailand", "recipe_link": "recipe.com/recipe", "recipe_title": "Pad Thai"}.to_json
        
        response_body = JSON.parse(response.body, symbolize_names: true)

        expect(response).to have_http_status(400)
        expect(response_body[:error]).to eq("API key is invalid")
      end
      it 'returns an error if the favorite fails to be created' do
        User.create!(name: "John Doe", email: "jdoe@generic.com", api_key: "qwertyuiop")

        post '/api/v1/favorites', headers: headers = {"CONTENT_TYPE" => "application/json", "ACCEPT" => "application/json"}, params: {"api_key": "qwertyuiop", "recipe_link": "recipe.com/recipe", "recipe_title": "Pad Thai"}.to_json
        
        response_body = JSON.parse(response.body, symbolize_names: true)

        expect(response).to have_http_status(400)
        expect(response_body[:error]).to eq("Country can't be blank")
      end
    end
  end
end
