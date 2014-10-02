class ShoppingCartItem < ActiveRecord::Base
  acts_as_shopping_cart_item

  # association
  has_many :photos
  has_many :photo_photo_sizes
  has_one :photo_sizes, through: :photo_photo_sizes
end
