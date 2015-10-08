class BarLocation < ActiveRecord::Base
  geocoded_by :mappable
  after_validation :geocode
  has_one :location, as: :place

  def mappable
    name + ', ' + address + ', ' + city + ', ' + state
  end

  def nearby
    BarLocation.near(self) + OutdoorLocation.near(self)
  end

  def location_id
    location.id
  end
end
