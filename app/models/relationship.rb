class Relationship < ActiveRecord::Base
  belongs_to :followable, polymorphic: true
  belongs_to :user
  validates :user_id, presence: true
  validates :followable_id, presence: true
end
