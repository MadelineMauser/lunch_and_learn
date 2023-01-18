class EdamamService
  def self.conn 
    Faraday.new(url: "https://api.edamam.com/api/recipes/v2")
  end

  def self.get_url(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end
  
  def self.get_recipes(country)
    get_url("?app_key=#{ENV["edamam_api_key"]}&app_id=#{ENV["edamam_app_id"]}=#{country}&type=public")
  end
end