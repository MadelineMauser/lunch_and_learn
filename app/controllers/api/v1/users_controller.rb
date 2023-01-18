class Api::V1::UsersController < ApplicationController
  def create
      new_user = User.new(user_params)
      new_user[:api_key] = ApiKeyHelper.new_key
      if new_user.save
        render json: UserSerializer.new(new_user), status: 201
      else
        render json: {error: new_user.errors.full_messages.join(", ")}, status: 400
      end
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end