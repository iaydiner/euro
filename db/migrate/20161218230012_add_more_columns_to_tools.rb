class AddMoreColumnsToTools < ActiveRecord::Migration
  def change
  	add_column :tools, :sku, :string
  	add_column :tools, :price, :decimal, :precision => 10, :scale => 2
  	add_column :tools, :brand, :string
  	add_column :tools, :weight, :string
  	add_column :tools, :height, :string
  	add_column :tools, :width, :string
  	add_column :tools, :color, :string
  	add_column :tools, :metal, :string
  	add_column :tools, :whatt, :string
  	add_column :tools, :measuringrange, :string
  	add_column :tools, :battery, :string
  	add_column :tools, :usedwith, :string
  	add_column :tools, :depth, :string
  end
end
