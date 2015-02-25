class ArtworkPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  class Scope < Scope
    def resolve
      output = { status: [] }
      client = Twitter::REST::Client.new do |config|
        config.consumer_key = ENV['TWITTER_KEY']
        config.consumer_secret = ENV['TWITTER_SECRET']
        config.access_token = ENV['TWITTER_TOKEN']
        config.access_token_secret = ENV['TWITTER_TOKEN_SECRET']
      end
      output[:timeline] = client.user_timeline("nonprintingc")
      output[:timeline].each do |tweet|
        unless tweet.in_reply_to_status_id.nil?
          begin
            output[:status] << client.status(tweet.in_reply_to_status_id)
          rescue
          end
        end
      end
      output
    end
  end
end
