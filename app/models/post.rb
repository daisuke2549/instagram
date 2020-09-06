class Post < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_one_attached :image
    def avatar_image
    end
    
end