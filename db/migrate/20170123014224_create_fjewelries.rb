class CreateFjewelries < ActiveRecord::Migration
  def change
    create_table :fjewelries do |t|
      t.string :title
      t.text :short_desc
      t.text :long_desc
      t.string :sku
      t.decimal :price, precision: 10, scale: 2
      t.string :jewelry_type
      t.string :metal
      t.string :color

      t.timestamps null: false
    end
  end
end
