class CreateTools < ActiveRecord::Migration
  def change
    create_table :tools do |t|
      t.string :title
      t.text :short_desc
      t.text :long_desc

      t.timestamps null: false
    end
  end
end
