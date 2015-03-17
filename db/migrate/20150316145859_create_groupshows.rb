class CreateGroupshows < ActiveRecord::Migration
  def change
    create_table :groupshows do |t|
      t.string :name
      t.references :gallery, index: true
      t.references :institution, index: true

      t.timestamps null: false
    end
    add_foreign_key :groupshows, :galleries
    add_foreign_key :groupshows, :institutions
  end
end
