module PexelsHelper
  def self.images_array(country)
    images_response = PexelsService.get_images(country)
    images_response[:photos].map do |image_hash|
      image_info_hash = {}
      image_info_hash[:alt_tag] = image_hash[:alt]
      image_info_hash[:url] = image_hash[:src][:original]
      image_info_hash
    end
  end
end