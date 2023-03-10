require 'rails_helper'

RSpec.describe RecipesFacade do
  it '.recipes', :vcr do
    recipes = RecipesFacade.recipes("france")

    expect(recipes).to be_an(Array)
    expect(recipes.first).to be_a(Recipe)
    expect(recipes.first.title).to be_a(String)
    expect(recipes.first.url).to be_a(String)
    expect(recipes.first.country).to be_a(String)
    expect(recipes.first.image).to be_a(String)
  end
end
