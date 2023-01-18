require 'rails_helper'

RSpec.describe EdamamHelper do
  it '.recipes', :vcr do
    recipes = EdamamHelper.recipes("france")

    expect(recipes).to be_an(Array)
    expect(recipes.first).to be_a(Hash)
    expect(recipes.first[:title]).to be_a(String)
    expect(recipes.first[:url]).to be_a(String)
    expect(recipes.first[:image]).to be_a(String)
  end
end
