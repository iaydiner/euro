class CreateGemstones < ActiveRecord::Migration
  def change
    create_table :gemstones do |t|
    	t.string :shape
    	t.string :size
    	t.string :description
    	t.string :colortone
    	t.decimal :price , :precision => 10, :scale => 2
    end
  end
end
