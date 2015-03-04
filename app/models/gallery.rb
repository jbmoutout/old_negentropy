require 'rest_client'

class Gallery < ActiveRecord::Base
  has_many :artists


  def self.import
    response = RestClient.get 'https://www.kimonolabs.com/api/dimi5wmu?apikey=u6sMzW1WypgPUjpDTCTuVrAaqqPpomOZ'

    response_hash = JSON.parse(response.body)

    gallery_name  = response_hash['name']
    gallery       = Gallery.where(name: gallery_name).first_or_create!

    response_hash['results']['collection1'].each do |artist|
      artist_name = artist['artist_list']['text']
      artist      = Artist.where(name: artist_name).first_or_create!

      unless gallery.artists.where(id: artist.id).exist?
        gallery.artists << artist
      end
    end

          # artist_name = r["results"]["collection1"][0]["artist_list"]["text"]
          # artist = Artist.where(name: artist_name).first_or_create!

          # gallery_name = r["name"]
          # gallery = Gallery.where(name: gallery_name).first_or_create!

    # artist.galleries << gallery

  end



end
