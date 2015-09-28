class Location < ActiveRecord::Base
  has_many :checks
  has_many :trails, through: :checks
  belongs_to :place, polymorphic: true

  def mappable
    place.mappable
  end

  def name
    place.name
  end

  def trail
    place.trail
  end
end
