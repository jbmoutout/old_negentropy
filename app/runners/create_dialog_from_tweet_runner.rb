class CreateDialogFromTweetRunner
  def initialize(client, tweet)
    @client = client
    @tweet = tweet
  end

  def run
    return if has_no_parent_tweet?

    original_tweet = @client.status(@tweet.in_reply_to_status_id)
    Dialog.create({
      text: @tweet.text,
      date: @tweet.created_at,
      tweet_id: @tweet.id,
      img_url: @tweet.attrs[:entities][:media][0][:media_url],
      origin_user: original_tweet.attrs[:user][:name],
      origin_screen_name: original_tweet.attrs[:user][:screen_name],
      origin_profilpic_url: original_tweet.attrs[:user][:profile_image_url],
      origin_text: original_tweet.text,
      origin_date: original_tweet.created_at
    })
  end

  private

  def has_no_parent_tweet?
    @tweet.in_reply_to_status_id.blank?
  end
end