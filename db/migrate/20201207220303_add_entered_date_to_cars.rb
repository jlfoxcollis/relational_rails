class AddEnteredDateToCars < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :created_at, :datetime
  end
end
