class CountriesService
  def self.conn 
    Faraday.new(url: "https://restcountries.com/v3.1/")
  end

  def self.get_url(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end
  
  def self.get_countries
    get_url("all")
  end
end