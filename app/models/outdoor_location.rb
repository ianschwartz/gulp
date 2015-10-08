class OutdoorLocation < ActiveRecord::Base
  geocoded_by :mappable
  after_validation :geocode, if: :no_lat_or_long?
  has_one :location, as: :place

  def mappable
    "#{name}, #{city}, #{state}"
  end

  def nearby
    BarLocation.near(self) + OutdoorLocation.near(self)
  end

  def location_id
    location.id
  end

  private

  def no_lat_or_long?
    latitude == nil || longitude == nil
  end 
end
