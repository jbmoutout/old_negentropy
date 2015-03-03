class Dialog < ActiveRecord::Base
  belongs_to :artwork

  validates :tweet_id, presence: true, uniqueness: true
  acts_as_votable
end
