class AddIdToTweet < ActiveRecord::Migration
  def change
    add_column :tweets, :tweet_id, :string
  end
end
