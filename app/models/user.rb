class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, :omniauth_providers => [ :twitter ]
  acts_as_voter

  def self.find_for_twitter_oauth(auth)
   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.name = auth.info.name
      user.image = auth.info.image
      user.token = auth.credentials.token
      user.secret = auth.credentials.secret
    end
  end
end
