class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :name
      t.references :artist, index: true

      t.timestamps null: false
    end
    add_foreign_key :galleries, :artists
  end
end
