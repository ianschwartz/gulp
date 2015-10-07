class Kennel < ActiveRecord::Base
  validates :name, presence: true
  validates :location, presence: true

  has_many :trails
  has_many :posts, as: :poster
  has_many :passive_relationships, class_name: "Relationship",
                                   as: :followable,
                                   dependent: :destroy
  has_many :followers, through: :passive_relationships,
                       source: :user,
                       foreign_key: :user_id

  def nearby
    BarLocation.near(self.location) + OutdoorLocation.near(self.location)
  end
end
