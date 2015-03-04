class AddPictureUrlToArtworks < ActiveRecord::Migration
  def change
    add_column :artworks, :picture_url, :string
  end
end
