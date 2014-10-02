class CreatePhotoPhotoSizes < ActiveRecord::Migration
  def change
    create_table :photo_photo_sizes do |t|
      t.integer :photo_id
      t.integer :photo_size_id

      t.timestamps
    end
    add_index :photo_photo_sizes, :photo_id
    add_index :photo_photo_sizes, :photo_size_id
  end
end
