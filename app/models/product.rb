class Product < ActiveRecord::Base

  scope :three, -> { order(created_at: :desc).limit(3)}

  scope :volantis, -> { where(origin: "Volantis") }

  scope :most_reviews, -> {(
    select("products.id, products.name, products.origin, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    .limit(1)
    )}

  has_many :reviews

  validates :name, :price, :origin, :presence => true
end
