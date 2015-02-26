namespace :twitter do
  desc "Fetch tweets from @nonprintingc"
  task fetch_nonprintingc_dialogs: :environment do
    user = "nonprintingc"

    twitter_service = TwitterService.new
    tweets = twitter_service.get_all_tweets(user)
    puts "Found #{tweets.size} tweets for #{user}. Processing..."
    tweets.select { |t| t.attrs[:entities][:media].present? }.each do |tweet|
      begin
        CreateDialogFromTweetRunner.new(twitter_service.client, tweet).run
        puts tweet.text
      rescue Twitter::Error::NotFound
        puts "Could not find parent tweet for `#{tweet.text}`"
      end
    end
    puts "done"
  end
end