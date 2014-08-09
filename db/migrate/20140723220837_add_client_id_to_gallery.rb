class AddClientIdToGallery < ActiveRecord::Migration
  def change
    add_column :galleries, :client_id, :integer
    add_index :galleries, :client_id
  end
end
