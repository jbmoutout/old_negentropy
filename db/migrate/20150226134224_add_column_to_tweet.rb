class AddColumnToTweet < ActiveRecord::Migration
  def change
    add_column :tweets, :text, :string
    add_column :tweets, :date, :date
    add_column :tweets, :tweet_id, :integer
    add_column :tweets, :img_url, :string
  end
end
