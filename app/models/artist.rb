class Artist < ActiveRecord::Base
  include AlgoliaSearch
  has_many :artworks

  algoliasearch do
    attribute :name, :birthdate, :death_date, :description
  end

end
