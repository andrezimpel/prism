class AddGalleryIdToPost < ActiveRecord::Migration
  def change
    add_column :posts, :gallery_id, :integer
  end
end
