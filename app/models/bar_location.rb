class BarLocation < ActiveRecord::Base
  geocoded_by :mappable
  after_validation :geocode

  def mappable
    name + ', ' + address + ', ' + city + ', ' + state
  end

  def nearby
    BarLocation.near(self) + OutdoorLocation.near(self)
  end
end
