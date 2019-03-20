class Product < ApplicationRecord
  has_many :orders
  has_many :comments
  validates :name, presence: true

  def self.search(search_term)
    if Rails.env.production?
      Product.where("name ilike ?", "%#{search_term}%")
      # Product.where("name ilike ? OR description ilike ? ", "%#{search_term}%", "%#{search_term}%")
    else
      Product.where("name LIKE ?", "%#{search_term}%")
    end
  end

  def self.find_birdtype(birdtype)
    search_verb = Rails.env.production? ? "ilike" : "LIKE"
    Product.where("birdtype #{search_verb} ?", "%#{birdtype}%")
  end

  def highest_rating_comment
    comments.rating_desc.first
  end

  def order_total_price
    price.sum
  end

  def views
    $redis.get("product:#{id}")
  end

  def viewed!
    $redis.incr("product:#{id}")
  end

  def lowest_rating_comment
    comments.rating_desc.last
  end

  def average_rating
    comments.average(:rating).to_f
  end

end
