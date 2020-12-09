class RemoveDrivingFromCars < ActiveRecord::Migration[5.2]
  def change
    remove_column :cars, :driving?, :boolean
  end
end
