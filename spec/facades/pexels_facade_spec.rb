require 'rails_helper'

RSpec.describe PexelsFacade do
  it '.images_array', :vcr do
    images = PexelsFacade.images_array("france")

    expect(images).to be_an(Array)
    expect(images.count).to be <= 10
    expect(images.first).to be_a(Hash)
    expect(images.first[:alt_tag]).to be_a(String)
    expect(images.first[:url]).to be_a(String)
  end
end