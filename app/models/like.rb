class Like < ApplicationRecord
    belongs_to :account
    belongs_to :post
    validates :account_id, presence: true
end
