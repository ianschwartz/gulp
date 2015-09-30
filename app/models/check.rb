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

  def start
    trail.start
  end

  def checklist
    trails.order(start: :desc)
  end

  def prelube
    trail.checks.first.location.place
  end

  def place
    location.place
  end

  def last_check
    trail.checks[0...-1].last
  end

  def mappable
    "#{last_check.location.latitude}, #{last_check.location.longitude}"
  end

  def nearby
    Location.near('Watertown, MA', 5)
  end
end
