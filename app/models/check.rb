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
    trail.last_check
  end

  def goodchecks?
    trail.goodchecks.any?
  end

  def mappable
    "#{last_check.location.latitude}, #{last_check.location.longitude}"
  end

  def nearby
    location.nearby
  end
end
