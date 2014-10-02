class PhotoSize < ActiveRecord::Base

  # associations
  belongs_to :account
  has_many :shopping_cart_item

  has_many :photo_photo_sizes
  has_many :photos, through: :photo_photo_sizes
end
