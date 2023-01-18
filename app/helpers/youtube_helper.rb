module YoutubeHelper
  def self.recipes_array(country)
    recipe_response = EdamamService.get_recipes(country)
    recipe_response[:hits].map do |recipe_hash|
      recipe_info_hash = {}
      recipe_info_hash[:title] = recipe_hash[:recipe][:label]
      recipe_info_hash[:url] = recipe_hash[:recipe][:uri]
      recipe_info_hash[:image] = recipe_hash[:recipe][:image]
      return recipe_info_hash
    end
  end
end