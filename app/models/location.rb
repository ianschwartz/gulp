class Location < ActiveRecord::Base
  has_many :checks, dependent: :destroy
  has_many :trails, through: :checks
  has_many :comments, as: :commentable
  belongs_to :place, polymorphic: true

  geocoded_by :mappable
  after_validation :geocode

  def mappable
    "#{latitude},#{longitude}"
  end

  def name
    place.name
  end

  def checklist
    checks.all.sort_by(&:start).reverse
  end

  def nearby
    place.nearby
  end
end
