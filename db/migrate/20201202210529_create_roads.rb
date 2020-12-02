class CreateRoads < ActiveRecord::Migration[5.2]
  def change
    create_table :roads do |t|
      t.string :name
      t.boolean :parking?
      t.boolean :open?
      t.datetime :date_created
      t.integer :lanes
    end
  end
end
