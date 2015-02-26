class AddOriginToTweet < ActiveRecord::Migration
  def change
    add_column :tweets, :origin_profilpic_url, :string
    add_column :tweets, :origin_user, :string
    add_column :tweets, :origin_screen_name, :string
    add_column :tweets, :origin_text, :string
    add_column :tweets, :origin_date, :string
  end
end
