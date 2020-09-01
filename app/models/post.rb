class Post < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_one_attached :avatar
    
    def avatar_image
    end
end