class Comment < ActiveRecord::Base
  validates :user_id, presence: true
  validates :body, presence: true

  belongs_to :commentable, polymorphic: true
  belongs_to :user

  default_scope, -> order('created_at DESC')
end
