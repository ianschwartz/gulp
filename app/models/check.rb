class Check < ActiveRecord::Base
  belongs_to :trail
  belongs_to :location

  validates :trail_id, presence: true
  validates :location_id, presence: true

  def name
    location.name
  end

  def visible?(u)
    trail.permissions(u) || trail.over || checktype == "Prelube"
  end
end
