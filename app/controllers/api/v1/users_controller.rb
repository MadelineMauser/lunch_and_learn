class Api::V1::UsersController < ApplicationController
  def create
    render json: RecipeSerializer.new(RecipesFacade.recipes(CountriesHelper.random_country))
  end
end