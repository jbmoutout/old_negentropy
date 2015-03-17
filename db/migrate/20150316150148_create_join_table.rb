class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :artworks, :groupshows do |t|
      t.index [:artwork_id, :groupshow_id]
      # t.index [:groupshow_id, :artwork_id]
    end
  end
end
