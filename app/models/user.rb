class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true
  validates_uniqueness_of :name

  has_many :trails
  has_many :posts, as: :poster

  def feed
    posts.order('created_at DESC')
  end
end
