class Location < ActiveRecord::Base
  has_many :checks
  has_many :trails, through: :checks
  belongs_to :place, polymorphic: true

  def mappable
    self.place.mappable
  end

  def name
    self.place.name
  end
end
