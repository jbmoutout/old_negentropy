require 'rest_client'

class Artwork < ActiveRecord::Base
  belongs_to :artist

  has_many :dialogs

  has_and_belongs_to_many :group_shows

  has_attached_file :picture,
    styles: { large: "500x500>", medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/

  # def initialize(dialog)
  #   @dialog = dialog
  # end

######################################################################################
##IN RAILS C: $ dialogs = Dialog.all THEN $ dialogs.each { |d| Artwork.save_tweets(d) } ##
######################################################################################


  def self.save_tweets(dialog)
    if dialog.text != nil
      artist_name = dialog.text.match(/(?<=: )(.*?),/)
      artist_name.split.map(&:capitalize).join(' ')
      artist_name &&= artist_name[1]
      artist = Artist.where(name: artist_name).first_or_create!

      name = dialog.text.match(/(["'])(?:(?=(\\?))\2.)*?\1/)
      name &&= name[0]
      date = dialog.text.match(/\d{2,4}/)
      date &&= date[0].to_i

      artwork = Artwork.where(artist: artist, name: name).first_or_create! do |artwork|
        artwork.date = date
      end


      artwork.dialogs << dialog

      artwork
    end
  end


    #TODO:

   def self.import(uri)
      response = RestClient.get (uri)

      response_hash = JSON.parse(response.body)

      response_hash['results']['collection1'].each do |artist|

        artist_name = artist['artist_name']

        temp = artist_name.dup
        artist_name.clear
        artist_name << temp.split.map(&:capitalize!).join(' ')

        artist      = Artist.where(name: artist_name).first_or_create!
      end

      response_hash['results']['collection1'].each do |artwork|

        name = artwork['title']
        puts "#{name} date?"
        date = gets.chomp
        puts "#{name} picture_url?"
        picture_url = gets.chomp

      end
    end




end