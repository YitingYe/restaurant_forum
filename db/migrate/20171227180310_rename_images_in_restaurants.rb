class RenameImagesInRestaurants < ActiveRecord::Migration[5.1]
  def change
    rename_column :restaurants, :images, :image
  end
end
