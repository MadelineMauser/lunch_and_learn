class PexelsService
  def self.conn 
    Faraday.new(url: "https://api.pexels.com/v1/") do |f|
      f.headers["Authorization"] = ENV['pexels_api_key']
    end
  end

  def self.get_url(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end
  
  def self.get_images(country)
    get_url("search?query=#{country}&per_page=10")
  end
end