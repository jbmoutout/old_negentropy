class ArtistsGallery < ActiveRecord::Base
  belongs_to :artist
  belongs_to :gallery
end
