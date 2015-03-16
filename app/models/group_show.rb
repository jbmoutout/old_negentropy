class GroupShow < ActiveRecord::Base
  belongs_to :gallery
  belongs_to :institution
  has_many :artworks
end
