class ShoppingCartItem < ActiveRecord::Base
  acts_as_shopping_cart_item

  # association
  has_many :photos
end
