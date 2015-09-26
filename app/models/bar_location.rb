class BarLocation < ActiveRecord::Base
  def mappable
    self.address
  end
end
