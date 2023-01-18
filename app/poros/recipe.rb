class Recipe
  attr_reader :title, :url, :country, :image

  def initialize(recipe_info, country)
    @title = recipe_info[:title]
    @url = recipe_info[:url]
    @country = country
    @image = recipe_info[:image]
  end
end