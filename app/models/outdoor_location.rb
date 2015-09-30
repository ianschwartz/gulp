class OutdoorLocation < ActiveRecord::Base
  geocoded_by :name
  after_validation :geocode
  def mappable
    latitude.to_s + "," + longitude.to_s
  end
end
