class AddArtworkToDialog < ActiveRecord::Migration
  def change
    add_reference :dialogs, :artwork, index: true
    add_foreign_key :dialogs, :artworks
  end
end
