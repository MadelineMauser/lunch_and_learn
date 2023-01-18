class EdamamFacade
  def self.recipes(country)
    recipe_response = EdamamService.get_recipes(country)
    recipe_response[:hits].map do |recipe_hash|
      recipe_info_hash = {}
      recipe_info_hash[:title] = recipe_hash[:recipe][:label]
      recipe_info_hash[:url] = recipe_hash[:recipe][:uri]
      recipe_info_hash[:image] = recipe_hash[:recipe][:image]
      Recipe.new(recipe_info_hash, country)
    end
  end
end