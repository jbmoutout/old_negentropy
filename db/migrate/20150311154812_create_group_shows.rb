class CreateGroupShows < ActiveRecord::Migration
  def change
    create_table :group_shows do |t|
      t.string :name
      t.references :gallery, index: true
      t.references :institution, index: true

      t.timestamps null: false
    end
    add_foreign_key :group_shows, :galleries
    add_foreign_key :group_shows, :institutions
  end
end
