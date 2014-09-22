class AddPortfolioToGallery < ActiveRecord::Migration
  def change
    add_column :galleries, :portfolio, :boolean
    add_index :galleries, :portfolio
  end
end
