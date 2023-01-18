require 'rails_helper'

RSpec.describe LearningResourceFacade do
  xit '.learning_resource', :vcr do
    learning_resource = LearningResourceFacade.learning_resource("france")

    expect(learning_resource).to be_a(LearningResource)
    expect(learning_resource.country).to be_a(String)
    expect(learning_resource.video).to be_a(Hash)
    expect(learning_resource.video[:title]).to be_a(String)
    expect(learning_resource.video[:youtube_video_id]).to be_a(String)
    expect(learning_resource.images).to be_an(Array)
    expect(learning_resource.images.first).to be_a(Hash)
    expect(learning_resource.images.first[:alt_tag]).to be_a(String)
    expect(learning_resource.images.first[:url]).to be_a(String)
  end
end
