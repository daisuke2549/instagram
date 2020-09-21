class Comment < ApplicationRecord
  belongs_to :account, optional: true
  belongs_to :post
  validates :content, presence: true
  validates :article_id, presence: true
end
