class Artwork < ActiveRecord::Base
  belongs_to :artist

  has_many :dialogs

  has_attached_file :picture,
    styles: { large: "500x500>", medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/

  # def initialize(dialog)
  #   @dialog = dialog
  # end

  def self.save_tweets(dialog)
      artist_name = dialog.text.match(/(?<=: )(.*?),/)[0]
      artist = Artist.where(name: artist_name).first_or_create!

      name = dialog.text.match(/(["'])(?:(?=(\\?))\2.)*?\1/)[0]
      date = dialog.text.match(/\d{2,4}/)[0].to_i

      artwork = Artwork.where(artist: artist, name: name).first_or_create! do |artwork|
        artwork.date = date
      end

      artwork.dialogs << dialog

      artwork
  end


end