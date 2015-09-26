class OutdoorLocation < ActiveRecord::Base
  def mappable
    "#{self.longitude}, #{self.latitude}"
  end
end
