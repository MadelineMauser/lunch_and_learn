require 'rails_helper'

RSpec.describe PexelsService do
  describe '.get_images' do
    xit 'returns image results for the inputted country with the needed attributes', :vcr do
      response = PexelsService.get_images("france")

      expect(response).to be_a(Hash)
      expect(response[:photos]).to be_an(Array)
      expect(response[:items].first).to be_a(Hash)
      expect(response[:items].first[:src]).to be_a(Hash)
      expect(response[:items].first[:src][:original]).to be_a(String)
      expect(response[:items].first[:alt]).to be_a(String)
    end
  end
end
