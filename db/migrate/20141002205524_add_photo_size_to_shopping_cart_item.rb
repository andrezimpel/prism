class AddPhotoSizeToShoppingCartItem < ActiveRecord::Migration
  def change
    add_column :shopping_cart_items, :photo_size_id, :integer
  end
end
