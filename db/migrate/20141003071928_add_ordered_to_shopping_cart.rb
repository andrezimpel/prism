class AddOrderedToShoppingCart < ActiveRecord::Migration
  def change
    add_column :shopping_carts, :ordered, :datetime
  end
end
