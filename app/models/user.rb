class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]
  acts_as_commontator
  acts_as_voter
  acts_as_votable dependent: :destroy

  has_many :videos, dependent: :destroy

  has_one_attached :pfp

  validates :pfp, content_type: ['image/png', 'image/jpg', 'image/jpeg'], size: { less_than: 5.megabytes , message: 'Thumbnail must be under 10 megabytes large' }

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    unless user
        user = User.create(
           email: data['email'],
           password: Devise.friendly_token[0,20]
           username: access_token.info.name,
           socialpfp: access_token.info.image,
           uid: access_token.uid
        )
    end
    user
  end
end
