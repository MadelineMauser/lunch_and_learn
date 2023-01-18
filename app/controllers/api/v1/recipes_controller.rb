class Api::V1::RecipesController < ApplicationController
  def index
    if params[:country]
      render json: RecipeSerializer.new(EdamamFacade.recipes(params[:country].downcase))
    else
      render json: RecipeSerializer.new(EdamamFacade.recipes(CountriesFacade.random_country))
    end
  end
end