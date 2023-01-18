class RecipesFacade
  def self.recipes(country)
    recipe_response = EdamamHelper.recipes_array(country)
    recipe_response.map do |recipe_hash|
      Recipe.new(recipe_hash, country)
    end
  end
end