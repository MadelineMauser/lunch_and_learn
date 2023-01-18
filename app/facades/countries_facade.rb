class CountriesFacade
  def self.random_country
    countries_response = CountriesService.get_countries
    countries_response.sample[:name][:common]
  end
end