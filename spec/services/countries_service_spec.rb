require 'rails_helper'

RSpec.describe CountriesService do
  describe '.get_countries' do
    it 'returns country results with the needed attributes', :vcr do
      response = CountriesService.get_countries

      expect(response).to be_an(Array)
      expect(response.first).to be_a(Hash)
      expect(response.first[:name]).to be_a(Hash)
      expect(response.first[:name][:common]).to be_a(String)
    end
  end
end
