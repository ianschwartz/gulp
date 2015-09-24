class Trail < ActiveRecord::Base
  validates :name, presence: true
end
