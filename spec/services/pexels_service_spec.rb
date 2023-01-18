require 'rails_helper'

RSpec.describe PexelsService do
  describe '.get_images' do
    it 'returns image results for the inputted country with the needed attributes', :vcr do
      response = PexelsService.get_images("france")
      
      expect(response).to be_a(Hash)
      expect(response[:photos]).to be_an(Array)
      expect(response[:photos].first).to be_a(Hash)
      expect(response[:photos].first[:src]).to be_a(Hash)
      expect(response[:photos].first[:src][:original]).to be_a(String)
      expect(response[:photos].first[:alt]).to be_a(String)
    end
  end
end
