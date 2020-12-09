class RemoveParkingFromRoads < ActiveRecord::Migration[5.2]
  def change
    remove_column :roads, :parking?, :boolean
  end
end
