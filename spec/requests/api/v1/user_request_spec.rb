require 'rails_helper'

RSpec.describe "User Requests", type: :request do
  describe "User Registration" do
    context 'happy path' do
      it 'returns a response' do
        post '/api/v1/users', headers: headers = {"CONTENT_TYPE" => "application/json", "ACCEPT" => "application/json"}, params: {"name": "John Doe", "email": "jdoe@generic.com"}.to_json
        
        expect(response).to be_successful
        expect(response).to have_http_status(201)
      end
      it 'creates a user in the database' do
        expect(User.count).to eq(0)

        post '/api/v1/users', headers: headers = {"CONTENT_TYPE" => "application/json", "ACCEPT" => "application/json"}, params: {"name": "John Doe", "email": "jdoe@generic.com"}.to_json

        expect(User.count).to eq(1)

        created_user = User.last

        expect(created_user.name).to eq("John Doe")
        expect(created_user.email).to eq("jdoe@generic.com")
        expect(created_user.api_key).to be_a(String)
      end
      it 'returns data of the newly created user' do
        post '/api/v1/users', headers: headers = {"CONTENT_TYPE" => "application/json", "ACCEPT" => "application/json"}, params: {"name": "John Doe", "email": "jdoe@generic.com"}.to_json

        created_user = User.last
        returned_user = JSON.parse(response.body, symbolize_names: true)

        expect(returned_user).to be_a(Hash)
        expect(returned_user[:data]).to be_a(Hash)
        expect(returned_user[:data][:type]).to eq("user")
        expect(returned_user[:data][:id].to_i).to eq(created_user.id)
        expect(returned_user[:data][:attributes]).to be_a(Hash)
        expect(returned_user[:data][:attributes][:name]).to eq(created_user.name)
        expect(returned_user[:data][:attributes][:email]).to eq(created_user.email)
        expect(returned_user[:data][:attributes][:api_key]).to eq(created_user.api_key)
      end

      it 'only returns necessary data' do
        post '/api/v1/users', headers: headers = {"CONTENT_TYPE" => "application/json", "ACCEPT" => "application/json"}, params: {"name": "John Doe", "email": "jdoe@generic.com"}.to_json

        returned_user = JSON.parse(response.body, symbolize_names: true)

        expect(returned_user.keys).to eq([:data])
        expect(returned_user[:data].keys).to eq([:id, :type, :attributes])
        expect(returned_user[:data][:attributes].keys).to eq([:name, :email, :api_key])
      end
    end

    context 'sad path' do
      it 'returns an error if email is not unique' do
        User.create!(name: "John Doe", email: "jdoe@generic.com", api_key: "qwertyuiop")
        post '/api/v1/users', headers: headers = {"CONTENT_TYPE" => "application/json", "ACCEPT" => "application/json"}, params: {"name": "John Doe", "email": "jdoe@generic.com"}.to_json
        
        response_body = JSON.parse(response.body, symbolize_names: true)

        expect(response).to have_http_status(400)
        expect(response_body[:error]).to eq("Email has already been taken")
      end
    end
  end
end
