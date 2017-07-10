class Review < ActiveRecord::Base
  belongs_to :project

  validates :author, :presence => true
  validates_numericality_of :rating, { greater_than_or_equal_to: 1, less_than_or_equal_to: 5, :presence => true }
  validates :content_body, { length: { in: 50..250 }, :presence => true }


end
