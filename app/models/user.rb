class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  acts_as_commontator
  acts_as_voter

  has_many :videos, dependent: :destroy

  has_one_attached :pfp

  validates :pfp, content_type: ['image/png', 'image/jpg', 'image/jpeg'], size: { less_than: 5.megabytes , message: 'Thumbnail must be under 10 megabytes large' }
end
