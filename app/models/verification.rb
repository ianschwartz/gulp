class Verification < ActiveRecord::Base
  validates_uniqueness_of :verifier_id, :scope => :user_id
  belongs_to :verifier, class_name: "User"
  belongs_to :user
end
