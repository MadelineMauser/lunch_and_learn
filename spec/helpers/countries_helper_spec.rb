require 'rails_helper'

RSpec.describe CountriesHelper do
  it '.random_country', :vcr do
    country = CountriesFacade.random_country

    expect(country).to be_a(String)
    expect(country.empty?).to eq(false)
  end
end