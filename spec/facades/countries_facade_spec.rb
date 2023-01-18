require 'rails_helper'

RSpec.describe CountriesFacade do
  it '.random_country' do
    country = EdamamFacade.random_country

    expect(country).to be_a(String)
  end
end
