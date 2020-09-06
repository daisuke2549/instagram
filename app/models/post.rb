class Post < ApplicationRecord
    has_many :comments, dependent: :destroy
<<<<<<< HEAD
    has_one_attached :image
=======
    has_many_attached :avatar

>>>>>>> image_post
    def avatar_image
    end
    
end