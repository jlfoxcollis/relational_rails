class CreateTrucks < ActiveRecord::Migration[5.2]
  def change
    create_table :trucks do |t|
      t.integer :year
      t.string :make
      t.string :model
    end
  end
end
