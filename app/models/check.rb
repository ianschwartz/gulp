class Check < ActiveRecord::Base
  belongs_to :trail
  belongs_to :location
end
