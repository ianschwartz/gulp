class Post < ActiveRecord::Base
  belongs_to :poster, polymorphic: true
end
