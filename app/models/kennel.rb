class Kennel < ActiveRecord::Base
  validates :name, presence: true
  validates :location, presence: true

  has_many :trails
  has_many :posts, as: :poster
end
