class AddClientIdToShoppingCart < ActiveRecord::Migration
  def change
    add_column :shopping_carts, :client_id, :integer
  end
end
