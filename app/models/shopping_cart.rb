class ShoppingCart < ActiveRecord::Base
  acts_as_shopping_cart

  belongs_to :client
  has_one :order

  scope :open, lambda { where(['ordered IS NULL']) }

  def taxes
    0.to_f
  end

  def tax_pct
    0.to_f
  end

  def shipping_cost
    0.to_f #5 # defines a flat $5 rate
  end

  def items
    return shopping_cart_items
  end
end
