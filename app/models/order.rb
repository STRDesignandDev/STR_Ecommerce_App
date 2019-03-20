class Order < ApplicationRecord
  belongs_to :product
  belongs_to :user
  validates :user, presence: true
  validates :product, presence: true
end

def order_total
    @orders.count
end

def order_total_price
    @orders.product.sum(:price)
end
