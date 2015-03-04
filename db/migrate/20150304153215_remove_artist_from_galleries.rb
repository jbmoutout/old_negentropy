class RemoveArtistFromGalleries < ActiveRecord::Migration
  def change
    remove_column :galleries, :artist_id
  end
end
