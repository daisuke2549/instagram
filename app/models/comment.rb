class Comment < ApplicationRecord
  belongs_to :account
  belongs_to :post
  validates :body, presence: true, length: { maximum: 65_535 }
end
