class Artist < ActiveRecord::Base
  validates :name, uniqueness: true
  has_many :artworks
end
