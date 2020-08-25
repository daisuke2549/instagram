class Post < ApplicationRecord
    has_many :comments, dependent: :destroy
    mount_uploader :img, ImgUploader
    has_one_attached :avatar
end
