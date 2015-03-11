require 'rest_client'

class Gallery < ActiveRecord::Base
  has_and_belongs_to_many :artists

  #################################################################################
  ##IN RAILS C: REPLACE uri WITH THE PROPER KIMONO API GALLERY URL ' ' INLCUDED ##
  #################################################################################

  def self.import(uri)
    response = RestClient.get (uri)

    response_hash = JSON.parse(response.body)

    gallery_name  = response_hash['name']
    gallery       = Gallery.where(name: gallery_name).first_or_create!

    response_hash['results']['collection1'].each do |artist|

      artist_name = artist['property1']['text']

      temp = artist_name.dup
      artist_name.clear
      artist_name << temp.split.map(&:capitalize!).join(' ')

      artist      = Artist.where(name: artist_name).first_or_create!

      unless gallery.artists.where(id: artist.id).exists?
        gallery.artists << artist
      end
    end
  end
  #################################################################################
  #################################################################################
  #################################################################################

end
