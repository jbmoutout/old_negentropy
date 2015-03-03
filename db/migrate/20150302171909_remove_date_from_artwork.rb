class RemoveDateFromArtwork < ActiveRecord::Migration
  def change
    remove_column :artworks, :date, :date
  end
end
