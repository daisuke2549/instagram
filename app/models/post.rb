class Post < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_one_attached :image
    has_many :likes, dependent: :destroy
    belongs_to :account, optional: true
    has_many :comments, dependent: :destroy
    validates :content, presence: true
    def avatar_image
    end
end