class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :account_id
      t.integer :client_id
      t.string :firstname
      t.string :lastname
      t.string :street
      t.integer :number
      t.integer :zipcode
      t.string :city
      t.string :state
      t.string :country
      t.integer :phone
      t.integer :order_id

      t.timestamps
    end
  end
end
