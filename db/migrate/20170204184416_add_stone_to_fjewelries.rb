class AddStoneToFjewelries < ActiveRecord::Migration
  def change
    add_column :fjewelries, :stone, :string
  end
end
