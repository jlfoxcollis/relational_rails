class AddUpdateToDealer < ActiveRecord::Migration[5.2]
  def change
    change_table :dealers do |t|
      t.datetime :updated_at
    end
  end
end
