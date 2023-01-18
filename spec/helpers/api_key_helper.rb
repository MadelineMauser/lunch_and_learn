require 'rails_helper'

RSpec.describe ApiKeyHelper do
  it '.new_key' do
    existing_key = ApiKeyHelper.new_key

    expect(existing_key).to be_a(String)

    User.create!(name: "John Doe", email: "jdoe@generic.com", api_key: existing_key)

    expect(User.exists?(api_key: existing_key)).to eq(true)

    new_key = ApiKeyHelper.new_key

    expect(new_key).not_to eq(existing_key)
  end
end