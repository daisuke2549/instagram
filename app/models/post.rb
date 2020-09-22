class Post < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_one_attached :image
    has_many :likes, dependent: :destroy
    belongs_to :account, optional: true
    def avatar_image
    end
    def display_created_at
        I18n.l(self.created_at, format: :default)
    end
end