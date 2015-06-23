class CreateInsta < ActiveRecord::Migration
  def change
    create_table :insta do |t|
      t.string :ig_username
      t.string :ig_fullname
      t.string :ig_text
      t.date :date
      t.string :ig_img_url
      t.string :ig_user_profilpic_url
      t.string :ig_location

      t.timestamps null: false
    end
  end
end
