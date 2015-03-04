class Artist < ActiveRecord::Base

  include AlgoliaSearch
  validates :name, uniqueness: true
  has_many :artworks
  has_many :galleries

  algoliasearch index_name: "Artist#{ENV['ALGOLIA_SUFFIX']}" do
    attribute :name, :description, :birthdate, :death_date

    attributesToIndex ['name', 'unordered(birthdate)' ]
  end

end
