class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :title
      t.integer :user_id
      t.string :subdomain

      t.timestamps
    end
    add_index :accounts, :subdomain, unique: true
  end
end
