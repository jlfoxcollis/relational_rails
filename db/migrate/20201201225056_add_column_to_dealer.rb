class AddColumnToDealer < ActiveRecord::Migration[5.2]
  def change
    add_column :dealers, :open, :boolean
  end
end
