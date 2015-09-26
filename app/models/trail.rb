class Trail < ActiveRecord::Base
  validates :name, presence: true
  has_many :checks
  has_many :locations, through: :checks
end
