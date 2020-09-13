class Profile < ApplicationRecord
    belongs_to :user
    has_one_attached :image

    def avatar_image
    end
end
