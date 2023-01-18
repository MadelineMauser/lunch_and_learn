class Api::V1::LearningResourcesController < ApplicationController
  def index
      render json: LearningResourceSerializer.new(LearningResourcesFacade.learning_resource(params[:country].downcase))
  end
end