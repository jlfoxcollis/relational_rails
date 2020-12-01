class CreateDealer < ActiveRecord::Migration[5.2]
  def change
    create_table :dealers do |t|
      t.string :name
      t.string :city
      t.string :state
      t.datetime :created_at
    end
  end
end
