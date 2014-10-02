class CreatePhotoSizes < ActiveRecord::Migration
  def change
    create_table :photo_sizes do |t|
      t.integer :account_id
      t.string :title

      t.timestamps
    end
  end
end
