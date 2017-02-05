class AddAttachmentFjewelryImgToFjewelries < ActiveRecord::Migration
  def self.up
    change_table :fjewelries do |t|
      t.attachment :fjewelry_img
    end
  end

  def self.down
    remove_attachment :fjewelries, :fjewelry_img
  end
end
