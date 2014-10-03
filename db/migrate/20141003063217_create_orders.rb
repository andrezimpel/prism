class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :account_id
      t.integer :client_id
      t.string :state
      t.integer :amount
      t.integer :address_id
      t.integer :shopping_cart_id
      t.string :ip_address
      t.datetime :card_expires_on

      t.timestamps
    end
  end
end
