class Project < ActiveRecord::Base
  scope :three, -> { order(created_at: :desc).limit(3)}

  scope :most_reviews, -> {(
    select("projects.id, projects.name, projects.description, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("projects.id")
    .order("reviews_count DESC")
    )}

  has_many :reviews

  validates :name, :presence => true
end
