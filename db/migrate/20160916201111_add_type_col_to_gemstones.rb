class AddTypeColToGemstones < ActiveRecord::Migration
  def change
  	add_column :gemstones, :type, :string
  	add_column :gemstones, :brand, :string
  end
end
