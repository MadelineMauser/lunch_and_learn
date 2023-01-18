require 'rails_helper'

RSpec.describe CountriesFacade do
  it '.random_country', :vcr do
    country = EdamamFacade.random_country

    expect(country).to be_a(String)
  end
end
