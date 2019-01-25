class Comment < ApplicationRecord
  belongs_to :posts, required: false
  validates :name, presence: true
  validates :email, presence: true
  validates :body, presence: true
  validates :post_id, presence: true
end
