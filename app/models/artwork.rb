class Artwork < ActiveRecord::Base
  belongs_to :artist

  has_attached_file :picture,
    styles: { large: "500x500>", medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/

  def initialize(tweet)
    @tweet = tweet
  end

  def self.save_tweets(tweet)
    if tweet.attrs[:entities][:media]
      Artwork.create! ({
        :name => tweet.text.match(/(?<=: )(.*?),/),
        :date => tweet.text.match(/,\s*(\d+)/),
        :picture => tweet.attrs[:entities][:media][0][:media_url]
        })
    end
  end


end
