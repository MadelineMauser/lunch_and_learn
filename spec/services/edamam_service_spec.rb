require 'rails_helper'

RSpec.describe "Edamam Service" do
  describe '.get_recipes' do
    it 'returns recipe results for the inputted country with the needed attributes' do
      response = EdamamService.get_recipes(france)

      expect(response).to be_a(Hash)
      expect(response[:hits]).to be_an(Array)
      expect(response[:hits].first).to be_a(Hash)
      expect(response[:hits].first[:recipe]).to be_a(Hash)
      expect(response[:hits].first[:recipe][:uri]).to be_a(String)
      expect(response[:hits].first[:recipe][:label]).to be_a(String)
      expect(response[:hits].first[:recipe][:image]).to be_a(String)
    end
  end
end
