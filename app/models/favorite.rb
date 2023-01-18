class Favorite < ApplicationRecord
  validates_presence_of :user_id, :country, :recipe_link, :recipe_title
  belongs_to :user
end