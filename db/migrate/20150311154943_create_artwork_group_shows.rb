class CreateArtworkGroupShows < ActiveRecord::Migration
  def change
    create_table :artwork_group_shows do |t|
      t.references :artwork, index: true
      t.references :group_show, index: true

      t.timestamps null: false
    end
    add_foreign_key :artwork_group_shows, :artworks
    add_foreign_key :artwork_group_shows, :group_shows
  end
end
