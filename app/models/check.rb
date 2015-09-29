class Check < ActiveRecord::Base
  belongs_to :trail
  belongs_to :location

  validates :trail_id, presence: true
  validates :location_id, presence: true

  def name
    location.name
  end
end
