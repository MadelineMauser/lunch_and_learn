class YoutubeService
  def self.conn 
    Faraday.new(url: "https://www.googleapis.com/youtube/v3/")
  end

  def self.get_url(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end
  
  def self.get_video(country)
    get_url("search?key=#{ENV["youtube_api_key"]}&part=snippet&channelId=UCluQ5yInbeAkkeCndNnUhpw&type=video&maxResults=1&q=#{country}")
  end
end