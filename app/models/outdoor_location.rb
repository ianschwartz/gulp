class OutdoorLocation < ActiveRecord::Base
  geocoded_by :name
  after_validation :geocode
  def mappable
    name + ", " + city + ", " + state
  end
end
