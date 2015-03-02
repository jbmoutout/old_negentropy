class AddDateToArtwork < ActiveRecord::Migration
  def change
    add_column :artworks, :date, :integer
  end
end
