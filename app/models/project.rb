class Project < ActiveRecord::Base
  scope :three, -> { order(created_at: :desc).limit(3)}

  has_many :reviews

  validates :name, :presence => true
end
