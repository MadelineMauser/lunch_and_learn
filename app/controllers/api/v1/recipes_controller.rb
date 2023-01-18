class Api::V1::RecipesController < ApplicationController
  def index
    if params[:country]
      render json: RecipeSerializer.new(RecipesFacade.recipes(params[:country].downcase))
    else
      render json: RecipeSerializer.new(RecipesFacade.recipes(CountriesHelper.random_country))
    end
  end
end