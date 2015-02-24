

class ArtworksController < ApplicationController


  def tweet(tweet)
    @twitter = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['TWITTER_KEY']
      config.consumer_secret = ENV['TWITTER_SECRET']
      config.access_token = ENV['TWITTER_TOKEN']
      config.access_token_secret = ENV['TWITTER_TOKEN_SECRET']
    end

    client.update(tweet)
  end

  def new

  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index

  end

  def show
  end
end
