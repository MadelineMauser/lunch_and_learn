require 'securerandom'

module ApiKeyHelper
  def self.new_key
    key = SecureRandom.hex(15)
    until User.exists?(api_key: key) == false
      key = SecureRandom.hex(15)
    end
    key
  end
end