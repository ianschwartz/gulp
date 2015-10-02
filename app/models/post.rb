class Post < ActiveRecord::Base
  belongs_to :poster, polymorphic: true
  has_many :comments, as: :commentable, dependent: :destroy
end
