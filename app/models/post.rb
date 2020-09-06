class Post < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many_attached :avatar

    def avatar_image
        if post&.avatar&.attached?
          post.avatar
        else
          'default-avatar.png'
        end
    end
end