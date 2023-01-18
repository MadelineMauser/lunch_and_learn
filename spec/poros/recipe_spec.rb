require 'rails_helper'

RSpec.describe Recipe do
  describe 'existence' do
    it 'exists and has attributes' do
      recipe_info = {title: "Fried Rice", url: "example.com", image: "example.com/image"}
      country = "china"
      recipe = Recipe.new(recipe_info, country)

      expect(recipe).to be_a(Recipe)
      expect(recipe.title).to eq("Fried Rice")
      expect(recipe.url).to eq("example.com")
      expect(recipe.country).to eq("china")
      expect(recipe.image).to eq("example.com/image")
    end
  end
end
