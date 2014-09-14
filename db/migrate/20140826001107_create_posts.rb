class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.integer :account_id
      t.string :permalink

      t.timestamps
    end
    add_index :posts, :title
    add_index :posts, :account_id
    add_index :posts, :permalink
  end
end
