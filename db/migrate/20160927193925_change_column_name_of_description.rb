class ChangeColumnNameOfDescription < ActiveRecord::Migration
  def change
  	rename_column :gemstones, :description, :stone
  end
end
