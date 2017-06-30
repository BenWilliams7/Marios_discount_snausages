class Review < ActiveRecord::Base
  belongs_to :project

  validates :author, :presence => true
end
