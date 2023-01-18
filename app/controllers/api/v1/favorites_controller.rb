class Api::V1::FavoritesController < ApplicationController
  def create
      if User.exists?(api_key: params[:api_key]) == true
        new_favorite = Favorite.new(favorite_params)
        new_favorite[:user_id] = User.find_by(api_key: params[:api_key]).id

        if new_favorite.save
          render json: {success: "Favorite added successfully"}, status: 201
        else
          render json: {error: new_favorite.errors.full_messages.join(", ")}, status: 400
        end

      else
        render json: {error: "API key is invalid"}, status: 400
      end
  end

  private

  def favorite_params
    params.permit(:country, :recipe_link, :recipe_title)
  end
end