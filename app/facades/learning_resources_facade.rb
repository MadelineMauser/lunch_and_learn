class LearningResourcesFacade
  def self.learning_resource(country)
    video = YoutubeHelper.video(country)
    images = PexelsHelper.images_array(country)
    LearningResource.new(country, video, images)
  end
end