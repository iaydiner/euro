class ChangeColNameType < ActiveRecord::Migration
  def change
  	rename_column :gemstones, :type, :gemtype
  end
end
