class AddTrucksToDealer < ActiveRecord::Migration[5.2]
  def change
    add_reference :trucks, :dealer, foreign_key: true
  end
end
