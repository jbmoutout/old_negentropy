class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.date :birthdate
      t.date :death_date
      t.string :description

      t.timestamps null: false
    end
  end
end
