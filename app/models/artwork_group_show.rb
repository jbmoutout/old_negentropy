class ArtworkGroupShow < ActiveRecord::Base
  belongs_to :artwork
  belongs_to :groupshow
end
