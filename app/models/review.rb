class Review < ActiveRecord::Base
  belongs_to :project

  validates :author, :rating, :presence => true
  validates :content_body, { length: { in: 50..250 }, :presence => true }


end
