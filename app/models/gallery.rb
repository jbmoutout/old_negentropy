require 'rest_client'

class Gallery < ActiveRecord::Base
  has_many :artists


  def self.save_gallery

    response = RestClient.get 'https://www.kimonolabs.com/api/dimi5wmu?apikey=u6sMzW1WypgPUjpDTCTuVrAaqqPpomOZ'

    r = JSON.parse(response.body)

          artist_name = r["results"]["collection1"][0]["artist_list"]["text"]
          artist = Artist.where(name: artist_name).first_or_create!

          gallery_name = r["name"]
          gallery = Gallery.where(name: gallery_name).first_or_create!

    artist.galleries << gallery

  end



end
