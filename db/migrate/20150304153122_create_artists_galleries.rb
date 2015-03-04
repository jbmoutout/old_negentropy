class CreateArtistsGalleries < ActiveRecord::Migration
  def change
    create_table :artists_galleries do |t|
      t.references :artist, index: true
      t.references :gallery, index: true

      t.timestamps null: false
    end
    add_foreign_key :artists_galleries, :artists
    add_foreign_key :artists_galleries, :galleries
  end
end
