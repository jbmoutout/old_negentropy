class DropArtworkGroupShows < ActiveRecord::Migration
  def change
        drop_table :artwork_group_shows
  end
end
