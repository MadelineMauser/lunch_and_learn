require 'rails_helper'

RSpec.describe YoutubeService do
  describe '.get_video' do
    xit 'returns video results for the inputted country with the needed attributes', :vcr do
      response = YoutubeService.get_video("france")

      expect(response).to be_a(Hash)
      expect(response[:items]).to be_an(Array)
      expect(response[:items].first).to be_a(Hash)
      expect(response[:items].first[:id]).to be_a(Hash)
      expect(response[:items].first[:id][:videoId]).to be_a(String)
      expect(response[:items].first[:snippet]).to be_a(Hash)
      expect(response[:items].first[:snippet][:title]).to be_a(String)
    end
  end
end
