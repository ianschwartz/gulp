class Location < ActiveRecord::Base
  has_many :checks
  has_many :trails, through: :checks
  belongs_to :place, polymorphic: true

  def mappable
    place.mappable
  end

  def latitude
    place.latitude
  end

  def longitude
    place.longitude
  end

  def name
    place.name
  end

  def trail
    place.trail
  end
end
