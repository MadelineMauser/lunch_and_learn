module CountriesHelper
  def self.random_country
    countries_response = CountriesService.get_countries
    countries_response.sample[:name][:common].downcase
  end
end