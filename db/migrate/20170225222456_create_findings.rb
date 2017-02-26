class CreateFindings < ActiveRecord::Migration
  def change
    create_table :findings do |t|
      t.string :title
      t.text :short_desc
      t.text :long_desc
      t.string :sku
      t.decimal :price, precision: 10, scale: 2
      t.string :finding_type
      t.string :metal
      t.string :color

      t.timestamps null: false
    end
  end
end
