require 'rails_helper'

RSpec.describe YoutubeHelper do
  xit '.video', :vcr do
    video = YoutubeHelper.video("france")

    expect(video).to be_a(Hash)
    expect(video[:title]).to be_a(String)
    expect(video[:youtube_video_id]).to be_a(String)
  end
end