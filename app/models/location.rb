class Location < ActiveRecord::Base
  belongs_to :trail
  belongs_to :place, polymorphic: true
end
