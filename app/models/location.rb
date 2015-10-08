class Location < ActiveRecord::Base
  has_many :checks, dependent: :destroy
  has_many :trails, through: :checks
  has_many :comments, as: :commentable
  belongs_to :place, polymorphic: true, dependent: :destroy


  def mappable
    "#{latitude},#{longitude}"
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

  def checklist
    checks.all.sort_by(&:start).reverse
  end

  def nearby
    BarLocation.near(self.mappable).map {|x| [x.name, "Location:#{x.location.id}"]} + OutdoorLocation.near(self.mappable).map {|x| [x.name, "Location:#{x.location.id}"]}
  end
end
