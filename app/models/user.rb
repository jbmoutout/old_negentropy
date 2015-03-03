class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, :omniauth_providers => [ :twitter, :facebook ]
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
  def self.find_for_facebook_oauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      #user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.name = auth.info.name
      user.image = auth.info.image
      user.token = auth.credentials.token
      #user.token_expiry = Time.at(auth.credentials.expires_at)
    end
  end
end
