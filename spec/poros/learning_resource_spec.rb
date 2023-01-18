require 'rails_helper'

RSpec.describe LearningResource do
  describe 'existence' do
    it 'exists and has attributes' do
      country = "france"
      video = {title: "All About France", youtube_video_id: "as7d2N9sQn"}
      images = [{alt_tag: "Paris streets", url: "pexels.com/paris"}, {alt_tag: "Eiffel Tower", url: "pexels.com/eiffel"}]

      learning_resource = LearningResource.new(country, video, images)

      expect(learning_resource).to be_a(LearningResource)
      expect(learning_resource.country).to eq("france")
      expect(learning_resource.video).to eq({title: "All About France", youtube_video_id: "as7d2N9sQn"})
      expect(learning_resource.images).to eq([{alt_tag: "Paris streets", url: "pexels.com/paris"}, {alt_tag: "Eiffel Tower", url: "pexels.com/eiffel"}])
    end
  end
end
