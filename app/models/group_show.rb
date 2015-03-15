class GroupShow < ActiveRecord::Base
  belongs_to :gallery
  belongs_to :institution
  has_and_belongs_to_many :artworks
end
