module YoutubeHelper
  def self.video(country)
    video_response = YoutubeService.get_video(country)
      video_info_hash = {}
      video_info_hash[:title] = video_response[:items].first[:snippet][:title]
      video_info_hash[:youtube_video_id] = video_response[:items].first[:id][:videoId]
      video_info_hash
  end
end