class Video < ApplicationRecord
    belongs_to :user
    acts_as_commontable dependent: :destroy

    validates :title, presence: true
    validates :file, presence: true
    validates :thumbnail, presence: true

end
