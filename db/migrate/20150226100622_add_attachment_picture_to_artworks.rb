class AddAttachmentPictureToArtworks < ActiveRecord::Migration
  def self.up
    change_table :artworks do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :artworks, :picture
  end
end
