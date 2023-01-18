require 'rails_helper'

RSpec.describe YoutubeFacade do
  it '.video', :vcr do
    video = YoutubeFacade.video("france")

    expect(video).to be_a(Hash)
    expect(video[:title]).to be_a(String)
    expect(video[:youtube_video_id]).to be_a(String)
  end
end