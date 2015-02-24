class CreateArtworks < ActiveRecord::Migration
  def change
    create_table :artworks do |t|
      t.string :name
      t.date :date
      t.references :artist, index: true
      t.string :description

      t.timestamps null: false
    end
    add_foreign_key :artworks, :artists
  end
end
