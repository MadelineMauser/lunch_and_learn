class Api::V1::UsersController < ApplicationController
  def create
    if User.create(CountriesHelper.random_country)
    render json: UsersSerializer.new(User.create(CountriesHelper.random_country))
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end