class OutdoorLocation < ActiveRecord::Base
  geocoded_by :name
  after_validation :geocode
  def mappable
    latitude + ", " + longitude + ", " + city + ", " + state
  end
end
