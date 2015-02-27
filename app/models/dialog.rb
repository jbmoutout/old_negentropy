class Dialog < ActiveRecord::Base
  validates :tweet_id, presence: true, uniqueness: true
  acts_as_votable
end
