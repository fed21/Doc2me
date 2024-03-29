class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :confirmable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]


  has_many :kids
  has_many :visits
  

  def self.from_omniauth(access_token)

    data = access_token.info
    user = User.where(email: data['email']).first
    unless user
      user = User.create( email: data['email'],password: Devise.friendly_token[0,20],nome:data['first_name'] ,
      cognome:data['last_name'] )
    end
    user
  end
end


