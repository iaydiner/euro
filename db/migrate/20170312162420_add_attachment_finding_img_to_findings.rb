class AddAttachmentFindingImgToFindings < ActiveRecord::Migration
  def self.up
    change_table :findings do |t|
      t.attachment :finding_img
    end
  end

  def self.down
    remove_attachment :findings, :finding_img
  end
end
