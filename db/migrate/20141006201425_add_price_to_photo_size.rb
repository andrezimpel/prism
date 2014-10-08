class AddPriceToPhotoSize < ActiveRecord::Migration
  def change
    add_column :photo_sizes, :price, :integer
    # add_money :photo_sizes, :price
  end
end
