class CreateOrderTransactions < ActiveRecord::Migration
  def change
    create_table :order_transactions do |t|
      t.integer :order_id
      t.integer :amount
      t.datetime :success
      t.text :params
      t.string :message

      t.timestamps
    end
  end
end
