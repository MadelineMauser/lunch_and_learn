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

  describe "Return Favorites" do
    context 'happy path' do
      before :each do
        @john_user = User.create!(name: "John Doe", email: "jdoe@generic.com", api_key: "qwertyuiop")
        @mike_user = User.create!(name: "Mike Smith", email: "msmith@generic.com", api_key: "asdfghjkl")

        @favorite1 = Favorite.create!(user_id: @john_user.id, country: "thailand", recipe_link: "recipe.com/pad", recipe_title: "Pad Thai")
        @favorite2 = Favorite.create!(user_id: @john_user.id, country: "china", recipe_link: "recipe.com/rice", recipe_title: "Fried Rice")
        @favorite3 = Favorite.create!(user_id: @mike_user.id, country: "spain", recipe_link: "recipe.com/paella", recipe_title: "Seafood Paella")
      end
      it 'returns a response' do
        get '/api/v1/favorites?api_key=qwertyuiop', headers: headers = {"CONTENT_TYPE" => "application/json", "ACCEPT" => "application/json"}
        
        expect(response).to be_successful
        expect(response).to have_http_status(200)
      end
      it 'returns data of all favorites for the given user' do
        get '/api/v1/favorites?api_key=qwertyuiop', headers: headers = {"CONTENT_TYPE" => "application/json", "ACCEPT" => "application/json"}

        returned_favorites = JSON.parse(response.body, symbolize_names: true)

        expect(returned_favorites).to be_a(Hash)
        expect(returned_favorites[:data]).to be_an(Array)
        expect(returned_favorites[:data].size).to eq(2)
        expect(returned_favorites[:data].first[:id]).to eq(@favorite1.id)
        expect(returned_favorites[:data].last[:id]).to eq(@favorite2.id)
        expect(returned_favorites[:data].first[:type]).to eq("favorite")
        expect(returned_favorites[:data].first[:attributes]).to be_a(Hash)
        expect(returned_favorites[:data].first[:attributes][:recipe_title]).to eq(@favorite1.recipe_title)
        expect(returned_favorites[:data].first[:attributes][:recipe_link]).to eq(@favorite1.recipe_link)
        expect(returned_favorites[:data].first[:attributes][:country]).to eq(@favorite1.country)
        expect(returned_favorites[:data].first[:attributes][:created_at]).to eq(@favorite1.created_at)
      end

      it 'only returns the necessary data' do
        get '/api/v1/favorites?api_key=qwertyuiop', headers: headers = {"CONTENT_TYPE" => "application/json", "ACCEPT" => "application/json"}

        returned_favorites = JSON.parse(response.body, symbolize_names: true)

        expect(returned_favorites.keys).to eq([:data])
        expect(returned_favorites.[:data].first.keys).to eq([:id, :type, :attributes])
        expect(returned_favorites.[:data].first[:attributes].keys).to eq([:recipe_title, :recipe_link, :country, :created_at])
      end
    end

    context 'sad path' do
      it 'returns an error if api_key is invalid' do
        get '/api/v1/favorites?api_key=qwertyuiop', headers: headers = {"CONTENT_TYPE" => "application/json", "ACCEPT" => "application/json"}
        
        response_body = JSON.parse(response.body, symbolize_names: true)

        expect(response).to have_http_status(400)
        expect(response_body[:error]).to eq("API key is invalid")
      end
    end
  end
end
