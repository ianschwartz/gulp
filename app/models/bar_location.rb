class BarLocation < ActiveRecord::Base
  geocoded_by :mappable
  after_validation :geocode

  def mappable
    address + ', ' + city + ', ' + state
  end
end