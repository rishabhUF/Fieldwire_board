class AddImageToFloorplans < ActiveRecord::Migration[5.1]
  def change
    add_column :floorplans, :image, :string
  end
end
