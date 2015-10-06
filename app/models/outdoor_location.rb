class OutdoorLocation < ActiveRecord::Base
  geocoded_by :mappable
  after_validation :geocode

  def mappable
    name + latitude.to_s + "," + longitude.to_s
  end

  def nearby
    BarLocation.near(self) + OutdoorLocation.near(self)
  end
end
