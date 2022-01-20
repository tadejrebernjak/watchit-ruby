class Video < ApplicationRecord
    belongs_to :user
    acts_as_commontable dependent: :destroy
    acts_as_votable dependent: :destroy
    acts_as_punchable

    validates :title, presence: true
    
    has_one_attached :videoFile
    has_one_attached :thumbnail

    validates :videoFile, attached: true, content_type: 'video/mp4', size: { less_than: 50.megabytes , message: 'Video must be under 50 megabytes large' }
    validates :thumbnail, content_type: ['image/png', 'image/jpg', 'image/jpeg'], size: { less_than: 10.megabytes , message: 'Thumbnail must be under 10 megabytes large' }
end
