class Artist < ActiveRecord::Base

  include AlgoliaSearch
  validates :name, uniqueness: true
  has_many :artworks

  algoliasearch do
    attribute :name, :birthdate, :death_date, :description
  end

end
