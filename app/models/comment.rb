class Comment < ApplicationRecord
  has_many :comments
  belongs_to :user
  belongs_to :product
  scope :rating_desc, -> { order(rating: :desc) }
end
